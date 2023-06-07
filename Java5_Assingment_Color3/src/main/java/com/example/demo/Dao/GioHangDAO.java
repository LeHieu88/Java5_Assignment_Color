package com.example.demo.Dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.model.GioHang;

public interface GioHangDAO extends JpaRepository<GioHang, Integer> {
}

