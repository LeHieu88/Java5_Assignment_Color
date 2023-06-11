package com.poly.Controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.DAO.GioHangDAO;
import com.poly.DAO.GioHangSanPhamDAO;
import com.poly.DAO.GioHangSanPhamInfoRepository;
import com.poly.DAO.SanPhamDAO;
import com.poly.DAO.UserDAO;
import com.poly.Model.GioHang;
import com.poly.Model.GioHangSanPham;
import com.poly.Model.GioHangSanPhamInfo;
import com.poly.Model.NguoiDung;
import com.poly.Model.SanPham;
import com.poly.Service.SessionService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class ProductController {
	@Autowired
	SanPhamDAO sanPhamDAO;
	@Autowired
	SessionService session;
	@Autowired
	GioHangDAO gioHangDAO;
	@Autowired
	GioHangSanPhamDAO gioHangSanPhamDAO;
	@Autowired
	UserDAO customerDAO;
	@Autowired
	GioHangSanPhamInfoRepository gioHangSanPhamInfoRepository;

	@GetMapping("/menu")
	public String get_memmu(Model model) {
		List<SanPham> list = new ArrayList<>();
		for (SanPham sanPham : sanPhamDAO.findAll()) {
			if (sanPham.isTrangThai()) {
				list.add(sanPham);
			}
		}
		model.addAttribute("listSP", list);
		return "menu";
	}

	@GetMapping("/productDetails/{id}")
	public String Edit(Model model, @PathVariable("id") Integer id) {
		SanPham sp = sanPhamDAO.findById(id).get();

		model.addAttribute("product", sp);
		return "productDetails";
	}

	@GetMapping("/User/Cart")
	public String selectUserCart(Model model) {
		NguoiDung ng = (NguoiDung) session.get("session_NguoiDung");

		List<GioHangSanPhamInfo> gioHangSanPhams = new ArrayList<>();
		for (GioHangSanPham gioHangSanPham : gioHangSanPhamDAO.findAll()) {
			GioHangSanPhamInfo gioHangSanPhamInfo = new GioHangSanPhamInfo();

			gioHangSanPhamInfo.setGia(gioHangSanPham.getSanPham().gia);
			gioHangSanPhamInfo.setHinhAnh(gioHangSanPham.getSanPham().hinhAnh);
			gioHangSanPhamInfo.setMoTa(gioHangSanPham.getSanPham().moTa);
			gioHangSanPhamInfo.setNguoiDungId(gioHangSanPham.getGioHang().getNguoiDung().getNguoi_dung_id());
			gioHangSanPhamInfo.setSoLuongSanPham(gioHangSanPham.getSoLuong());
			gioHangSanPhamInfo.setTenSanPham(gioHangSanPham.getSanPham().tenSanPham);
			if (gioHangSanPhamInfo.getNguoiDungId() == ng.getNguoi_dung_id()) {
				gioHangSanPhams.add(gioHangSanPhamInfo);
			}
		}
		model.addAttribute("gioHangSanPhamInfoList", gioHangSanPhams);
		for (GioHangSanPhamInfo gioHangSanPhamInfo : gioHangSanPhams) {
			System.out.println(gioHangSanPhamInfo.getTenSanPham());
		}
		return "shoppingCart";
	}

	@PostMapping("/addCart/{id}")
	public String addToCart(Model model, @PathVariable("id") int id, HttpServletRequest request) {
		// Get dữ liệu
		String soLuong = request.getParameter("quantity");
		System.out.println("Quantity: " + soLuong);
		NguoiDung ng = (NguoiDung) session.get("session_NguoiDung");
		Date ngayTao = new Date();

		SanPham pham = sanPhamDAO.findById(id);
		List<SanPham> listSp = new ArrayList<>();
		listSp.add(pham);
		NguoiDung ngDung = customerDAO.findByTenDangNhap(ng.getTenDangNhap());
		// Tạo giỏ hàng
		GioHang gioHang = new GioHang();
		List<GioHang> listgh = gioHangDAO.findAll();
		boolean check = false;
		for (GioHang gio : listgh) {
			if (gio.getNguoiDung().nguoi_dung_id == ngDung.getNguoi_dung_id()) {
				gioHang = gio;
			}
			check = true;
		}

		List<GioHangSanPham> listghsp = gioHangSanPhamDAO.findAll();
		if (check == true) {

			for (GioHangSanPham gioHangSp : listghsp) {
				if (id == gioHangSp.getSanPham().getId()) {
					System.out.println("Sản phẩm đã tồn tại trong giỏ hàng");
					return "redirect:/index";
				} else {
					GioHangSanPham gioHangSanPham = new GioHangSanPham();
					gioHangSanPham.setGioHang(gioHang);
					gioHangSanPham.setSanPham(pham);
					// gioHangSanPham.setSoLuong(Integer.valueOf(quantity));
					gioHangSanPhamDAO.save(gioHangSanPham);
				}
			}
		} else {
			gioHang.setNguoiDung(ng);
			gioHang.setNgay_tao(ngayTao);
			gioHangDAO.save(gioHang);

			// Tạo giỏ hàng sản phẩm
			GioHangSanPham gioHangSanPham = new GioHangSanPham();
			gioHangSanPham.setGioHang(gioHang);
			gioHangSanPham.setSanPham(pham);
			// gioHangSanPham.setSoLuong(Integer.valueOf(quantity));
			gioHangSanPhamDAO.save(gioHangSanPham);
			System.out.println("B");
		}

		System.out.println(new Date());
		return "redirect:/index";
	}
}
