package com.n11.main.repository;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.n11.main.entitys.Aramalar;

public interface AramaRepository extends JpaRepository<Aramalar, Long>{

	@Query(value = "SELECT * FROM Aramalar order by id desc limit :limit", nativeQuery = true)
	public List<Aramalar> sonArama(@Param("limit") int limit);
}
