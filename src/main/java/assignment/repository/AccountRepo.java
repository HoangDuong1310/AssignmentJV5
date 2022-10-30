package assignment.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import assignment.entitys.AccountEntity;

public interface AccountRepo extends JpaRepository<AccountEntity, Integer> {
	List<AccountEntity> getByUsername(String username);

}
