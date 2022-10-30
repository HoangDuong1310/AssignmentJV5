package assignment.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import assignment.entitys.AccountEntity;
import assignment.repository.AccountRepo;
import assignment.service.AccountService;

@Service
public class AccountServiceImpl implements AccountService {
	@Autowired
	AccountRepo accountRepo;

	@Override
	public AccountEntity getByUserName(String username, String pass) {
		List<AccountEntity> list = accountRepo.findAll();
		for (AccountEntity account : list) {
			if (account.getUsername().equals(username) && account.getPassword().equals(pass)) {
				return account;
			}
		}
		return null;
	}
}
