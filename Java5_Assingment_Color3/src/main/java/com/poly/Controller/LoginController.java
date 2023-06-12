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

	void loadProductInCart(Model model) {
		try {
			NguoiDung user = (NguoiDung) sessionService.get("Session_custumer");
		} catch (Exception e) {
			model.addAttribute("countItem", 0);
		}
	}

	@GetMapping("/login")
	public String getLogin(NguoiDung user, Model model) {
		checkCookie();
		String username = cookieService.getValue("tenDangNhap");
		String password = cookieService.getValue("matKhau");
		user = new NguoiDung();
		user.setTenDangNhap(username);
		user.setMatKhau(password);
		model.addAttribute("user", user);
		return "login";
	}

	@PostMapping("/login")
	public String postLogin(@Valid @ModelAttribute("user") NguoiDung user, BindingResult result, Model model) {
		// Kiểm tra lỗi

		NguoiDung ng = customerDAO.findByTenDangNhap(user.getTenDangNhap());

		if (ng.isKhoa()) {
			if (ng.getTenDangNhap().equals(user.getTenDangNhap()) && ng.getMatKhau().equals(user.getMatKhau())) {
				sessionService.set("session_NguoiDung", ng);
				if (ng.isChucVu()) {
					return "redirect:/Admin/AccountManagement";
				} else {
					return "redirect:/index";
				}

			} else if (!ng.isKhoa()) {
				System.out.println(user.khoa);
				return "redirect:/login";
			}
		} else {
			return "redirect:/login";

		}
		System.out.println(user.khoa);
		return "redirect:/login";
	}

	@GetMapping("/logout")
	public String postLogout() {
		sessionService.remove("session_NguoiDung");
		return "redirect:/index";
	}
}
