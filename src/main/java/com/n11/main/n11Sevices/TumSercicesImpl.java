package com.n11.main.n11Sevices;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import org.jsoup.Connection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.n11.main.entitys.Aramalar;
import com.n11.main.entitys.Kelime;
import com.n11.main.entitys.Urun;
import com.n11.main.repository.AramaRepository;
import com.n11.main.repository.KelimeRepository;
import com.n11.main.repository.UrunRepository;


@Service
public class TumSercicesImpl implements Services{
	
	@Autowired
	private UrunRepository urunRepository;
	
	@Autowired
	private KelimeRepository kelimeRepository;
	
	@Autowired
	private AramaRepository aramaRepository;

	@Override
	public Urun urunAdd(Urun urun) {
		return urunRepository.save(urun);
	}

	@Override
	public String urunResminiBul(String url) {
		String resimUrl = null;
		Connection connection = Jsoup.connect(url)
				.userAgent(
						"Mozilla/5.0 (Windows; U; WindowsNT 5.1; en-US; rv1.8.1.6) Gecko/20070725 Firefox/2.0.0.6")
				.referrer("http://www.google.com").timeout(300000).ignoreContentType(true);
		try {
			Document document = connection.get();
			Element elementView = document.select("div.imgObj").first();
			resimUrl = elementView.selectFirst("img").absUrl("data-src");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return resimUrl;
	}

	@Override
	public String urunAciklamasi(String url) {
		String aciklama = null;
		Connection connection = Jsoup.connect(url)
				.userAgent(
						"Mozilla/5.0 (Windows; U; WindowsNT 5.1; en-US; rv1.8.1.6) Gecko/20070725 Firefox/2.0.0.6")
				.referrer("http://www.google.com").timeout(300000).ignoreContentType(true);
		try {
			Document document = connection.get();
			Element elementView = document.select("div.nameHolder").first();
			aciklama = elementView.selectFirst("h1").text();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return aciklama;
	}

	@Override
	public String urunIdBul(String url) {
		String[] parts = url.split("-P");
		String part2 = parts[1];
		return part2;
	}

	@Override
	public List<Urun> urunList() {
		return urunRepository.findAll();
	}

	@Override
	public Urun urunCekById(Long id) {
		return urunRepository.getOne(id);
	}

	@Override
	public Kelime kelemeAdd(Kelime kelime) {
		return kelimeRepository.save(kelime);
	}

	@Override
	public void kelimeSil(Long id) {
		kelimeRepository.deleteById(id);
		
	}

	@Override
	public void urunSil(Long id) {
		urunRepository.deleteById(id);
	}

	@Override
	public void aramaAdd(String kelime,String urunId,Long kelimeId) {
		//System.setProperty("http.proxyHost", "Buraya proxy host adresini yazınız.");
		//System.setProperty("http.proxyPort", "Buraya proxy port numarasını yazınız.");
		try {
			getPositionBySearchText(kelime, urunId,kelimeId);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public void getPositionBySearchText(String searchText, String urunId,Long kelimeId) throws IOException {
		int page = 1;
		boolean isPageActive = true;

		while (isPageActive) {
			if (page < 21) {
				
				String url = "https://www.n11.com/arama?q=" + searchText + "&pg=" + page;
				Connection connection = Jsoup.connect(url)
						.userAgent(
								"Mozilla/5.0 (Windows; U; WindowsNT 5.1; en-US; rv1.8.1.6) Gecko/20070725 Firefox/2.0.0.6")
						.referrer("http://www.google.com").timeout(300000).ignoreContentType(true);
				Document document = connection.get();
				if (hasSearchList(document)) {
					if (hasPage(document, searchText)) {
						System.out.println(page + ".sayfada aranıyor...");
						Elements elementView = document.select("#view");
						Elements elementsLi = elementView.get(0).select("li");
						for (Element elementLi : elementsLi) {
							Elements elementsX = elementLi.select("div").get(0).getElementsByAttributeValue("id", "p-"+urunId);
							if (elementsX != null && elementsX.size() > 0) {
								String position = elementsX.get(0).attr("data-position");
								Kelime kelime = kelimeRepository.getOne(kelimeId);
								Aramalar arama = new Aramalar();
								arama.setAramaTarihi(new Date());
								arama.setPage(page);
								arama.setPosition(position);
								arama.setKelime(kelime);
								aramaRepository.saveAndFlush(arama);
								System.out.println("Sayfa: " + page + "   Sıra: " + position);
								isPageActive = false;
								break;
							}
						}
						page++;
					} else {
						isPageActive = false;
						System.out.println("Ürün listede bulunamadı.");
					}
				}else {
					isPageActive = false;
					System.out.println("Arama kriterine uygun ürün bulunamadı.");
				}
				
			}else {
				isPageActive = false;
				System.out.println("ilk 20 sayfada bulunamadı =============");
			}
			
		}
	}
	public static boolean hasSearchList(Document document) {
		Elements elements = document.select("#searchResultNotFound > div");
		if (elements.size() > 0) {
			return false;
		}
		return true;
	}
	public static boolean hasPage(Document document, String searchText) {
		return document.baseUri().equals("https://www.n11.com/arama?q=" + searchText) ? false : true;
	}

	@Override
	public Kelime kelemiCek(Long id) {
		return kelimeRepository.getOne(id);
	}

	@Override
	public List<Aramalar> sonArama(int n) {
		return aramaRepository.sonArama(n);
	}

	@Override
	public List<Kelime> tumKelimelerByUrunId(Urun urun_id) {
		return kelimeRepository.kelimeleriCekByUrunId(urun_id);
	}

}
