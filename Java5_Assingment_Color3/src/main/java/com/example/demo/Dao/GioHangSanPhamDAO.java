package com.example.demo.Dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.model.GioHangSanPham;

public interface GioHangSanPhamDAO extends JpaRepository<GioHangSanPham, Integer> {
    List<GioHangSanPham> findBySanPhamId(Integer sanPhamId);

}

