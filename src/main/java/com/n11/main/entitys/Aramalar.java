package com.n11.main.entitys;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.data.jpa.domain.AbstractPersistable;

@Entity
@Table(name = "aramalar")
public class Aramalar extends AbstractPersistable<Long> {
	
	private transient Long id;
	
	private transient Long kelimeId;

	@Column(name="aramaTarihi")
	@Temporal(TemporalType.TIMESTAMP)
	private  Date aramaTarihi;
	
	@Column(name="page")
	private int page;
	
	@Column(name="position")
	private String position;
	
	@JoinColumn(name="kelime_id")
	@ManyToOne
	private Kelime kelime;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getKelimeId() {
		return kelimeId;
	}

	public void setKelimeId(Long kelimeId) {
		this.kelimeId = kelimeId;
	}

	public Date getAramaTarihi() {
		return aramaTarihi;
	}

	public void setAramaTarihi(Date aramaTarihi) {
		this.aramaTarihi = aramaTarihi;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public Kelime getKelime() {
		return kelime;
	}

	public void setKelime(Kelime kelime) {
		this.kelime = kelime;
	}

	
	
	
}
