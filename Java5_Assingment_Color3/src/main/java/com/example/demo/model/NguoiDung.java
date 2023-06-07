package com.example.demo.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;

import java.util.List;

@Entity
@Table(name = "nguoidung")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class NguoiDung {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @JoinColumn(name = "nguoi_dung_id", nullable = false)
    public int nguoi_dung_id;

    @Column(name = "ten_dang_nhap", nullable = false)
    @NotBlank(message = "{NotBlank.user.tenDangNhap}")
    public String tenDangNhap;

    @Column(name = "mat_khau", nullable = false)
    public String matKhau;

    @Column(name = "email", nullable = false)
    public String email;

    @Column(name = "ho_ten")
    public String hoTen;

    @Column(name = "dia_chi")
    public String diaChi;

    @Column(name = "so_dien_thoai")
    public String soDienThoai;

    @Column(name = "chuc_vu")
    public boolean chucVu;
    
    @Column(name = "khoa")
    public boolean khoa;

    @OneToMany(mappedBy = "nguoiDung")
    public List<GioHang> gioHangList;

    @OneToMany(mappedBy = "nguoiDung")
    public List<DonHang> donHangList;

    @OneToMany(mappedBy = "nguoiDung")
    public List<NguoiDungDichVu> nguoiDungDichVuList;
}
