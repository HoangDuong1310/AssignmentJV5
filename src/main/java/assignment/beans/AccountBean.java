package assignment.beans;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

//@Data
@Component
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class AccountBean {
	private Integer id;
	private String username;
	private String password;
	private String fullname;
	private String email;
	private String photo;
	private Integer activated;
}
