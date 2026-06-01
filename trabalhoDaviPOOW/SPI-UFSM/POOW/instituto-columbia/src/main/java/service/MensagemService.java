package service;

import dao.MensagemDAO;
import model.Mensagem;

import java.util.List;

public class MensagemService {
    public List<Mensagem> listar() {
        return new MensagemDAO().listar();
    }

    public boolean inserir(Mensagem p) {
        return new MensagemDAO().inserir(p);
    }

    public void excluir(int id) {
        new MensagemDAO().excluir(id);
    }

    public Mensagem buscarPorId(int id) {
        return new MensagemDAO().buscarPorId(id);
    }

    public boolean atualizar(Mensagem p) {return new MensagemDAO().atualizar(p);}

}
