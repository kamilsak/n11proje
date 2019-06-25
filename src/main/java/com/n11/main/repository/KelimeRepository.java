package com.n11.main.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.n11.main.entitys.Kelime;
import com.n11.main.entitys.Urun;

public interface KelimeRepository extends JpaRepository<Kelime, Long>{
	
	@Query("FROM Kelime WHERE urun=:urun_id") 
	  List<Kelime>  kelimeleriCekByUrunId(@Param("urun_id") Urun urun_id);

}
