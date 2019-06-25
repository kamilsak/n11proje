package com.n11.main.web;

import java.util.Collections;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.n11.main.entitys.Aramalar;
import com.n11.main.entitys.Kelime;
import com.n11.main.entitys.Urun;
import com.n11.main.n11Sevices.Services;

@Controller
public class WebController {
	
	@Autowired
	private Services services;
	
	@RequestMapping("/")
	public String anaSayfa(Model model) {
		List<Urun> urunler = services.urunList();
		for (Urun urun : urunler) {
			for (Kelime kelime : urun.getKelimeler()) {
				Collections.reverse(kelime.getAramalar());
				for (Aramalar arama : kelime.getAramalar()) {
					System.out.println(arama.getPosition()+"===============================2132131313132");
					
				}
			}
		}
		model.addAttribute("urun", new Urun());
		model.addAttribute("urunList", urunler);
		
		return "index";
		
	}
	@PostMapping("/urunAdd")
	public  String adresAdd( @ModelAttribute("urun")  Urun urun, Model model)  {
		try {
			String url = services.urunResminiBul(urun.getUrl());
			String aciklama = services.urunAciklamasi(urun.getUrl());
			urun.setUrunResimUrl(url);;
			urun.setUrunAciklama(aciklama);;
			urun.setUrunId(services.urunIdBul(urun.getUrl()));;
			services.urunAdd(urun);
		} catch (Exception e) {
			System.out.println("hata varrr ======================");
			return "redirect:/";
		}
		
		/*
		 * if(url != null && aciklama != null) {
		 * 
		 * }
		 */
		return "redirect:/";
	}
	@GetMapping("/kelimeEkle/{id}")
	public String urunEdit(@PathVariable Long id, Model model) {
		model.addAttribute("ab", id);
		model.addAttribute("kelime", new Kelime());
		return "form";
	}
	@PostMapping("/kelimeAdd")
	public  String kelimeAdd( @ModelAttribute("kelime")  Kelime kelime, Model model) {
		Urun urun = services.urunCekById(kelime.getUrunId());
		kelime.setKayitTarihi(new Date());
		kelime.setUrun(urun);
		Kelime kelime1 = services.kelemeAdd(kelime);
		services.aramaAdd(kelime1.getKelimeAdi(), urun.getUrunId(), kelime1.getId());
		return "redirect:/";
	}
	@GetMapping("/kelimeSil/{id}")
	public String kelimeSil(@PathVariable Long id, Model model) {
		services.kelimeSil(id);
		return "redirect:/";
	}
	@GetMapping("/urunSil/{id}")
	public String urunSil(@PathVariable Long id, Model model) {
		services.urunSil(id);
		return "redirect:/";
	}
	@GetMapping("/grafic/{id}")
	public String grafic(@PathVariable Long id,Model model) {
		StringBuilder tarih = new StringBuilder("[");
		Kelime kelime = services.kelemiCek(id);
		Map<Date, String> data = new LinkedHashMap<>();
		for (Aramalar arama : kelime.getAramalar()) {
			data.put(arama.getAramaTarihi(), arama.getPosition());
			tarih.append("'"+arama.getAramaTarihi()+"', ");
		}
		tarih.append("]");
		model.addAttribute("datas", data);
		model.addAttribute("tarih", tarih);
		return "grafic";
	}
}
