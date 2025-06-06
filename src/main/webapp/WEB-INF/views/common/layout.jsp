<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("utf-8");
%>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" /><!-- 셀렉트 라이브러리 -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" /><!-- 구글아이콘 연결 -->
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'><!-- 폰트 -->
<link href="${contextPath}/resources/css/main.css" rel="stylesheet" type="text/css" media="screen">
<title><tiles:insertAttribute name="title" /></title>

</head>
<body>
	<div id="wrap">
		<header>
			<tiles:insertAttribute name="header" />
		</header>
		<div id="inner-wrap">
			<aside>
				<tiles:insertAttribute name="side" />
			</aside>
			<article>
				<tiles:insertAttribute name="body" />
			</article>
		</div>
		<footer>
			<tiles:insertAttribute name="footer" />
		</footer>
	</div>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script><!-- 제이쿼리 -->
	<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script><!-- 셀렉트 라이브러리 -->
	<script>
		//국가선택 로직
		$(document).ready(function() {
			$('#country-select').select2({
				minimumResultsForSearch: -1,
				templateResult: formatState,
				templateSelection: formatState 
			});

			
			function formatState (state) {
				if (!state.id) {
					return state.text;
				}
				var $state = $(
					'<span><img src="' + state.element.dataset.image + '" class="country-icon" style="width: 18px; height: auto; margin-right: 5px; vertical-align: middle;" /> ' + state.text + '</span>'
				);
				return $state;
			}
		
			
			//선택된 국가를 세션에 저장
			$('#country-select').on('change', function() {
				var selectedCountry = $(this).val(); // 선택된 국가 코드 (예: "KR", "JP")

				console.log("선택된 국가:", selectedCountry); // 콘솔에서 확인

				// 서버로 선택된 국가 정보 보내기 (AJAX 사용)
				$.ajax({
					url: '${contextPath}/main/selectCountry', // 서버에서 국가 정보를 처리할 주소
					type: 'POST', // 또는 GET 방식
					data: { nationality: selectedCountry }, // 서버로 보낼 데이터 (키:값 형태)
					success: function(response) {
						console.log("국가 정보 세션 저장 성공!");
						// 필요하다면 세션 저장 성공 후 추가 작업 수행 (예: 페이지 새로고침, 메시지 표시 등)
						// window.location.reload(); // 예: 페이지 새로고침
					},
					error: function(xhr, status, error) {
						console.error("국가 정보 세션 저장 실패:", status, error);
						// 에러 발생 시 처리
					}
				});
			});
			
		});
	</script>
</body>
