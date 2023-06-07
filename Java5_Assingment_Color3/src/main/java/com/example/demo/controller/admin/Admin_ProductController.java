package com.example.demo.controller.admin;

import java.io.File;
import java.util.List;
import java.util.Optional;

import javax.swing.JOptionPane;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.Dao.ChiTietDonHangDAO;
import com.example.demo.Dao.GioHangSanPhamDAO;
import com.example.demo.Dao.KhoDAO;
import com.example.demo.Dao.NhaCungCapDAO;
import com.example.demo.Dao.SanPhamDAO;
import com.example.demo.Dao.SanPhamMaGiamGiaDAO;
import com.example.demo.model.ChiTietDonHang;
import com.example.demo.model.GioHangSanPham;
import com.example.demo.model.Kho;
import com.example.demo.model.NhaCungCap;
import com.example.demo.model.SanPham;
import com.example.demo.model.SanPhamMaGiamGia;
import com.example.demo.service.ParamService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.transaction.Transactional;
import jakarta.validation.Valid;

@Controller
public class Admin_ProductController {
	@Autowired
	SanPhamDAO sanPhamDAO;

	@Autowired
	NhaCungCapDAO nhaCungCapDAO;

	@Autowired
	KhoDAO khoDAO;

	@Autowired
	SanPhamMaGiamGiaDAO sanPhamMaGiamGiaDAO;

	@Autowired
	GioHangSanPhamDAO gioHangSanPhamDAO;

	@Autowired
	ChiTietDonHangDAO chiTietDonHangDAO;

	@Autowired
	private ParamService paramService;

	SanPham pham;

	@GetMapping("ProductManagement")
	public String ProductManagement(Model model) {
		List<SanPham> list = sanPhamDAO.findAll();
		model.addAttribute("listSanPham", list);
		return "admin/ProductManagement";
	}

	@GetMapping("AddProduct")
	public String AddProduct(Model model) {
		List<NhaCungCap> listNhaCungCaps = nhaCungCapDAO.findAll();
		model.addAttribute("listNhaCungCaps", listNhaCungCaps);
		return "admin/AddProduct";
	}

	@PostMapping("AddProduct")
	public String addProduct(@Valid @ModelAttribute("product") SanPham s, BindingResult result, Model model,
			@RequestParam("file") MultipartFile file, @RequestParam("nhaCungCapId") int nhaCungCapId,
			@ModelAttribute("Kho") Kho kho, RedirectAttributes redirectAttributes) {
		try {
			String imagePath = "/path/to/image/folder";
			File savedImage = paramService.save(file, imagePath);

			if (file.isEmpty()) {
				model.addAttribute("mgs", "Vui lòng chọn ảnh");
			}

			s.setHinhAnh(String.valueOf(savedImage.getName()));
			Optional<NhaCungCap> optionalNhaCungCap = nhaCungCapDAO.findById(nhaCungCapId);

			if (optionalNhaCungCap.isPresent()) {
				NhaCungCap nhaCungCap = optionalNhaCungCap.get();
				s.setNhaCungCap(nhaCungCap);
			}

			if (s.getTenSanPham().isEmpty() || s.getGia() <= 0 || kho.getGiaNhap() <= 0 || kho.getSoLuong() <= 0
					|| s.getHinhAnh().equals("")) {
				model.addAttribute("mgs", "Vui lòng nhập thông tin hợp lệ");
			} else {
				sanPhamDAO.save(s);
				kho.setSanPham(s);
				khoDAO.save(kho);
				return "redirect:/ProductManagement";
			}
		} catch (Exception e) {
			model.addAttribute("mgs", "Lỗi!");
			redirectAttributes.addFlashAttribute("mgs", "Lỗi");
			return "redirect:/AddProduct";
		}

		return "redirect:/AddProduct";
	}

	@GetMapping("EditProduct/{sanPhamId}")
	public String Edit(Model model, @PathVariable("sanPhamId") Integer id) {
		SanPham item = sanPhamDAO.findById(id).get();
		model.addAttribute("item", item);
		pham = sanPhamDAO.findById(id).get();
		return "admin/EditProduct";
	}

	@Transactional
	@RequestMapping("/EditProduct/update")
	public String update(SanPham item, @RequestParam(value = "file") MultipartFile file) {
		// Lưu hình vào thư mục
		String imagePath = "/path/to/image/folder";

		String fileName = item.getHinhAnh(); // Giá trị tạm

		File savedImage = paramService.save(file, imagePath);
		fileName = StringUtils.cleanPath(file.getOriginalFilename());
		item.setHinhAnh(fileName);
		if (file.isEmpty()) {
			System.out.println("1" + pham.getHinhAnh());
			item.setHinhAnh(pham.getHinhAnh());
		} else {
			System.out.println("2" + item.getHinhAnh());
		}
		// Xử lý đăng ký và lưu thông tin vào cơ sở dữ liệu
		sanPhamDAO.updateSanPhamInfoById(item.getId(), item.getTenSanPham(), item.getGia(), item.getMoTa(),
				item.getHinhAnh());
		return "redirect:/ProductManagement";
	}

	@GetMapping("lockProduct/{sanPhamId}/{trangThai}")
	@Transactional
	public String delete(Model model, @PathVariable("sanPhamId") int id, @PathVariable("trangThai") Boolean trangThai) {
		SanPham sanPham = sanPhamDAO.findById(id);
		if (sanPham.isTrangThai()) {
			sanPham.setTrangThai(false);
		} else {
			sanPham.setTrangThai(true);
		}

		return "redirect:/ProductManagement";
	}

}
