package com.poly.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.poly.Model.GioHangSanPham;


public interface GioHangSanPhamDAO extends JpaRepository<GioHangSanPham, Integer> {
    List<GioHangSanPham> findBySanPhamId(Integer sanPhamId);
}

