package com.n11.main.entitys;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.data.jpa.domain.AbstractPersistable;

@Entity
@Table(name="urun")
public class Urun extends AbstractPersistable<Long>{
	
	private transient Long id;
	
	@Column(name="url")
	private String url ;
	
	@Column(name="urunId")
	private String urunId;
	
	@Column(name="urunResimUrl")
	private String urunResimUrl;
	
	@Column(name="urunAciklama")
	private String urunAciklama;
	
	@Column(name = "kelimeler")
	@OneToMany(mappedBy = "urun" , cascade = CascadeType.ALL , targetEntity = Kelime.class,fetch = FetchType.LAZY)
	private List<Kelime> kelimeler = new ArrayList<>();
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	

	public List<Kelime> getKelimeler() {
		return kelimeler;
	}

	public void setKelimeler(List<Kelime> kelimeler) {
		this.kelimeler = kelimeler;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getUrunId() {
		return urunId;
	}

	public void setUrunId(String urunId) {
		this.urunId = urunId;
	}
	
	public String getUrunResimUrl() {
		return urunResimUrl;
	}

	public void setUrunResimUrl(String urunResimUrl) {
		this.urunResimUrl = urunResimUrl;
	}

	public String getUrunAciklama() {
		return urunAciklama;
	}

	public void setUrunAciklama(String urunAciklama) {
		this.urunAciklama = urunAciklama;
	}

	@Override
	public String toString() {
		return "Urun [url=" + url + ", urunId=" + urunId + ", urunResimUrl=" + urunResimUrl + ", urunAciklama="
				+ urunAciklama + ", kelimeler=" + kelimeler + "]";
	}

	
	
}
