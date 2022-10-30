package assignment.beans;

import org.springframework.stereotype.Component;
import lombok.Data;

@Data
@Component
public class CategorysBean {
	private Integer id;
	private String name;
}
