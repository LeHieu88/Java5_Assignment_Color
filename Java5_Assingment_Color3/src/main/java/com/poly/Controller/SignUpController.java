package com.poly.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;


import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.Valid;
import com.poly.Model.User;

import jakarta.validation.Valid;

@Controller

public class SignUpController {
	@GetMapping("register")
	public String register(@ModelAttribute("user") User u, Model model) {
		return "register";
	}
	
	@PostMapping("save")
	public String check(@Valid @ModelAttribute("user") User u,BindingResult result, Model model) {
		if (result.hasErrors()) {
			model.addAttribute("message", "Vui lòng sửa các lỗi sau:");
			System.out.println("Vui lòng sửa các lỗi sau"+result);
            return "register";
        }
		return "register";
	}
}