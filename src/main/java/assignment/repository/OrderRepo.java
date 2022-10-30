package assignment.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import assignment.entitys.OrderEntity;

public interface OrderRepo extends JpaRepository<OrderEntity, Integer> {

}
