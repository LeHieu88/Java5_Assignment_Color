package com.example.demo.controller.admin;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.Dao.NguoiDungDAO;
import com.example.demo.model.NguoiDung;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.transaction.Transactional;
import jakarta.validation.Valid;

@Controller
public class Admin_AccountController {
	@Autowired
	NguoiDungDAO nguoiDungDAO;

	@GetMapping("AccountManagement")
	public String AccountManagement(Model model) {
		List<NguoiDung> list = nguoiDungDAO.findAll();
		model.addAttribute("listNguoiDung", list);
		return "admin/AccountManagement";
	}

	@RequestMapping("/EditAccount/{tenDangNhap}")
	public String edit(Model model, @PathVariable("tenDangNhap") String username) {
		NguoiDung item = nguoiDungDAO.FindNguoiDungUserName(username);
		model.addAttribute("item", item);
		return "admin/EditAccount";
	}

	@RequestMapping("/lockAccount/{tenDangNhap}/{khoa}")
	@Transactional
	public String lock(Model model, HttpServletRequest request, @PathVariable("tenDangNhap") String username,
			@PathVariable("khoa") Boolean khoa) {
		System.out.println(khoa);
		if (khoa) {
			nguoiDungDAO.lockNguoiDung(username, false);
		} else {
			nguoiDungDAO.lockNguoiDung(username, true);
		}
		return "redirect:/AccountManagement";
	}

	@Transactional
	@RequestMapping("/EditAccount/update")
	public String update(NguoiDung item, RedirectAttributes redirectAttributes) {
		if (item.getHoTen().equals("")) {
			redirectAttributes.addFlashAttribute("mgs", "Vui lòng nhập họ tên");
			return "redirect:/EditAccount/" + item.getTenDangNhap();
		} else if (item.getEmail().equals("")) {
			redirectAttributes.addFlashAttribute("mgs", "Vui lòng nhập email");
			return "redirect:/EditAccount/" + item.getTenDangNhap();
		} else if (item.getDiaChi().equals("")) {
			redirectAttributes.addFlashAttribute("mgs", "Vui lòng nhập địa chỉ");
			return "redirect:/EditAccount/" + item.getTenDangNhap();
		} else if (item.getSoDienThoai().equals("")) {
			redirectAttributes.addFlashAttribute("mgs", "Vui lòng nhập số điện thoại");
			return "redirect:/EditAccount/" + item.getTenDangNhap();
		} else {
			nguoiDungDAO.updateNguoiDung(item.getTenDangNhap(), item.getHoTen(), item.getMatKhau(), item.getEmail(),
					item.getDiaChi(), item.getSoDienThoai(), item.isChucVu());
			return "redirect:/AccountManagement";
		}
	}

	@GetMapping("AddAccount")
	public String AddAccount(Model result, @ModelAttribute("user") NguoiDung u) {
		result.addAttribute("user", new NguoiDung());
		return "admin/AddAccount";
	}

	@PostMapping("AddAccount")
	public String AddUser(@Valid @ModelAttribute("user") NguoiDung u, BindingResult result, Model model) {
		if (result.hasErrors()) {
			System.out.println(result.getObjectName());
			System.out.println(result);
			System.out.println(result.getErrorCount());
			return "redirect:/AddAccount";

		}
		List<NguoiDung> list = nguoiDungDAO.findAll();
		for (NguoiDung nguoiDung : list) {
			if (nguoiDung.getTenDangNhap().equals(u.getTenDangNhap())) {
				System.out.println("Trùng tài khoản");
				model.addAttribute("mgs", "Trùng tài khoản vui lòng nhập ");
				return "admin/AddAccount";
			}
		}
		nguoiDungDAO.save(u);
		return "admin/AddAccount";
	}

	@GetMapping("EditAccount")
	public String EditAccount() {
		return "admin/AddProduct";
	}
}
