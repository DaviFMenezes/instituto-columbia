package model;

import java.time.LocalDate;
import java.time.LocalDateTime;


public class Projeto {

    private int id;
    private String titulo;
    private String descricao;
    private String categoria;
    private String imagemUrl;
    private LocalDate dataInicio;
    private LocalDate dataTermino;
    private LocalDateTime dataCriacao;
    private int id_usuario;

    public Projeto() {}

    public Projeto(String titulo, String descricao, String categoria, String imagemUrl, LocalDate dataInicio, LocalDate dataTermino, int id_usuario) {
        this.titulo = titulo;
        this.descricao = descricao;
        this.categoria = categoria;
        this.imagemUrl = imagemUrl;
        this.dataInicio = dataInicio;
        this.dataTermino = dataTermino;
        this.id_usuario = id_usuario;

    }

    public Projeto(int id,String titulo, String descricao, String categoria, String imagemUrl, LocalDate dataInicio, LocalDate dataTermino, LocalDateTime dataCriacao, int id_usuario) {
        this.id = id;
        this.titulo = titulo;
        this.descricao = descricao;
        this.categoria = categoria;
        this.imagemUrl = imagemUrl;
        this.dataInicio = dataInicio;
        this.dataTermino = dataTermino;
        this.dataCriacao = dataCriacao;
        this.id_usuario = id_usuario;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getImagemUrl() {
        return imagemUrl;
    }

    public void setImagemUrl(String imagemUrl) {
        this.imagemUrl = imagemUrl;
    }

    public LocalDate getDataInicio() {
        return dataInicio;
    }

    public void setDataInicio(LocalDate dataInicio) {
        this.dataInicio = dataInicio;
    }

    public LocalDate getDataTermino() {
        return dataTermino;
    }

    public void setDataTermino(LocalDate dataTermino) {
        this.dataTermino = dataTermino;
    }

    public LocalDateTime getDataCriacao() {
        return dataCriacao;
    }

    public void setDataCriacao(LocalDateTime dataCriacao) {
        this.dataCriacao = dataCriacao;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }
}
