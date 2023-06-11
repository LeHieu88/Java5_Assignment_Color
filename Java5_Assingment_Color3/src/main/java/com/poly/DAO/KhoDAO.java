package com.poly.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.poly.Model.Kho;


public interface KhoDAO extends JpaRepository<Kho, Integer> {
	List<Kho> findBySanPhamId(Integer sanPhamId);
}
