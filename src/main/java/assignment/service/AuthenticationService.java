//package assignment.service;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//
//import assignment.entitys.AccountEntity;
//import assignment.repository.AccountRepo;
//
//@Service
//public class AuthenticationService {
//	@Autowired
//	AccountRepo accRepo;
//	@Autowired
//	AccountService accountService;
//
//	public AccountEntity authenticate(String username, String password) {
//		AccountEntity account = accountService.getByUserName(username);
//		if (account == null) {
//			return null;
//		}
//		if (!account.getPassword().equals(password)) {
//			return null;
//		}
//		return account;
//	}
//
//}
