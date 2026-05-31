package dao;

import model.Mensagem;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MensagemDAO {

    private Mensagem map(ResultSet rs) throws SQLException {
        Mensagem m = new Mensagem();
        m.setId(rs.getInt("id"));
        m.setNome(rs.getString("nome"));
        m.setEmail(rs.getString("email"));
        m.setAssunto(rs.getString("assunto"));
        m.setMensagem(rs.getString("mensagem"));
        m.setDataEnvio(rs.getTimestamp("data_envio").toLocalDateTime());

        return m;
    }

    public boolean inserir(Mensagem m) {
        String sql = "INSERT INTO mensagens " + "(nome, email, assunto, mensagem) " + "VALUES (?, ?, ?, ?)";

        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, m.getNome());
            stmt.setString(2, m.getEmail());
            stmt.setString(3, m.getAssunto());
            stmt.setString(4, m.getMensagem());

            return stmt.executeUpdate() > 0;

        } catch (SQLException e) {

            throw new RuntimeException(
                    "Erro ao inserir mensagem", e
            );
        }
    }

    public List<Mensagem> listar() {
        String sql = "SELECT * FROM mensagens " + "ORDER BY data_envio DESC";

        List<Mensagem> lista = new ArrayList<>();

        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                lista.add(map(rs));
            }

        } catch (SQLException e) {

            throw new RuntimeException(
                    "Erro ao listar mensagens", e
            );
        }

        return lista;
    }

    public Mensagem buscarPorId(int id) {

        String sql = "SELECT * FROM mensagens WHERE id = ?";

        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return map(rs);
            }

        } catch (SQLException e) {

            throw new RuntimeException(
                    "Erro ao buscar mensagem", e
            );
        }

        return null;
    }

    public void excluir(int id) {

        String sql = "DELETE FROM mensagens WHERE id = ?";

        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);

            stmt.executeUpdate();

        } catch (SQLException e) {

            throw new RuntimeException(
                    "Erro ao excluir mensagem", e
            );
        }
    }
}