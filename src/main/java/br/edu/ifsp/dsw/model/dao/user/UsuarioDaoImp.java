package br.edu.ifsp.dsw.model.dao.user;

import br.edu.ifsp.dsw.model.dao.connection.DatabaseConnectionFactory;
import br.edu.ifsp.dsw.model.entity.Usuario;

class UsuarioDaoImp implements UsuarioDao {
	
	static final String CREATE_USER_SQL =  "INSERT INTO usuario (email, nome, senha) VALUES (?, ?, ?)";
	static final String FIND_USER_BY_EMAIL_SQL = "SELECT email, nome, senha FROM usuario WHERE email = ?";
	static final String CHECK_USER_ALREADY_EXISTS_SQL = "SELECT COUNT(*) FROM usuario WHERE email = ?";
	
	@Override
	public boolean create(Usuario usuario) {
		int result = 0;
		
		if (usuario != null) {
			try (var conn = new DatabaseConnectionFactory().factory();
				 var ps = conn.prepareStatement(CREATE_USER_SQL)) {
				ps.setString(1, usuario.getEmail());
				ps.setString(2, usuario.getNome());
				ps.setString(3, usuario.getPassword());
				
				result = ps.executeUpdate();
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return result > 0;
	}

	@Override
	public Usuario findByEmail(String email) {
		Usuario usuario = null;
		
		if (email != null) {
			try (var conn = new DatabaseConnectionFactory().factory();
				 var ps = conn.prepareStatement(FIND_USER_BY_EMAIL_SQL)) {
				
				ps.setString(1, email);
				var rs = ps.executeQuery();
				
				if (rs.next()) {
					usuario = new Usuario();
					usuario.setEmail(rs.getString("email"));
					usuario.setNome(rs.getString("nome"));
					usuario.setPassword(rs.getString("senha"));
				}
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return usuario;
	}
}
