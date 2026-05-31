package dao;

import model.Projeto;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProjetoDAO {

    private Projeto map(ResultSet rs) throws SQLException {
        Projeto p = new Projeto();
        p.setId(rs.getInt("id"));
        p.setTitulo(rs.getString("titulo"));
        p.setDescricao(rs.getString("descricao"));
        p.setCategoria(rs.getString("categoria"));
        p.setImagemUrl(rs.getString("imagem_url"));
        p.setId_usuario(rs.getInt("id_usuario"));
        p.setDataInicio(rs.getDate("data_inicio").toLocalDate());
        if(rs.getDate("data_termino") != null){
            p.setDataTermino(rs.getDate("data_termino").toLocalDate());
        }
        p.setDataCriacao(rs.getTimestamp("data_criacao").toLocalDateTime());

        return p;
    }

    public boolean inserir(Projeto p) {

        String sql =
                "INSERT INTO projetos " +
                        "(titulo, descricao, categoria, imagem_url, data_inicio, data_termino, id_usuario) " +
                        "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, p.getTitulo());
            stmt.setString(2, p.getDescricao());
            stmt.setString(3, p.getCategoria());
            stmt.setString(4, p.getImagemUrl());
            stmt.setDate(5, java.sql.Date.valueOf(p.getDataInicio()));
            if(p.getDataTermino() != null){
                stmt.setDate(6, java.sql.Date.valueOf(p.getDataTermino()));
            } else {
                stmt.setNull(6, java.sql.Types.DATE);
            }
            stmt.setInt(7, p.getId_usuario());
            return stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            throw new RuntimeException("Erro ao inserir projeto", e);
        }
    }

    public List<Projeto> listar() {
        String sql = "SELECT * FROM projetos";
        List<Projeto> lista = new ArrayList<>();

        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                lista.add(map(rs));
            }

        } catch (SQLException e) {
            throw new RuntimeException("Erro ao listar projetos", e);
        }

        return lista;
    }

    public Projeto buscarPorId(int id) {
        String sql = "SELECT * FROM projetos WHERE id = ?";

        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return map(rs);
            }

        } catch (SQLException e) {
            throw new RuntimeException("Erro ao buscar projeto", e);
        }

        return null;
    }

    public List<Projeto> buscarPorCategoria(String categoria) {
        String sql = "SELECT * FROM projetos WHERE categoria = ?";
        List<Projeto> lista = new ArrayList<>();

        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, categoria);
            try(ResultSet rs = stmt.executeQuery()){
                while(rs.next()){
                    lista.add(map(rs));
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException("Erro ao buscar projeto", e);
        }

        return lista;
    }

    public void atualizar(Projeto p) {
        String sql = "UPDATE projetos SET titulo=?, descricao=?, categoria=?, imagem_url=?, data_inicio=?, data_termino=? WHERE id=?";

        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, p.getTitulo());
            stmt.setString(2, p.getDescricao());
            stmt.setString(3, p.getCategoria());
            stmt.setString(4, p.getImagemUrl());
            stmt.setDate(5, java.sql.Date.valueOf(p.getDataInicio()));
            if(p.getDataTermino() != null){
                stmt.setDate(6, java.sql.Date.valueOf(p.getDataTermino()));
            } else {
                stmt.setNull(6, java.sql.Types.DATE);
            }
            stmt.setInt(7, p.getId());

            stmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException("Erro ao atualizar projeto", e);
        }
    }

    public void excluir(int id) {
        String sql = "DELETE FROM projetos WHERE id = ?";

        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            stmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException("Erro ao excluir projeto", e);
        }
    }

    public List<Projeto> buscarPorUsuario(int idUsuario) {
        String sql = "SELECT * FROM projetos WHERE categoria = ?";
        List<Projeto> lista = new ArrayList<>();

        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, idUsuario);
            try(ResultSet rs = stmt.executeQuery()){
                while(rs.next()){
                    lista.add(map(rs));
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException("Erro ao buscar projeto", e);
        }

        return lista;
    }
}