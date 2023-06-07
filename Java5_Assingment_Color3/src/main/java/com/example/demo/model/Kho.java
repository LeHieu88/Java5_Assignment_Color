package com.example.demo.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import jakarta.persistence.*;

@Entity
@Table(name = "kho")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Kho {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @JoinColumn(name = "id", nullable = false)
    public int id;

    @ManyToOne
    @JoinColumn(name = "san_pham_id", nullable = false)
    public SanPham sanPham;

    @Column(name = "so_luong", nullable = false)
    public int soLuong;

    @Column(name = "gia_nhap", nullable = false)
    public double giaNhap;
}

