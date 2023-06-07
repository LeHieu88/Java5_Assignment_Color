package com.example.demo.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.demo.Dao.DichVuDAO;
import com.example.demo.Dao.DonHangDichVuDAO;
import com.example.demo.Dao.NguoiDungDichVuDAO;
import com.example.demo.model.DichVu;
import com.example.demo.model.DonHangDichVu;
import com.example.demo.model.NguoiDung;
import com.example.demo.model.NguoiDungDichVu;
import com.example.demo.model.SanPham;
import com.example.demo.model.SanPhamMaGiamGia;

import jakarta.transaction.Transactional;

@Controller
public class Admin_ServiceController {

	@Autowired
	DichVuDAO dichVuDAO;

	@Autowired
	NguoiDungDichVuDAO nguoiDungDichVuDAO;

	@Autowired
	DonHangDichVuDAO donHangDichVuDAO;

	@GetMapping("ServiceManagement")
	public String ServiceManagement(Model model) {
		List<DichVu> dichVus = dichVuDAO.findAll();
		model.addAttribute("listDichVu", dichVus);
		return "admin/ServiceManagement";
	}

	@GetMapping("AddService")
	public String AddService() {
		return "admin/AddService";
	}

	@PostMapping("AddService")
	public String addService(Model model, @ModelAttribute("dichVu") DichVu d) {
		d.setTrangThai(true);
		dichVuDAO.save(d);
		return "redirect:/ServiceManagement";
	}

	@GetMapping("EditService/{dichVuId}")
	public String EditService(DichVu dichVu, Model model, @PathVariable("dichVuId") Integer id) {
		DichVu dichvu = dichVuDAO.findById(id).get();
		model.addAttribute("item", dichvu);
		return "admin/EditService";
	}

	@Transactional
	@PostMapping("EditService/update")
	public String updataDichVu(DichVu dichVu) {
		System.out.println(dichVu.getTenDichVu());
		dichVuDAO.updateDichVuById(dichVu.getId(), dichVu.getGia(), dichVu.getMoTa(), dichVu.getTenDichVu());
		return "redirect:/ServiceManagement";
	}

	@Transactional
	@GetMapping("lockService/{ServiceId}/{trangThai}")

	public String deleteService(Model model, @PathVariable("ServiceId") int id,
			@PathVariable("trangThai") Boolean trangThai) {
		DichVu dichVu=dichVuDAO.findById(id);
		if(dichVu.isTrangThai()) {
			dichVu.setTrangThai(false);
		}else {
			dichVu.setTrangThai(true);
		}
		return "redirect:/ServiceManagement";
	}

}
