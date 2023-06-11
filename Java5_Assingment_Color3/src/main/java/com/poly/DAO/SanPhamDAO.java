package com.poly.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.poly.Model.SanPham;



public interface SanPhamDAO extends JpaRepository<SanPham, Integer>{
	SanPham findById(int id);

}