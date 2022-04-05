package store.service;

import java.util.List;

import store.entity.Account;
import store.entity.Product;

public interface ForgotService {

	String findPass(String email);

}
