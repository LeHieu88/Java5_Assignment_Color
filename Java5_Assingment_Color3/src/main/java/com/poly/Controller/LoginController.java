package com.poly.Controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poly.DAO.SanPhamDAO;
import com.poly.DAO.UserDAO;
import com.poly.Model.NguoiDung;
import com.poly.Model.SanPham;
import com.poly.Service.CookieService;
import com.poly.Service.ParamService;
import com.poly.Service.SessionService;

import jakarta.validation.Valid;

@Controller
public class LoginController {
	@Autowired
	UserDAO customerDAO;
	@Autowired
	ParamService paramService;
	@Autowired
	SessionService sessionService;
	@Autowired
	CookieService cookieService;
	@Autowired
	SanPhamDAO sanPhamDAO;

	private void checkCookie() {
		String username = cookieService.getValue("username");
		String password = cookieService.getValue("password");
	}

	@GetMapping("/login")
	public String getLogin(NguoiDung user, Model model, @ModelAttribute("errorMessage") String errorMessage) {
		checkCookie();
		String username = cookieService.getValue("tenDangNhap");
		String password = cookieService.getValue("matKhau");
		user = new NguoiDung();
		user.setTenDangNhap(username);
		user.setMatKhau(password);
		model.addAttribute("user", user);
		if (!errorMessage.isEmpty()) {
			model.addAttribute("errorMessage", errorMessage);
		}
		return "login";
	}

	@PostMapping("/login")
	public String postLogin(@Valid @ModelAttribute("user") NguoiDung user, BindingResult result, Model model) {
//		 Kiểm tra lỗi
		
		NguoiDung ng = customerDAO.findByTenDangNhap(user.getTenDangNhap());
		
		if (ng == null) {
			model.addAttribute("errorMessage", "Người dùng không tồn tại");
			return "login";
		}
		if (!ng.getMatKhau().equals(user.getMatKhau())) {
			model.addAttribute("errorMessage", "Sai mật khẩu !!!");
			return "login";
		}
		if (!ng.isKhoa()) {
			model.addAttribute("errorMessage", "Tài khoản đã bị khóa");
			return "login";
		}
		
		else {
			if(!result.hasErrors()) {
				return "login";
			}
			sessionService.set("session_NguoiDung", ng);
			if (ng.isChucVu()) {
				return "redirect:/Admin/AccountManagement";
			} else {
				return "redirect:/index";
			}
		}

	}

	@GetMapping("/logout")
	public String postLogout() {
		sessionService.remove("session_NguoiDung");
		return "redirect:/index";
	}
}
