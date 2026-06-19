package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Projeto;
import service.ProjetoService;

import java.io.IOException;
import java.util.List;

@WebServlet("/projetosPublica.jsp")
public class ProjetosPublicosServlet extends HttpServlet {

    private final ProjetoService service = new ProjetoService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Projeto> projetos = service.listar();
        req.setAttribute("projetos", projetos);

        RequestDispatcher rd = req.getRequestDispatcher("WEB-INF/projetosPublica.jsp");
        rd.forward(req, resp);
    }
}
