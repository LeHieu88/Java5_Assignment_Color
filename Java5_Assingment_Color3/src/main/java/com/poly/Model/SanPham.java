package com.poly.Model;

import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "sanpham")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class SanPham {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int id;

    @Column(name = "ten_san_pham", nullable = false)
    
    public String tenSanPham;

    @Column(name = "gia", nullable = false)
    
    public Double gia;

    @Column(name = "mo_ta")
    public String moTa;

    @Column(name = "hinh_anh")
    public String hinhAnh;
    
    @Column(name = "trang_thai")
    public boolean trangThai;

    @ManyToOne
    @JoinColumn(name = "nha_cung_cap_id", nullable = false)
    public NhaCungCap nhaCungCap;
    
    @Valid
    @OneToMany(mappedBy = "sanPham")
    public List<Kho> khoList;

    @OneToMany(mappedBy = "sanPham")
    public List<SanPhamMaGiamGia> sanPhamMaGiamGiaList;

    @OneToMany(mappedBy = "sanPham")
    public List<GioHangSanPham> gioHangSanPhamList;

    @OneToMany(mappedBy = "sanPham")
    public List<ChiTietDonHang> chiTietDonHangList;
}

