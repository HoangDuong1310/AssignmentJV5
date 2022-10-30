package assignment.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import assignment.entitys.CategoryEntity;

public interface CategoryRepo extends JpaRepository<CategoryEntity, Integer> {

}
