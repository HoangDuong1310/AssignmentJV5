package assignment.entitys;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import lombok.Data;

@Entity
@Data
@Table(name = "accounts")

public class AccountEntity {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Integer id;

	@Column(name = "username")
	private String username;

	@Column(name = "fullname")
	private String fullname;

	@Column(name = "password")
	private String password;

	@Column(name = "email")
	private String email;

	@Column(name = "photo")
	private String photo;

	@Column(name = "activated")
	private Integer activated;

	@Column(name = "admin")
	private Integer admin;

	@Column(name = "role")
	private role role;

}
