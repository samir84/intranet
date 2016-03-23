package com.selazzouzi.intranet.web.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.selazzouzi.intranet.web.model.User;

@Controller
public class HomeController {

	@RequestMapping(value = "/kl", method = RequestMethod.GET)
	public String showIndex(@ModelAttribute("user") User user){
		System.out.println("Show index page..");
		return "index";
	}

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String showHome(){
		System.out.println("Home Controller..");
		return "home";
	}
	
	@RequestMapping(value = "/admin**", method = RequestMethod.GET)
	public String showadmin(){
		
		return "admin";
	}

	
}
