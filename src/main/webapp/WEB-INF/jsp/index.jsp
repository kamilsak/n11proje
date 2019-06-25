<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@  taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<title>Insert title here</title>
</head>
<body>
<!-- <script>
	jQuery(function() {
		jQuery('#modal').click();
	});
</script> -->
	<div class="col-lg-12" style="margin-bottom: 20px;">
		<div>

			<div class="marketplaces" data-id="N11"
				style="cursor: pointer; float: left; height: 40px; background-color: rgb(245, 247, 248); border-top-left-radius: 10px; border-top-right-radius: 10px; padding: 11px; color: orange; font-weight: 400; border-width: 1px 1px 0px; border-top-style: solid; border-right-style: solid; border-left-style: solid; border-top-color: rgb(207, 216, 220); border-right-color: rgb(207, 216, 220); border-left-color: rgb(207, 216, 220); border-image: initial; border-bottom-style: initial; border-bottom-color: initial; width: auto; position: relative; font-size: 13px;">
				n11</div>

			<div style="clear: left;"></div>
		</div>
		<div
			style="background-color: white; border: 1px solid #CFD8DC; width: 100%; padding: 20px; margin-top: -1px;">
			<div style="float: left; margin-left: 0px;" class="row col-md-12">
				<div class="col-md-6" id="KeywordTrackerImportDiv">
					<div class="panel panel-default">
						<div class="panel-heading">
							<strong> <span class="glyphicon glyphicon-plus-sign"></span>
								<span class="glyphicon glyphicon-edit"></span>
							</strong>
						</div>

						<form:form method="post" class="form-horizontal" action="${path}/urunAdd"
							modelAttribute="urun" id="submitUserForm">
							<form:hidden path="id" />
							<div class="panel-body">
								<div class="form-group">
									<label class="col-md-6 control-label">Ürün linkini giriniz:</label>
									<div class="col-md-6">
										<form:input class="form-control" path="url"
											placeholder="ürün linkini giriniz" />
									</div>
								</div>
								
							</div>
							<div class="panel-footer">
								<form:button value="Save" class="btn btn-xs btn-default">
									<span class="fa fa-paper-plane" aria-hidden="true"></span>
					Gönder
			</form:button>
							</div>
						</form:form>
					</div>
				</div>
				<div class="col-md-6">
					<div
						style="text-align: center; margin: auto; background-color: #ef5350; color: white; padding-top: 6px; padding-bottom: 6px; border-radius: 4px;">
						<i class="fas fa-exclamation-triangle"></i> 7 gün boyunca bu
						sayfaya giriş yapmadığınızda kelimelerin takibi durdurulacaktır.
					</div>
				</div>
			</div>
			<div style="clear: left;"></div>
		</div>
	</div>
	<c:forEach items="${urunList}" var="urun">
	<div data-id="417" data-asin="0" style="" class="col-lg-12 col-md-12 col-sm-12 marketN11 marketTUMU">
    <div class="card">
        <div class="getstocks" style="cursor: pointer;" data-id="417" data-ishide="0" data-asin="0" onclick="GetProductStocks(this,event)" id="getstocks417" data-market="N11" data-marketproductid="342734745">
            <div class="card-body py-0" style="margin: 7px 0px 7px 0px;">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="justify-content-center">
                            <div class="col-md-12">
                                <div class="row">
                                    <div class="col-md-1" style="text-align: center;">
                                        <img src= "${urun.urunResimUrl}" class="image" style="max-width: 100%; max-height: 100%;">
                                    </div>
                                    <div class="col-md-10" style="margin: auto;">
                                        <div class="name"> ${urun.urunAciklama} </div>
                                        <div class="MarketID"><img style="max-width:20px;" src="https://users.nesatilir.com/Content/images/nesatilir-n11-logo.png"><a style="margin-left: 10px; color: #FF9100; font-weight: 500;" target="_blank" href="${urun.urunResimUrl}"> ${urun.urunId} </a></div>
                                    </div>
                                    
                                    
                                    <div class="col-md-1 row" style="text-align: right;margin:auto;">
                                        <div class="col-md-4">
                                            &nbsp;
                                        </div>
                                        <div class="col-md-4">
                                            <div class="addkeyword" data-id="417" > <a href="${path}/kelimeEkle/${urun.id}"><i style="font-size: 20px; color: grey;" class="fa fa-plus"></i></a>
                                            </div>
                                            <div class="delete" data-id="417" ><a href="${path}/urunSil/${urun.id }"><i style="margin-top: 14px;font-size: 20px; color: grey;" class="fa fa-trash"></i></a></div>
                                            <div class="viewamazon"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
    </div>
