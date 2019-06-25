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
<title>Insert title here</title>
</head>
<body>
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

						<form:form method="post" class="form-horizontal" action="${path}/kelimeAdd"
							modelAttribute="kelime" >
							<form:hidden path="id" />
							<form:hidden path="urunId" value = "${ab }" />
							<div class="panel-body">
								<div class="form-group">
									<label class="col-md-6 control-label">arama kelimesini giriniz:</label>
									<div class="col-md-6">
										<form:input class="form-control" path="kelimeAdi" 
											placeholder="arama kelimesini giriniz" />
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
	
	
	
	
	
</body>
</html>