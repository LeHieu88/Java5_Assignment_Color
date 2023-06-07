package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.Dao.ChiTietDonHangDAO;
import com.example.demo.Dao.DichVuDAO;
import com.example.demo.Dao.NguoiDungDAO;
import com.example.demo.model.ChiTietDonHang;
import com.example.demo.model.DichVu;
import com.example.demo.model.NguoiDung;

import Model.User;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.transaction.Transactional;
import jakarta.validation.Valid;

@Controller
public class MyController {
	boolean isLoggedIn;
	@Autowired
	DichVuDAO dichVuDAO;

	@Autowired
	NguoiDungDAO nguoiDungDAO;

	@GetMapping("index")
	public String init() {
		List<DichVu> dichVus = dichVuDAO.findAll();
		for (DichVu dichvu : dichVus) {
			System.out.println(dichvu.getGia());
		}
		return "login";
	}

	@GetMapping("login")
	public String login() {

		return "login";
	}

	@PostMapping("login")
	public String login1(HttpServletResponse response) {
		boolean isLoggedIn = true;
		Cookie cookie = new Cookie("isLoggedIn", String.valueOf(isLoggedIn));
		cookie.setMaxAge(3600); // Thời gian sống của cookie (tính bằng giây)
		response.addCookie(cookie);
		return "redirect:index.html";
	}

	@GetMapping("register")
	public String register(@ModelAttribute("user") User u, Model model) {
		return "register";
	}

	@PostMapping("save")
	public String check(@Valid @ModelAttribute("user") NguoiDung u, BindingResult result, Model model) {
		if (result.hasErrors()) {
			model.addAttribute("message", "Vui lòng sửa các lỗi sau:");
			System.out.println("Vui lòng sửa các lỗi sau" + result);
			return "register";
		}
		return "register";
	}

	@GetMapping("logout")
	public String logout(HttpServletResponse response) {
		Cookie cookie = new Cookie("isLoggedIn", "false");
		cookie.setMaxAge(0); // Đặt thời gian sống của cookie thành 0 để xóa cookie
		cookie.setPath("/"); // Đặt đường dẫn của cookie để có thể truy cập từ bất kỳ đường dẫn nào
		response.addCookie(cookie);
		return "redirect:/index.html";
	}

	@GetMapping("AccountInformation.html")
	public String AccountInformation() {
		return "AccountInformation";
	}

	@GetMapping("about.html")
	public String about() {
		return "about";
	}

	@GetMapping("blog.html")
	public String blog() {
		return "blog";
	}

	@GetMapping("blogSingle.html")
	public String blogSingle() {
		return "blogSingle";
	}

	@GetMapping("contact.html")
	public String contact() {
		return "contact";
	}

	@GetMapping("index.html")
	public String index() {
		return "index";
	}

	@GetMapping("menu.html")
	public String menu() {
		return "menu";
	}

	@GetMapping("productDetails.html")
	public String productDetails() {
		return "productDetails";
	}

	@GetMapping("reservation.html")
	public String reservation() {
		return "reservation";
	}

	@GetMapping("service.html")
	public String service() {
		return "service";
	}

	@GetMapping("shoppingCart.html")
	public String shoppingCart() {
		return "shoppingCart";
	}

	

	@GetMapping("ThongKeDoanhThu")
	public String ThongKeDoanhThu() {
		return "admin/ThongKeDoanhThu";
	}

	@GetMapping("ThongKeDichVu")
	public String ThongKeDichVu() {
		return "admin/ThongKeDichVu";
	}

	@GetMapping("ThongKeSanPham")
	public String ThongKeSanPham() {
		return "admin/ThongKeSanPham";
	}

}
