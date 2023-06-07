package com.example.demo.Dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.model.ChiTietDonHang;

public interface ChiTietDonHangDAO extends JpaRepository<ChiTietDonHang, Integer> {
    List<ChiTietDonHang> findBySanPhamId(Integer sanPhamId);

}

