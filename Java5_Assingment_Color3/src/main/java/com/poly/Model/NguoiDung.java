package com.poly.Model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;

import java.util.List;

@Entity
@Table(name = "nguoidung")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class NguoiDung {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int nguoi_dung_id;
    @NotEmpty
    @Size(min = 10, max = 20)
    @Pattern(regexp = "^[a-zA-Z0-9 ]+$")
    @Column(name = "ten_dang_nhap", nullable = false)
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
//
//    @OneToMany(mappedBy = "nguoiDung")
//    public List<GioHang> gioHangList;
//
//    @OneToMany(mappedBy = "nguoiDung")
//    public List<DonHang> donHangList;
//
//    @OneToMany(mappedBy = "nguoiDung")
//    public List<NguoiDungDichVu> nguoiDungDichVuList;
}