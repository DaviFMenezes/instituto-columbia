package service;

import dao.UsuarioDAO;
import model.Usuario;

import java.util.List;

public class UsuarioService {

    public boolean inserir(Usuario u) {

        if(u.getNome() == null || u.getNome().isEmpty()){
            throw new RuntimeException("Nome obrigatório");
        }

        if(u.getEmail() == null || !u.getEmail().contains("@")){
            throw new RuntimeException("Email inválido");
        }

        return new UsuarioDAO().inserir(u);
    }

    public List<Usuario> listar() {
        return new UsuarioDAO().listar();
    }

    public Usuario buscarPorId(int id) {
        return new UsuarioDAO().buscarPorId(id);
    }

    public boolean atualizar(Usuario u) {
        return new UsuarioDAO().atualizar(u);
    }

    public boolean excluir(int id) {
        return new UsuarioDAO().excluir(id);
    }
}