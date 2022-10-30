package assignment.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import assignment.entitys.OrderDetailEntity;

public interface OrderDetailRepo extends JpaRepository<OrderDetailEntity, Integer> {

}
