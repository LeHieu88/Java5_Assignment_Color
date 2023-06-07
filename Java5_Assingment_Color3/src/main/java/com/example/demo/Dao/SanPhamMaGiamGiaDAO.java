package com.example.demo.Dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import com.example.demo.model.SanPhamMaGiamGia;

public interface SanPhamMaGiamGiaDAO extends JpaRepository<SanPhamMaGiamGia, Integer> {
	@Query("SELECT s FROM SanPhamMaGiamGia s WHERE s.sanPham.id = :sanPhamId")
	List<SanPhamMaGiamGia> findBySanPhamId(@Param("sanPhamId") Integer sanPhamId);
}
