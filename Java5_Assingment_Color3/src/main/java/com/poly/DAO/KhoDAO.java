package com.poly.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.poly.Model.Kho;

import jakarta.transaction.Transactional;

public interface KhoDAO extends JpaRepository<Kho, Integer> {
	Kho findBySanPhamId(Integer sanPhamId);

	@Transactional
	@Modifying
	@Query("UPDATE Kho k SET k.soLuong = :soLuong WHERE k.id = :id")
	void updateSoLuongById(Integer id, Integer soLuong);
}
