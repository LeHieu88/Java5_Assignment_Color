package com.poly.Model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import jakarta.persistence.*;
import java.util.List;

@Entity
@Table(name = "nhacungcap")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class NhaCungCap {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int id;

    @Column(name = "ten_nhacungcap", nullable = false)
    public String tenNhaCungCap;

    @Column(name = "dia_chi")
    public String diaChi;

    @Column(name = "so_dien_thoai")
    public String soDienThoai;

    @Column(name = "email")
    public String email;

    @OneToMany(mappedBy = "nhaCungCap")
    public List<SanPham> sanPhamList;

}

