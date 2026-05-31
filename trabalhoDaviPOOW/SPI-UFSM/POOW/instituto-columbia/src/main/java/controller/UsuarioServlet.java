package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import model.Mensagem;
import model.Usuario;
import service.UsuarioService;

import java.io.IOException;
import java.util.List;

@WebServlet("/usuario")
public class UsuarioServlet extends HttpServlet {

    private UsuarioService service = new UsuarioService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String idStr = req.getParameter("id");
        String nome = req.getParameter("nome");
        String email = req.getParameter("email");
        String senha = req.getParameter("senha");
        String permissao = req.getParameter("permissao");

        if (idStr != null && !idStr.isEmpty()) {

            int id = Integer.parseInt(idStr);

            Usuario u = new Usuario(nome, email, senha, permissao);
            u.setId(id);

            service.atualizar(u);

            resp.sendRedirect("usuario");
            return;
        }

        Usuario u = new Usuario(nome, email, senha, permissao);

        boolean sucesso = service.inserir(u);

        if (sucesso) {
            resp.sendRedirect(req.getContextPath() + "/usuario?msg=salvo");
        } else {
            req.setAttribute("erro", "Erro ao cadastrar usuário");
            req.getRequestDispatcher("index.jsp").forward(req, resp);
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

        Usuario usuarioLogado = (Usuario) usuarioObj;

        if (!"ADMIN".equals(usuarioLogado.getPermissao())) {
            resp.sendRedirect("index.jsp");
            return;
        }

        String acao = req.getParameter("acao");

        if ("editar".equals(acao)) {
            int id = Integer.parseInt(req.getParameter("id"));

            Usuario usuarioEditar = service.buscarPorId(id);

            req.setAttribute("usuarioForm", usuarioEditar);
        } else {
            req.setAttribute("usuarioForm", null); // força reset
        }
        if ("excluir".equals(acao)) {
            int id = Integer.parseInt(req.getParameter("id"));

            service.excluir(id);

            resp.sendRedirect("usuario?msg=excluido");
            return;
        }

        List<Usuario> lista = service.listar();
        req.setAttribute("usuarios", lista);


        RequestDispatcher rd = req.getRequestDispatcher("WEB-INF/usuarios.jsp");

        rd.forward(req, resp);
    }
}
