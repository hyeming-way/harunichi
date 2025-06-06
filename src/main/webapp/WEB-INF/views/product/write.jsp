<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<section class="product-form-container">
	<h2 class="form-title">상품 등록</h2>

	<form action="${pageContext.request.contextPath}/product/write.do"
		method="post" enctype="multipart/form-data" class="product-form">
		
		<div class="form-row">
			<label for="productTitle">상품명</label>
			<input type="text" id="productTitle" name="productTitle" required />
		</div>

		<div class="form-row">
			<label for="productPrice">가격</label> 
			<input type="number" id="productPrice" name="productPrice" required />
		</div>

		<div class="form-row">
			<label for="productStatus">거래방식</label>
			<select id="productStatus" name="productStatus">
				<option value="판매">판매</option>
				<option value="나눔">나눔</option>
			</select>
		</div>

		<div class="form-row">
			<label for="productCategory">카테고리</label>
			<select id="productCategory" name="productCategory">
				<option value="book">도서</option>
				<option value="electronics">전자제품</option>
				<option value="toy">장난감</option>
				<option value="fashion">패션</option>
				<option value="music">음반</option>
				<option value="etc">기타</option>
			</select>
		</div>

		<div class="form-row">
			<label for="productContent">설명</label>
			<textarea id="productContent" name="productContent" rows="5" required></textarea>
		</div>

		<div class="form-row">
		    <label for="uploadFile">이미지</label>
		    <input type="file" id="uploadFile" name="uploadFile" accept="image/*" onchange="previewImage(event)" />
		
		    <!-- 이미지 미리보기 -->
		    <div style="margin-top: 10px;">
		        <img id="preview" src="#" alt="미리보기" style="display:none; max-width: 200px; border: 1px solid #ccc; border-radius: 4px;" />
		    </div>
		</div>		

		<div class="form-buttons">
			<button type="submit">등록하기</button>
			<button type="reset">초기화</button>
			<a href="${pageContext.request.contextPath}/product/list.do"
				class="btn-back">목록으로</a>
		</div>
	</form>
</section>

<script>
	function previewImage(event) {
	    const input = event.target;
	    const preview = document.getElementById('preview');
	
	    if (input.files && input.files[0]) {
	        const reader = new FileReader();
	        reader.onload = function(e) {
	            preview.src = e.target.result;
	            preview.style.display = 'block';
	        }
	        reader.readAsDataURL(input.files[0]);
	    } else {
	        preview.src = '#';
	        preview.style.display = 'none';
	    }
	}
</script>