<div class="sellerslist" style="width: 100%; margin: 0px; padding: 27px 37px 37px;" id="sellerslist417">
            <div class="row" style="box-shadow: rgba(0, 0, 0, 0.14) 0px 2px 2px 0px, rgba(0, 0, 0, 0.12) 0px 3px 1px -2px, rgba(0, 0, 0, 0.2) 0px 1px 5px 0px;">
                <div class="row col-lg-12" style="padding-bottom:5px; background-color: #F18F01; color: white; font-weight: 600; margin: 0px; padding-top: 5px;">
                    <div class="col-sm-2">Kelime</div>
                    
                    <div class="col-sm-1" style="text-align:center;">Eklenme Tarihi</div>
                    <div class="col-sm-2" style="text-align:center;">Genel Sıralama</div>
                    <div class="col-sm-1" style="text-align:center;">Değişim</div>
                    <div class="col-sm-3" style="text-align:center;">Trend</div>
                    <div class="col-sm-2" style="text-align:center;">Sayfa</div>
                    <div class="col-sm-1" style="text-align:center;">İşlemler</div>

                </div>
                
           <c:forEach items="${urun.kelimeler}" var="kelime">   
                <div class="sellerlist2 row col-lg-12" style="margin: 0px; max-height: 500px; overflow: auto; background-color: white;"><div class="col-lg-12 row" style="padding-right: 0px;margin-left: 0px;height: 65px;background-color:white">
                <div title="Ürünlerin kaçıncı sırada olduklarını takip ettiğiniz kelime öbeklerini belirtir." id="keyword1451" class="col-sm-2" style="margin: auto;font-weight:600;padding-left:0px;">${kelime.kelimeAdi}</div> 
                <div title="Ürünün belirlenen kelimede takibinin başladığı tarihi belirtir." class="col-sm-1" style="margin: auto;text-align:center;">${kelime.kayitTarihi }</div>
                <div title="Ürünün belirlenen kelimedeki genel sıralamasını belirtir." class="col-sm-2" style="text-align:center;margin: auto;"><span style="color:#FF9100"><c:out value="${kelime.aramalar[0].position}" /></span></div>
                <div title="Ürün sıralamasının son ziyaretten bu yana nasıl bir değişim gösterdiğini belirtir." class="col-sm-1" style="text-align:center;margin: auto;"><span style="color:red;"><c:out value="${kelime.aramalar[0].position - kelime.aramalar[1].position }" /></span></div>
                <div title="Ürünün belirlenen kelimedeki sıralamasında oluşan değişiklikleri gösterir." class="adres-jsp col-sm-3" style="text-align:center;margin: auto;">
                <%-- <a href="javascript:void(0);"
											id="modal" onclick="list('grafic', '${kelime.id }')"></a> --%>
                <div id="sparkline_line_cl1451" data-highcharts-chart="0" style="overflow: hidden;">
                
                <div id="highcharts-oityl8s-0" dir="ltr" class="highcharts-container " style="position: relative; overflow: visible; width: 100px; height: 50px; text-align: left; line-height: normal; z-index: 0; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);">
                
                <svg version="1.1" class="highcharts-root" style="font-family:&quot;Lucida Grande&quot;, &quot;Lucida Sans Unicode&quot;, Arial, Helvetica, sans-serif;font-size:12px;overflow:visible;" xmlns="http://www.w3.org/2000/svg" width="100" height="50" viewBox="0 0 100 50"><desc>Created with Highcharts 7.1.2</desc><defs><clipPath id="highcharts-oityl8s-1-"><rect x="0" y="0" width="80" height="25" fill="none"></rect></clipPath></defs><rect fill="white" class="highcharts-background" x="0" y="0" width="100" height="50" rx="0" ry="0"></rect><rect fill="none" class="highcharts-plot-background" x="10" y="10" width="80" height="25"></rect><rect fill="none" class="highcharts-plot-border" data-z-index="1" x="10" y="10" width="80" height="25"></rect><g class="highcharts-grid highcharts-xaxis-grid" data-z-index="1"></g><g class="highcharts-grid highcharts-yaxis-grid" data-z-index="1"></g><g class="highcharts-axis highcharts-xaxis" data-z-index="2"><path fill="none" class="highcharts-axis-line" stroke="#ccd6eb" stroke-width="1" data-z-index="7" d="M 10 35.5 L 90 35.5"></path></g><g class="highcharts-axis highcharts-yaxis" data-z-index="2"><path fill="none" class="highcharts-axis-line" data-z-index="7" d="M 10 10 L 10 35"></path></g><g class="highcharts-series-group" data-z-index="3"><g data-z-index="0.1" class="highcharts-series highcharts-series-0 highcharts-line-series highcharts-color-0 " transform="translate(10,10) scale(1 1)" clip-path="url(#highcharts-oityl8s-1-)"><path fill="none" d="M 0.7843137254902 4.757742257742258 L 3.314358001265 20.616883116883116 L 5.8444022770398 20.367132867132867 L 8.3744465528147 3.1343656343656345 L 10.90449082859 2.634865134865135 L 13.434535104364 1.1363636363636367 L 15.964579380139 1.5109890109890112 L 18.494623655914 2.884615384615385 L 21.024667931689 3.3841158841158845 L 23.554712207464 2.634865134865135 L 26.084756483238 2.75974025974026 L 28.614800759013 2.884615384615385 L 31.144845034788 2.884615384615385 L 33.674889310563 5.132367632367632 L 36.204933586338 4.882617382617383 L 38.734977862113 23.863636363636363 L 41.265022137887 23.48901098901099 L 43.795066413662 20.49200799200799 L 46.325110689437 20.367132867132867 L 48.855154965212 22.115384615384617 L 51.385199240987 21.865634365634367 L 53.915243516762 16.62087912087912 L 56.445287792536 16.62087912087912 L 58.975332068311 12.624875124875125 L 61.505376344086 12.624875124875125 L 64.035420619861 15.122377622377622 L 66.565464895636 15.122377622377622 L 69.09550917141 17.994505494505493 L 71.625553447185 17.744755244755243 L 74.15559772296 19.742757242757243 L 76.685641998735 19.11838161838162 L 79.21568627451 20.242257742257742" class="highcharts-graph" data-z-index="1" stroke="#7cb5ec" stroke-width="2" stroke-linejoin="round" stroke-linecap="round"></path><path fill="none" d="M -9.2156862745098 4.757742257742258 L 0.7843137254902 4.757742257742258 L 3.314358001265 20.616883116883116 L 5.8444022770398 20.367132867132867 L 8.3744465528147 3.1343656343656345 L 10.90449082859 2.634865134865135 L 13.434535104364 1.1363636363636367 L 15.964579380139 1.5109890109890112 L 18.494623655914 2.884615384615385 L 21.024667931689 3.3841158841158845 L 23.554712207464 2.634865134865135 L 26.084756483238 2.75974025974026 L 28.614800759013 2.884615384615385 L 31.144845034788 2.884615384615385 L 33.674889310563 5.132367632367632 L 36.204933586338 4.882617382617383 L 38.734977862113 23.863636363636363 L 41.265022137887 23.48901098901099 L 43.795066413662 20.49200799200799 L 46.325110689437 20.367132867132867 L 48.855154965212 22.115384615384617 L 51.385199240987 21.865634365634367 L 53.915243516762 16.62087912087912 L 56.445287792536 16.62087912087912 L 58.975332068311 12.624875124875125 L 61.505376344086 12.624875124875125 L 64.035420619861 15.122377622377622 L 66.565464895636 15.122377622377622 L 69.09550917141 17.994505494505493 L 71.625553447185 17.744755244755243 L 74.15559772296 19.742757242757243 L 76.685641998735 19.11838161838162 L 79.21568627451 20.242257742257742 L 89.21568627451 20.242257742257742" visibility="visible" data-z-index="2" class="highcharts-tracker-line" stroke-linejoin="round" stroke="rgba(192,192,192,0.0001)" stroke-width="22"></path></g><g data-z-index="0.1" class="highcharts-markers highcharts-series-0 highcharts-line-series highcharts-color-0  highcharts-tracker" transform="translate(10,10) scale(1 1)"></g></g><text x="50" text-anchor="middle" class="highcharts-title" data-z-index="4" style="color:#333333;font-size:18px;fill:#333333;" y="24"></text><text x="50" text-anchor="middle" class="highcharts-subtitle" data-z-index="4" style="color:#666666;fill:#666666;" y="24"></text><g class="highcharts-axis-labels highcharts-xaxis-labels" data-z-index="7"></g><g class="highcharts-axis-labels highcharts-yaxis-labels" data-z-index="7"></g></svg>
                </div></div></div>
                <div title="Ürünün belirlenen kelimede kaçıncı sayfanın kaçıncı sırasında olduğunu belirtir." class="col-sm-2" style="text-align:center;margin: auto;"><span style="color:#FF9100">
                <c:choose>
                <c:when test="${ not empty kelime.aramalar[0].position}" ><span>
                <c:out value="${kelime.aramalar[0].page}" />.Sayfa </span>, <span>
                <c:out value="${kelime.aramalar[0].position - (kelime.aramalar[0].page -1)*28}" />.Sıra</span>
                </c:when>
                <c:otherwise>ilk 20 sayfada yok veya hiç yok
                </c:otherwise>
                </c:choose>
                </div>
                <div style="margin: auto; text-align: center;" class="col-sm-1"><a href="${path}/kelimeSil/${kelime.id }"><i style="margin: auto;margin-left:8px;cursor:pointer;font-size: 15px; color: grey;float: right;" onclick="DeleteKeyword(this,event)" data-parent-id="undefined" data-id="1451" class="fa fa-trash"></i></a><a href="${path}/grafic/${kelime.id }"><i style="margin: auto;margin-left: 8px;cursor:pointer;font-size: 18px; color: grey;float: right;" onclick="GetChartData(this,event)" data-parent-id="417" data-id="1451" class="fa fa-bar-chart"></i></a><a href="https://www.n11.com/arama?q=${kelime.kelimeAdi }" target="_blank"><i style="margin: auto;cursor:pointer;font-size: 16px; color: grey;float: right;" class="fa fa-external-link"></i></a></div></div></div>
           </c:forEach>  
           
            </div>
        </div>
</c:forEach>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="/Scripts/jquery.sparkline.min.js"></script>
<!-- script type="text/javascript">

function list(type, page) {
	modifyData2(type+"/"+page);
}
function modifyData2(suffix) {
	$.ajax({
		type : "GET",
		url :suffix,
		success : function(data) {
			$(".adres-jsp").html(data);
		}
	});
}
</script> -->
</body>
</html>