package com.example.demo.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

import jakarta.persistence.*;

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
    public double gia;

    @Column(name = "mo_ta")
    public String moTa;

    @Column(name = "hinh_anh")
    public String hinhAnh;
    
    @Column(name = "trang_thai")
    public boolean trangThai;

    @ManyToOne
    @JoinColumn(name = "nha_cung_cap_id", nullable = false)
    public NhaCungCap nhaCungCap;

    @OneToMany(mappedBy = "sanPham")
    public List<Kho> khoList;

    @OneToMany(mappedBy = "sanPham")
    public List<SanPhamMaGiamGia> sanPhamMaGiamGiaList;

    @OneToMany(mappedBy = "sanPham")
    public List<GioHangSanPham> gioHangSanPhamList;

    @OneToMany(mappedBy = "sanPham")
    public List<ChiTietDonHang> chiTietDonHangList;
}

