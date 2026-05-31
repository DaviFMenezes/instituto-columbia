package service;

import dao.ProjetoDAO;
import model.Projeto;

import java.util.List;

public class ProjetoService {

    public List<Projeto> listar() {
        return new ProjetoDAO().listar();
    }

    public boolean inserir(Projeto p) {
        return new ProjetoDAO().inserir(p);
    }

    public void excluir(int id) {
        new ProjetoDAO().excluir(id);
    }

    public void atualizar(Projeto p) {
        new ProjetoDAO().atualizar(p);
    }

    public Projeto buscarPorId(int id) {
        return new ProjetoDAO().buscarPorId(id);
    }

    public List<Projeto> buscarPorUsuario(int idUsuario) {
        return new ProjetoDAO().buscarPorUsuario(idUsuario);
    }
}