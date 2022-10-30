package assignment.service;

import org.springframework.stereotype.Service;

import assignment.entitys.AccountEntity;

public interface AccountService {

	AccountEntity getByUserName(String username, String pass);

}
