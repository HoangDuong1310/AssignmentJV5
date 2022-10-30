package assignment.beans;

import java.util.Date;

import javax.validation.constraints.DecimalMax;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class ProductBean {

	private Integer id;
	@NotEmpty
	private String name;
	@NotEmpty
	private String image;
	@NotNull
	private Double price;
	@NotEmpty
	private String description;
	private Date createdDate;
	@NotNull
	private boolean available;
	@NotEmpty
	private String video;
	private Integer category;
}
