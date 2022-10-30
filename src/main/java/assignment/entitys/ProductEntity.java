package assignment.entitys;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name = "products")
public class ProductEntity {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Integer id;

	@Column(name = "name")
	private String name;

	@Column(name = "image")
	private String image;

	@Column(name = "price")
	private Double price;

	@Column(name = "available")
	private Boolean available;

	@Column(name = "description")
	private String description;

	@Column(name = "video")
	private String video;

	@Column(name = "created_date")
	private Date createdDate;

	@ManyToOne
	@JoinColumn(name = "categoryId")
	private CategoryEntity category;

}
