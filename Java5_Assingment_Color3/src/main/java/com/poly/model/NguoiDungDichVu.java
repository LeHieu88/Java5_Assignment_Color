package com.poly.Model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import jakarta.persistence.*;

@Entity
@Table(name = "nguoidung_dichvu")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class NguoiDungDichVu {
	@Id
	@JoinColumn(name = "nguoidung_dichvu_id", nullable = false)
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int nguoidung_dichvu_id;

	@ManyToOne
	@JoinColumn(name = "nguoidung_id", nullable = false)
	public NguoiDung nguoiDung;

	@ManyToOne
	@JoinColumn(name = "dichvu_id", nullable = false)
	public DichVu dichVu;
}
