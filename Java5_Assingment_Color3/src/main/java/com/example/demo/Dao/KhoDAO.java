package com.example.demo.Dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.model.Kho;

public interface KhoDAO extends JpaRepository<Kho, Integer> {
	List<Kho> findBySanPhamId(Integer sanPhamId);
}
