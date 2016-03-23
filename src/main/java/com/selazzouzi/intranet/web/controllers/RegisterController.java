package com.selazzouzi.intranet.web.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.selazzouzi.intranet.web.model.User;
import com.selazzouzi.intranet.web.registration.OnRegistrationCompleteEvent;
import com.selazzouzi.intranet.web.service.IUserService;
import com.selazzouzi.intranet.web.util.GenericResponse;

@Controller
@RequestMapping(value = "/")
public class RegisterController {

	@Autowired
	private ApplicationEventPublisher eventPublisher;

	@Autowired
	private IUserService userService;

	@ModelAttribute("user")
	public User constructUser() {
		return new User();
	}

	@RequestMapping
	public String showRegister() {
		return "index";
	}

	@RequestMapping(value = "/user/registration", method = RequestMethod.POST)
	public ModelAndView registerUserAccount(@Valid @ModelAttribute("user") User user, BindingResult result,
			final HttpServletRequest request) {
		System.out.println("user/registration");
		// check user already exist exception.
		if (result.hasErrors()) {
			System.out.println("has errors!");
			return new ModelAndView("index", "user", user);
		}
		userService.save(user);
		System.out.println("after saving user to DB.");

		try {
			final String appUrl = "http://" + request.getServerName() + ":" + request.getServerPort()
					+ request.getContextPath();
			eventPublisher.publishEvent(new OnRegistrationCompleteEvent(user, request.getLocale(), appUrl));
			System.out.println("after event published.");
		} catch (final Exception ex) {
			//LOGGER.warn("Unable to register user", ex);
			System.out.println("Exception ex: "+ex);
			System.out.println("Unable to register user.");
			return new ModelAndView("emailError", "user", user);
		}
		System.out.println("showing successRegister.");
		return new ModelAndView("successRegister", "user", user);
	}
	
	@RequestMapping(value="/successRegister",method= RequestMethod.GET)
	public String showSuccesRegister(){
		
		return "successRegister";
		
	}
	

}
