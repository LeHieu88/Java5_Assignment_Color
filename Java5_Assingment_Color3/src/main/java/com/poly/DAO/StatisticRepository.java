package com.poly.DAO;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.poly.Model.Statistic;

import java.util.List;

public interface StatisticRepository extends JpaRepository<Statistic, String> {
	@Query(value = "SELECT FORMAT(CONVERT(date, t1.thang_nam + '-01'), 'MM-yyyy') AS thang_nam, \r\n"
			+ "       COALESCE(t2.tong_thu, 0) AS tong_thu, \r\n" + "       COALESCE(t3.tong_chi, 0) AS tong_chi,\r\n"
			+ "       COALESCE(t2.tong_thu, 0) - COALESCE(t3.tong_chi, 0) AS loi\r\n" + "FROM (\r\n"
			+ "    SELECT DISTINCT CONVERT(VARCHAR(7), ngay_dat_hang, 126) AS thang_nam\r\n" + "    FROM don_hang\r\n"
			+ "    UNION ALL\r\n" + "    SELECT DISTINCT CONVERT(VARCHAR(7), ngay_nhap, 126) AS thang_nam\r\n"
			+ "    FROM kho\r\n" + ") t1\r\n" + "LEFT JOIN (\r\n"
			+ "    SELECT CONVERT(VARCHAR(7), ngay_dat_hang, 126) AS thang_nam,\r\n"
			+ "           SUM(tong_gia_tri) AS tong_thu\r\n" + "    FROM don_hang\r\n"
			+ "    GROUP BY CONVERT(VARCHAR(7), ngay_dat_hang, 126)\r\n" + ") t2 ON t1.thang_nam = t2.thang_nam\r\n"
			+ "LEFT JOIN (\r\n" + "    SELECT CONVERT(VARCHAR(7), ngay_nhap, 126) AS thang_nam,\r\n"
			+ "           SUM(gia_nhap * so_luong) AS tong_chi\r\n" + "    FROM kho\r\n"
			+ "    GROUP BY CONVERT(VARCHAR(7), ngay_nhap, 126)\r\n" + ") t3 ON t1.thang_nam = t3.thang_nam\r\n"
			+ "ORDER BY t1.thang_nam;\r\n" + "", nativeQuery = true)
	List<Statistic> getStatistics();
}
