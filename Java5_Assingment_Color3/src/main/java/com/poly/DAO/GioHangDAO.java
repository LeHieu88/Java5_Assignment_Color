package com.poly.DAO;

import org.springframework.data.jpa.repository.JpaRepository;

import com.poly.Model.GioHang;

public interface GioHangDAO extends JpaRepository<GioHang, Integer> {
}

