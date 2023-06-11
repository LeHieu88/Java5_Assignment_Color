package com.poly.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.poly.Model.*;

public interface NguoiDungDichVuDAO extends JpaRepository<NguoiDungDichVu, Integer> {
	@Query("SELECT s FROM NguoiDungDichVu s WHERE s.dichVu.id = :dichVuId")
	List<NguoiDungDichVu> findByDichVuId(@Param("dichVuId") Integer sanPhamId);
}
