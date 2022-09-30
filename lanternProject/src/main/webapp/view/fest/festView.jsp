<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("/lanternProject/css/festView.css?1");</style>
<style type="text/css">@import url("/lanternProject/css/common.css?1");</style>
<c:set var="id" value='${sessionScope.id}'></c:set>
<script type="text/javascript" src="/lanternProject/js/jquery.js"></script>
<script type="text/javascript">
	$(function () {
			if (${check} === 1) {
				$('.bm_img2').hide();
				
			} else {
				$('.bm_img1').hide();
				
			};
			
			$('.bm_img2').on('click', function() {
				$('.bm_img1').show();
				$('.bm_img2').hide();
			});
			
			$('.bm_img1').on('click', function() {
				$('.bm_img2').show();
				$('.bm_img1').hide();
			});
			
		
	});
	
	function bookmark() {
		if (${empty id}) {
			var con = confirm("로그인이 필요합니다.");
			$('.bm_img2').show();
			$('.bm_img1').hide();
			if (con) {
				location.href="/lanternProject/view/member/loginForm.do";
			}
		} else {
			$.post("bookmarkCheck.so", "fno=${festival.fno}");
			
		}
		
	}
</script>
</head>
<body>
<div class="container">
	<div class="view_content">
		<div class="view_title">
			${festival.fname }
		</div>
		<p>
		<div class="view_intro">
			" ${festival.intro } "
		</div>
		<p>
		<div class="top_img">
			<img src="/lanternProject/images/festival/${festival.thumbnail }" style="width:100%; height:100%;">
		</div>
		<p>
		<div>
			<div class="bookmark1" onclick="bookmark()">
				<img class="bm_img2" src="/lanternProject/images/icons/bm2.png" style="width: 100px; height: 100px;"> 
				<img class="bm_img1" src="/lanternProject/images/icons/bm1.png" style="width: 100px; height: 100px;">
			</div>
		</div>
		<p>
		<div class="information">상세 정보</div>
		<p>
		<div class="top_content">
			<div>
				기간: ${festival.start_date }  ~  ${festival.end_date }
			</div><p>
			<div>운영시간: ${festival.hours }</div><p>
			<div>장소: ${festival.spot }</div><p>
			<div>입장료: ${festival.fee }원</div><p>
			<div>
				어린이: ${festival.fee_child }원 <br>
				중고등학생: ${festival.fee_teen }원 <br>
				성인: ${festival.fee_adult }원
			</div>	
		</div>
		<p>
		<div class="view_middle">
			<div>
				주최: ${festival.host }
			</div><p>
			<div class="tel">
				전화번호 : ${festival.tel }
			</div>
			<div>
				홈페이지 : ${festival.home_pg }	
			</div>
			<div class="addr">
				주소 : ${festival.addr } 
			</div>
			<div class="f_txt">
				${festival.f_txt }
			</div>
		</div>
		<div class="view_bottom">
			<div class="view_update" onclick="location.href='festUpdateForm.so?fno=${festival.fno}'">수정
			</div>
			<div class="view_delete" onclick="location.href='festDelete.so?fno=${festival.fno}'">삭제
			</div>
		</div>
	</div>
</div>


</body>
</html>