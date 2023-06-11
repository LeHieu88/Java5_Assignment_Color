package com.poly.DAO;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.poly.Model.DichVu;



public interface DichVuDAO extends JpaRepository<DichVu, Integer> {
	@Modifying
	@Query("UPDATE DichVu SET gia = :gia, moTa = :moTa, tenDichVu = :tenDichVu WHERE id = :id")
	void updateDichVuById(@Param("id") int id, @Param("gia") double gia, @Param("moTa") String moTa,
			@Param("tenDichVu") String tenDichVu);

}
