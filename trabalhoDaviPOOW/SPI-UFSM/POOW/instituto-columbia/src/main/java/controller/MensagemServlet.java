package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import model.Mensagem;
import service.MensagemService;
import model.Usuario;

import java.io.IOException;
import java.util.List;

@WebServlet("/mensagem")
public class MensagemServlet extends HttpServlet {

    private MensagemService service = new MensagemService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {


        String idStr = req.getParameter("id");
        String nome = req.getParameter("nome");
        String email = req.getParameter("email");
        String assunto = req.getParameter("assunto");
        String mensagemTexto = req.getParameter("mensagem");


        if (nome == null || nome.isEmpty() ||
                email == null || email.isEmpty() ||
                mensagemTexto == null || mensagemTexto.isEmpty()) {

            req.setAttribute("erro", "Preencha todos os campos obrigatórios");

            req.getRequestDispatcher("WEB-INF/mensagens.jsp").forward(req, resp);
            return;
        }

        Mensagem m = new Mensagem(nome, email, assunto, mensagemTexto);

        try {

            if (idStr != null && !idStr.isEmpty()) {
                m.setId(Integer.parseInt(idStr));

                boolean atualizou = service.atualizar(m);

                if (atualizou) {
                    resp.sendRedirect(req.getContextPath() + "/mensagem?msg=editado");
                } else {
                    req.setAttribute("erro", "Não foi possível atualizar a mensagem.");
                    req.getRequestDispatcher("WEB-INF/mensagens.jsp").forward(req, resp);
                }
            }

            else {
                boolean inseriu = service.inserir(m);

                if (inseriu) {

                    resp.sendRedirect(req.getContextPath() + "/mensagem?msg=salvo");
                } else {
                    req.setAttribute("erro", "Não foi possível salvar a mensagem.");
                    req.getRequestDispatcher("WEB-INF/mensagens.jsp").forward(req, resp);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("erro", "Erro ao processar mensagem: " + e.getMessage());
            req.getRequestDispatcher("WEB-INF/mensagens.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();
        Object usuarioObj = session.getAttribute("usuario");

        if (usuarioObj == null) {
            resp.sendRedirect("index.jsp");
            return;
        }

        Usuario usuario = (Usuario) usuarioObj;
        if (!"ADMIN".equals(usuario.getPermissao())) {
            resp.sendRedirect("index.jsp");
            return;
        }

        String acao = req.getParameter("acao");
        String idStr = req.getParameter("id");

        try {
            if (acao != null && idStr != null) {
                int id = Integer.parseInt(idStr);

                if ("excluir".equals(acao)) {
                    service.excluir(id);

                    resp.sendRedirect(req.getContextPath() + "/mensagem?msg=excluido");
                    return;
                }

                if ("editar".equals(acao)) {
                    Mensagem m = service.buscarPorId(id);
                    req.setAttribute("mensagemEditar", m);
                }
            }

            List<Mensagem> lista = service.listar();
            System.out.println("Mensagens encontradas: " + lista.size());
            req.setAttribute("mensagens", lista);

            RequestDispatcher rd = req.getRequestDispatcher("WEB-INF/mensagens.jsp");
            rd.forward(req, resp);

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("erro", "Erro ao processar mensagens: " + e.getMessage());
            req.getRequestDispatcher("index.jsp").forward(req, resp);
        }
    }
}
