package com.poly.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.poly.Model.DichVu;

@Repository
public interface DichVuRepository extends JpaRepository<DichVu, Long> {
	@Query("SELECT dv.tenDichVu, COUNT(ct.soLuong) AS soLuongDichVu, SUM(ct.gia) AS tongTien " + "FROM DichVu dv "
			+ "JOIN DonHangDichVu dd ON dv.id = dd.dichVu.id "
			+ "JOIN ChiTietDonHang ct ON dd.donHang.id = ct.donHang.id " + "GROUP BY dv.tenDichVu")
	List<Object[]> getDichVuStatistics();
}
