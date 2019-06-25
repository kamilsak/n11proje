package com.n11.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;

import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import com.n11.main.entitys.Kelime;
import com.n11.main.entitys.Urun;
import com.n11.main.n11Sevices.Services;

@EnableScheduling
@SpringBootApplication
public class N11ProjeApplication extends WebMvcConfigurerAdapter{
	
	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		registry.addViewController("/index").setViewName("index");
	}

	@Autowired
	private Services services;
	
	public static void main(String[] args) {
		SpringApplication.run(N11ProjeApplication.class, args);
	}
	@Scheduled( cron  =  "0 0 4,16 * * *" )
	public void run() {
		List<Urun> urunler = services.urunList();
		if(urunler.size() > 0)
		for (Urun urun : urunler) {
			String urunId = urun.getUrunId();
			List<Kelime> kelimeler = services.tumKelimelerByUrunId(urun);
				if(kelimeler.size() > 0) {
					for (Kelime kelime : kelimeler) {
						System.out.println("Aranan Kelime; " +kelime.getKelimeAdi());
						services.aramaAdd(kelime.getKelimeAdi(), urunId, kelime.getId());
						System.out.println("bitti =============");
					}
				}
				
		}
	    
	}

}
