package com.poly.DAO;

import org.springframework.data.jpa.repository.JpaRepository;

import com.poly.Model.DonHang;

public interface DonHangDAO extends JpaRepository<DonHang, Integer> {
}

