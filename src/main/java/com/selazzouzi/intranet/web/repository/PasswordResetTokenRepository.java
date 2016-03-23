package com.selazzouzi.intranet.web.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.selazzouzi.intranet.web.model.PasswordResetToken;
import com.selazzouzi.intranet.web.model.User;

public interface PasswordResetTokenRepository extends JpaRepository<PasswordResetToken, Long> {

    PasswordResetToken findByToken(String token);

    PasswordResetToken findByUser(User user);

}
