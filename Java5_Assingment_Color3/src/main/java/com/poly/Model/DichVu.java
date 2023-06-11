package com.poly.Model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import jakarta.persistence.*;
import java.util.List;

@Entity
@Table(name = "dich_vu")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class DichVu {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	public int id;
	
	@Column(name = "ten_dich_vu")
	public String tenDichVu;
	
	@Column(name = "mo_ta")
	public String moTa;
	
	@Column(name = "gia")
	public double gia;

	@OneToMany(mappedBy = "dichVu")
	public List<NguoiDungDichVu> nguoiDungDichVuList;

	@OneToMany(mappedBy = "dichVu")
	public List<DonHangDichVu> donHangDichVuList;
}
