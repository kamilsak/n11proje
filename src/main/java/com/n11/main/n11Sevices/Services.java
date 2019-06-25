package com.n11.main.n11Sevices;

import java.util.List;

import com.n11.main.entitys.Aramalar;
import com.n11.main.entitys.Kelime;
import com.n11.main.entitys.Urun;

public interface Services {
	
	Urun urunAdd(Urun urun);
	String urunResminiBul(String url);
	String urunAciklamasi(String url);
	String urunIdBul(String url);
	List<Urun> urunList();
	Urun urunCekById(Long id);
	Kelime kelemeAdd(Kelime kelime);
	void kelimeSil(Long id);
	void urunSil(Long id);
	void aramaAdd(String kelime,String urunId,Long kelimeId);
	Kelime kelemiCek(Long id);
	List<Aramalar> sonArama(int n);
	List<Kelime> tumKelimelerByUrunId(Urun urun_id);

}
