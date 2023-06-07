package com.example.demo.Dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.demo.model.DichVu;
import com.example.demo.model.DonHangDichVu;
import com.example.demo.model.SanPhamMaGiamGia;

public interface DonHangDichVuDAO extends JpaRepository<DonHangDichVu, Integer> {
	@Query("SELECT s FROM DonHangDichVu s WHERE s.dichVu.id = :dichVuId")
	List<DonHangDichVu> findByDichVuId(@Param("dichVuId") Integer sanPhamId);
}



