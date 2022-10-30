package assignment.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import assignment.entitys.ProductEntity;

public interface ProductRepo extends JpaRepository<ProductEntity, Integer> {

}
