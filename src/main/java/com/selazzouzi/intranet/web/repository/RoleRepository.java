package com.selazzouzi.intranet.web.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.selazzouzi.intranet.web.model.Role;

public interface RoleRepository extends JpaRepository<Role, Integer>{

	Role findByName(String name);

}
