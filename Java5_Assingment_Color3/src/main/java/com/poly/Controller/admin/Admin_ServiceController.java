package com.poly.Controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.poly.DAO.DichVuDAO;
import com.poly.DAO.DonHangDichVuDAO;
import com.poly.DAO.NguoiDungDichVuDAO;
import com.poly.Model.DichVu;
import com.poly.Model.DonHangDichVu;
import com.poly.Model.NguoiDung;
import com.poly.Model.NguoiDungDichVu;
import com.poly.Model.SanPham;
import com.poly.Model.SanPhamMaGiamGia;

import jakarta.transaction.Transactional;
import jakarta.validation.Valid;

@Controller
public class Admin_ServiceController {

	@Autowired
	DichVuDAO dichVuDAO;

	@Autowired
	NguoiDungDichVuDAO nguoiDungDichVuDAO;

	@Autowired
	DonHangDichVuDAO donHangDichVuDAO;

	@GetMapping("Admin/ServiceManagement")
	public String ServiceManagement(Model model) {
		List<DichVu> dichVus = dichVuDAO.findAll();
		model.addAttribute("listDichVu", dichVus);
		return "admin/ServiceManagement";
	}

	@GetMapping("Admin/AddService")
	public String AddService(Model model, @ModelAttribute("dichVu") DichVu d) {
		model.addAttribute("dichVu", new DichVu());
		return "admin/AddService";
	}

	@PostMapping("Admin/AddService")
	public String addService(Model model, @Valid @ModelAttribute("dichVu") DichVu d, BindingResult result) {
		if (result.hasErrors()) {
			return "admin/AddService";
		}
		d.setTrangThai(true);
		dichVuDAO.save(d);
		return "redirect:/Admin/ServiceManagement";
	}

	@GetMapping("Admin/EditService/{dichVuId}")
	public String EditService(DichVu dichVu, Model model, @PathVariable("dichVuId") Integer id) {
		DichVu dichvu = dichVuDAO.findById(id).get();
		model.addAttribute("item", dichvu);
		return "admin/EditService";
	}

	@Transactional
	@PostMapping("Admin/EditService/update")
	public String updataDichVu(Model model, @Valid DichVu dichVu, BindingResult result,
			RedirectAttributes redirectAttributes) {
		DichVu dichVu2 = dichVuDAO.findById(dichVu.getId());
		model.addAttribute("dichVu", dichVu);
		model.addAttribute("item", dichVu);
		model.addAttribute("dichVuId", dichVu.id); // Thêm biến id vào model

		if (result.hasErrors()) {
			return "redirect:/Admin/ServiceManagement";
		}
		if (dichVu.getTenDichVu().equals("")) {
			dichVu.setTenDichVu(dichVu2.getTenDichVu());
		}
		dichVuDAO.updateDichVuById(dichVu.getId(), dichVu.getGia(), dichVu.getMoTa(), dichVu.getTenDichVu());
		return "redirect:/Admin/ServiceManagement";
	}

	@Transactional
	@GetMapping("Admin/lockService/{ServiceId}/{trangThai}")

	public String deleteService(Model model, @PathVariable("ServiceId") int id,
			@PathVariable("trangThai") Boolean trangThai) {
		DichVu dichVu = dichVuDAO.findById(id);
		if (dichVu.isTrangThai()) {
			dichVu.setTrangThai(false);
		} else {
			dichVu.setTrangThai(true);
		}
		return "redirect:/Admin/ServiceManagement";
	}

}
