package com.example.demo.Dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.model.DonHang;

public interface DonHangDAO extends JpaRepository<DonHang, Integer> {
}

