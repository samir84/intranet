package com.selazzouzi.intranet.web.repository;


import org.springframework.data.jpa.repository.JpaRepository;

import com.selazzouzi.intranet.web.model.User;
import com.selazzouzi.intranet.web.model.VerificationToken;

public interface VerificationTokenRepository extends JpaRepository<VerificationToken, Long> {

    VerificationToken findByToken(String token);

    VerificationToken findByUser(User user);

}
