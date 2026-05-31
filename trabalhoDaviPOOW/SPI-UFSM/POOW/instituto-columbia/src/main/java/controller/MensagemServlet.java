package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import model.Mensagem;
import model.Projeto;
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

        String nome = req.getParameter("nome");
        String email = req.getParameter("email");
        String assunto = req.getParameter("assunto");
        String mensagemTexto = req.getParameter("mensagem");

        if (nome == null || nome.isEmpty() ||
                email == null || email.isEmpty() ||
                mensagemTexto == null || mensagemTexto.isEmpty()) {

            req.setAttribute("erro", "Preencha todos os campos obrigatórios");
            req.getRequestDispatcher("contato.jsp").forward(req, resp);
            return;
        }

        Mensagem m = new Mensagem(nome, email, assunto, mensagemTexto);

        try {
            service.inserir(m);
            resp.sendRedirect("contato.jsp?sucesso=true");

        } catch (Exception e) {
            req.setAttribute("erro", "Erro ao enviar mensagem");
            req.getRequestDispatcher("contato.jsp").forward(req, resp);
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
            resp.sendRedirect("contato.jsp"); // ou home
            return;
        }

        List<Mensagem> lista = service.listar();
        req.setAttribute("mensagens", lista);

        RequestDispatcher rd = req.getRequestDispatcher("WEB-INF/mensagens.jsp");

        rd.forward(req, resp);
    }
}