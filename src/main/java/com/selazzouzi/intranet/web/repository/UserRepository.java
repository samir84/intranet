package com.selazzouzi.intranet.web.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.selazzouzi.intranet.web.model.User;


public interface UserRepository extends JpaRepository<User, Integer>{

	User findByName(String name);


}
