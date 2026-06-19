package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Projeto;
import model.Usuario;
import service.ProjetoService;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

@WebServlet("/projeto")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024,
        maxFileSize = 5 * 1024 * 1024,
        maxRequestSize = 10 * 1024 * 1024
)
public class ProjetoServlet extends HttpServlet {

    private ProjetoService service = new ProjetoService();

    private boolean podeAlterarProjeto(Usuario usuario, Projeto projeto) {

        boolean ehDono = projeto.getId_usuario() == usuario.getId();

        boolean ehAdmin = "ADMIN".equals(usuario.getPermissao());

        return ehDono || ehAdmin;
    }

    private String salvarImagem(HttpServletRequest req) throws IOException, ServletException {
        Part arquivo = req.getPart("imagemArquivo");

        if (arquivo == null || arquivo.getSize() == 0) {
            return null;
        }

        String contentType = arquivo.getContentType();
        if (contentType == null || !contentType.startsWith("image/")) {
            throw new ServletException("O arquivo enviado precisa ser uma imagem.");
        }

        String nomeOriginal = Paths.get(arquivo.getSubmittedFileName()).getFileName().toString();
        String extensao = "";
        int ponto = nomeOriginal.lastIndexOf('.');
        if (ponto >= 0) {
            extensao = nomeOriginal.substring(ponto).toLowerCase();
        }

        String nomeArquivo = UUID.randomUUID() + extensao;
        String pastaRelativa = "/images/projetos";
        String pastaDestino = getServletContext().getRealPath(pastaRelativa);

        if (pastaDestino == null) {
            throw new ServletException("Nao foi possivel localizar a pasta de imagens do servidor.");
        }

        File diretorio = new File(pastaDestino);
        if (!diretorio.exists() && !diretorio.mkdirs()) {
            throw new ServletException("Nao foi possivel criar a pasta de imagens dos projetos.");
        }

        arquivo.write(new File(diretorio, nomeArquivo).getAbsolutePath());
        return pastaRelativa + "/" + nomeArquivo;
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("usuario") == null) {
            resp.sendRedirect("index.jsp");
            return;
        }
        Usuario usuarioLogado = (Usuario) session.getAttribute("usuario");
        String acao = req.getParameter("acao");
        if ("editar".equals(acao)) {
            int id = Integer.parseInt(req.getParameter("id"));
            Projeto p = service.buscarPorId(id);
            if (!podeAlterarProjeto(usuarioLogado, p)) {

                resp.sendError(HttpServletResponse.SC_FORBIDDEN);

                return;
            }
            req.setAttribute("projeto", p);
        }

        if ("excluir".equals(acao)) {
            int id = Integer.parseInt(req.getParameter("id"));
            Projeto p = service.buscarPorId(id);
            if (!podeAlterarProjeto(usuarioLogado, p)) {

                resp.sendError(HttpServletResponse.SC_FORBIDDEN);

                return;
            }
            service.excluir(id);
            resp.sendRedirect("projeto?msg=excluido");
            return;
        }

        List<Projeto> lista = service.listar();
        req.setAttribute("projetos", lista);

        RequestDispatcher rd = req.getRequestDispatcher("WEB-INF/projetos.jsp");

        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);


        if (session == null || session.getAttribute("usuario") == null) {
            resp.sendRedirect("index.jsp");
            return;
        }

        Usuario usuarioLogado = (Usuario) session.getAttribute("usuario");
        Integer idUsuario = usuarioLogado.getId();

        String idParam = req.getParameter("id");
        String titulo = req.getParameter("titulo");
        String descricao = req.getParameter("descricao");
        String categoria = req.getParameter("categoria");
        String imagemUrl = req.getParameter("imagemAtual");
        String novaImagemUrl = salvarImagem(req);

        if (novaImagemUrl != null) {
            imagemUrl = novaImagemUrl;
        }

        LocalDate dataInicio = LocalDate.parse(req.getParameter("dataInicio"));
        LocalDate dataTermino = null;
        if (req.getParameter("dataTermino") != null && !req.getParameter("dataTermino").isEmpty()) {
            dataTermino = LocalDate.parse(req.getParameter("dataTermino"));
        }

        Projeto p = new Projeto(titulo, descricao, categoria, imagemUrl, dataInicio, dataTermino, idUsuario);

        if (idParam != null && !idParam.isEmpty()) {
            int idProjeto = Integer.parseInt(idParam);

            Projeto projetoOriginal = service.buscarPorId(idProjeto);

            if (!podeAlterarProjeto(usuarioLogado, projetoOriginal)) {

                resp.sendError(HttpServletResponse.SC_FORBIDDEN);

                return;
            }
            p.setId(idProjeto);
            p.setId_usuario(projetoOriginal.getId_usuario());
            service.atualizar(p);
            resp.sendRedirect("projeto?msg=editado");
        } else {
            service.inserir(p);
            resp.sendRedirect("projeto?msg=salvo");
        }
    }

}