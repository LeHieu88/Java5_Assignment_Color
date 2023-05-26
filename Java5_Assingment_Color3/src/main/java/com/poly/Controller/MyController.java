package com.poly.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.poly.Model.User;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class MyController {
	boolean isLoggedIn;

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
	public String check(@Valid @ModelAttribute("user") User u,BindingResult result, Model model) {
		if (result.hasErrors()) {
			model.addAttribute("message", "Vui lòng sửa các lỗi sau:");
			System.out.println("Vui lòng sửa các lỗi sau"+result);
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

	@GetMapping("AccountManagement")
	public String AccountManagement() {
		return "admin/AccountManagement";
	}

	@GetMapping("AddAccount")
	public String AddAccount() {
		return "admin/AddAccount";
	}

	@GetMapping("EditAccount")
	public String EditAccount() {
		return "admin/AddProduct";
	}

	@GetMapping("ProductManagement")
	public String ProductManagement() {
		return "admin/ProductManagement";
	}

	@GetMapping("AddProduct")
	public String AddProduct() {
		return "admin/AddProduct";
	}

	@GetMapping("Edit")
	public String Edit() {
		return "admin/AddProduct";
	}

	@GetMapping("ServiceManagement")
	public String ServiceManagement() {
		return "admin/ServiceManagement";
	}

	@GetMapping("AddService")
	public String AddService() {
		return "admin/AddService";
	}

	@GetMapping("EditService")
	public String EditService() {
		return "admin/AddService";
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
