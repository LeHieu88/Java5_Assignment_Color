package com.poly.Controller;

import java.util.List;
import java.util.Optional;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.poly.DAO.UserDAO;
import com.poly.Model.NguoiDung;
import com.poly.Service.ParamService;

import jakarta.validation.Valid;

@Controller
public class RegisterController {
	@Autowired
	UserDAO customerDAO;

	@GetMapping("/user/register")
	public String get_register(Model model) {
		NguoiDung user = new NguoiDung();
		model.addAttribute("user", user);
		return "register";
	}

	@PostMapping("/user/register")
	public String post_register(@Valid @ModelAttribute("user") NguoiDung user, BindingResult result, Model model) {
		// Kiểm tra lỗi nhập liệu
		if (result.hasErrors()) {
			return "register";
		}
		// Kiểm tra tài khoản có tồn tại hay chưa
		List<NguoiDung> listUser = customerDAO.findAll();
		boolean check = false;

		for (NguoiDung nguoiDung : listUser) {
			if (nguoiDung.getTenDangNhap().equalsIgnoreCase(user.getTenDangNhap())) {
				check = false;
				System.out.println("lỗi");
				break;
			} else {
				check = true;
			}
		}
		// Tài khoản user chức vụ = false, active = true
		if (check == true) {
			user.setChucVu(false);
			user.setKhoa(true);
			customerDAO.save(user);
			return "redirect:/login";
		} else {
			return "redirect:/user/register";
		}

	}
}
