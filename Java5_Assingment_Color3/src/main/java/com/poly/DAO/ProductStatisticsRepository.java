package com.poly.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.poly.Model.ProductStatistics;

public interface ProductStatisticsRepository extends JpaRepository<ProductStatistics, Long> {

	@Query(value = "SELECT sp.ten_san_pham, " + "COALESCE(dh.so_luong_ban, 0) AS so_luong_ban, "
			+ "COALESCE(nh.so_luong_nhap, 0) - COALESCE(dh.so_luong_ban, 0) AS so_luong_con_lai, "
			+ "COALESCE(dh.tong_tien_ban, 0) AS tong_tien_ban " + "FROM sanpham sp " + "LEFT JOIN ( "
			+ "   SELECT nhap.san_pham_id, SUM(nhap.so_luong) AS so_luong_nhap " + "   FROM kho nhap "
			+ "   GROUP BY nhap.san_pham_id " + ") nh ON sp.id = nh.san_pham_id " + "LEFT JOIN ( "
			+ "   SELECT don_hang.don_hang_id, " + "   SUM(chi_tiet.so_luong) AS so_luong_ban, "
			+ "   SUM(chi_tiet.gia_ban * chi_tiet.so_luong) AS tong_tien_ban " + "   FROM don_hang "
			+ "   JOIN chi_tiet_don_hang chi_tiet ON don_hang.don_hang_id = chi_tiet.don_hang_id "
			+ "   GROUP BY don_hang.don_hang_id " + ") dh ON sp.id = dh.don_hang_id", nativeQuery = true)
	List<ProductStatistics> getProductStatistics();
}
