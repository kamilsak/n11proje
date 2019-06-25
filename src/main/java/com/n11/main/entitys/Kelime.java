package com.n11.main.entitys;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.data.jpa.domain.AbstractPersistable;

@Entity
@Table(name="kelime")
public class Kelime extends AbstractPersistable<Long>{
	
	private transient Long id;
	
	private transient Long urunId;
	
	@Column(name="kayitTarihi")
	@Temporal(TemporalType.TIMESTAMP)
	private  Date kayitTarihi;
	
	@Column(name="kelime_adi")
	private String kelimeAdi;
	
	@OneToMany(mappedBy = "kelime" , cascade = CascadeType.ALL , targetEntity = Aramalar.class,fetch = FetchType.EAGER)
	@Column
	private List<Aramalar> aramalar = new ArrayList<>();
	
	@JoinColumn(name="urun_id")
	@ManyToOne()
	private Urun urun;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getKelimeAdi() {
		return kelimeAdi;
	}

	public void setKelimeAdi(String kelimeAdi) {
		this.kelimeAdi = kelimeAdi;
	}

	public List<Aramalar> getAramalar() {
		return aramalar;
	}

	public void setAramalar(List<Aramalar> aramalar) {
		this.aramalar = aramalar;
	}

	public Urun getUrun() {
		return urun;
	}

	public void setUrun(Urun urun) {
		this.urun = urun;
	}
	
	public Date getKayitTarihi() {
		return kayitTarihi;
	}

	public void setKayitTarihi(Date kayitTarihi) {
		this.kayitTarihi = kayitTarihi;
	}

	public Long getUrunId() {
		return urunId;
	}

	public void setUrunId(Long urunId) {
		this.urunId = urunId;
	}

	@Override
	public String toString() {
		return "Kelime [id=" + id + "]";
	}
	

	
	
}
