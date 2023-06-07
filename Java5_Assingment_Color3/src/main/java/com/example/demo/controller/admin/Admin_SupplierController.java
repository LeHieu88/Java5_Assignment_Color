package com.example.demo.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.demo.Dao.NhaCungCapDAO;
import com.example.demo.Dao.SanPhamDAO;
import com.example.demo.model.DichVu;
import com.example.demo.model.DonHangDichVu;
import com.example.demo.model.NguoiDungDichVu;
import com.example.demo.model.NhaCungCap;
import com.example.demo.model.SanPham;

import jakarta.transaction.Transactional;

@Controller
public class Admin_SupplierController {
	@Autowired
	NhaCungCapDAO nhaCungCapDAO;

	@Autowired
	SanPhamDAO sanPhamDAO;

	@GetMapping("SupplierManagement")
	public String ServiceManagement(Model model) {
		List<NhaCungCap> nhaCungCaps = nhaCungCapDAO.findAll();
		model.addAttribute("listNhaCungCap", nhaCungCaps);
		return "admin/SupplierManagement";
	}

	@GetMapping("AddSupplier")
	public String AddSupplier() {
		return "admin/AddSupplier";
	}

	@PostMapping("AddSupplier")
	public String addSupplier(Model model, @ModelAttribute("NhaCungCap") NhaCungCap n) {
		nhaCungCapDAO.save(n);
		return "redirect:/SupplierManagement";
	}

	@GetMapping("EditSupplier/{NhaCungCapId}")
	public String EditService(DichVu dichVu, Model model, @PathVariable("NhaCungCapId") Integer id) {
		NhaCungCap nhaCungCap = nhaCungCapDAO.findById(id).get();
		model.addAttribute("item", nhaCungCap);
		return "admin/EditSupplier";
	}

	@Transactional
	@PostMapping("EditSupplier/update")
	public String updataDichVu(NhaCungCap nhaCungCap) {
		nhaCungCapDAO.updateNhaCungCap(nhaCungCap.getId(), nhaCungCap.getTenNhaCungCap(), nhaCungCap.getDiaChi(),
				nhaCungCap.getSoDienThoai(), nhaCungCap.getEmail());
		return "redirect:/SupplierManagement";
	}

}
