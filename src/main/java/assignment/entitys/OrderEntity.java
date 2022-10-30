package assignment.entitys;

import java.util.Date;
import java.util.Locale.Category;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name = "orders")
@Data
public class OrderEntity {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Integer id;

//	@Column(name = "created_date")
//	private Date createdDate = new Date();

	@Column(name = "address")
	private String address;

	@ManyToOne
	@JoinColumn(name = "user_id")
	private AccountEntity account;

}
