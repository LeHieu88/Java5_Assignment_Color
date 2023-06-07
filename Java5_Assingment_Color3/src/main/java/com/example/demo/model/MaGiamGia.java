package com.example.demo.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import jakarta.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "magiamgia")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class MaGiamGia {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int id;

    @Column(name = "ma", nullable = false)
    public String ma;

    @Column(name = "gia_tri", nullable = false)
    public double giaTri;

    @Temporal(TemporalType.DATE)
    @Column(name = "ngay_bat_dau")
    Date ngay_bat_dau = new Date();

    @Temporal(TemporalType.DATE)
    @Column(name = "ngay_ket_thuc")
    Date ngay_ket_thuc = new Date();

    @Column(name = "so_luong_san_pham", nullable = false)
    public int soLuongSanPham;

    @OneToMany(mappedBy = "maGiamGia")
    public List<SanPhamMaGiamGia> sanPhamMaGiamGiaList;
}

