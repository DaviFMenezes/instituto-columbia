package model;

import java.time.LocalDateTime;

public class Mensagem {
    private int id;
    private String nome;
    private String email;
    private String assunto;
    private String mensagem;
    private LocalDateTime dataEnvio;

    public Mensagem() {}

    public Mensagem(String nome, String email, String assunto, String mensagem){
        this.nome = nome;
        this.email = email;
        this.assunto = assunto;
        this.mensagem = mensagem;

    }

    public Mensagem(int id, String nome, String email, String assunto, String mensagem){
        this.id = id;
        this.nome = nome;
        this.email = email;
        this.assunto = assunto;
        this.mensagem = mensagem;

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAssunto() {
        return assunto;
    }

    public void setAssunto(String assunto) {
        this.assunto = assunto;
    }

    public String getMensagem() {
        return mensagem;
    }

    public void setMensagem(String mensagem) {
        this.mensagem = mensagem;
    }

    public LocalDateTime getDataEnvio() {
        return dataEnvio;
    }

    public void setDataEnvio(LocalDateTime dataEnvio) {
        this.dataEnvio = dataEnvio;
    }
}
