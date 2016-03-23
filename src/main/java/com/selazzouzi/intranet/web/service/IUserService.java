package com.selazzouzi.intranet.web.service;

import java.util.List;

import com.selazzouzi.intranet.web.model.User;

public interface IUserService {

	public List<User> findAll();
	public User findOne(int id) ;
	public void save(User user);
	public void delete(int id);
	public User findOne(String username);
	public void createVerificationTokenForUser(User user, String token);
}
