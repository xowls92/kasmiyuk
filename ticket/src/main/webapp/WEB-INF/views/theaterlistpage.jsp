<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
</head>
<body>
<!-- Main content -->
	<section class="content">
		<div class="row">
			<!-- left column -->
			<div class="col-md-12">
				<!-- general form elements -->

				<div class="box">
					<div class="box-header with-border">
						<h3 class="box-title">연극</h3>
					</div>
					<div class="box-body">
						<button id="new Btn"
								class="btn btn-primary"
								onclick="javascript:location.href='theatercreate'">글쓰기</button>	
									</div>
								</div>	
					<div class="box">
						<div class="box-header with-border">
						<h3 class="box-title">연극 정보</h3>
						</div>
						<div class="box-body">
						<table class="table table-bordered">
							<tr>
								<th>글번호</th>
								<th>이미지</th>	
								<th>전시종류</th>
								<th>제목</th>
								<th>아이디</th>
								<th>등록일</th>
								
								
							</tr>


							<c:forEach items="${list}" var="TheaterVO">

								<tr>
									<td>${TheaterVO.ttr_no}</td>
									<td><img src="/displayFile?fileName=${TheaterVO.thumFiles}"></td>
									<td>${TheaterVO.ttr_cat}</td>
									<td><a href='theaterReadpage${page.makeQuery(page.cri.page) }&ttr_no=${TheaterVO.ttr_no}'>${TheaterVO.ttr_title}</a></td>
									<td>${TheaterVO.com_id}</td>
									<td><fmt:formatDate pattern="yyyy-MM-dd"
											value="${TheaterVO.ttr_date}" /></td>
									
								</tr>

							</c:forEach>

						</table>
						
						</div>
					<!-- /.box-body -->
					<div class="box-footer">Footer</div>
					<!-- /.box-footer-->
					<div class="text-center">
						<ul class="pagination">
							<c:if test="${page.prev}">
								<li><a href="${page.startPage - 1}">&laquo;</a></li>
							</c:if>
							
							<c:forEach begin="${page.startPage }" end="${page.endPage }" var="idx">
								<li <c:out value="${page.cri.page == idx?'class =active':''}"/>>
									<a href="${idx }">${idx }</a>
								</li>
							</c:forEach>
							
							<c:if test="${page.next && page.endPage > 0}">
								<li><a href="${page.endPage +1}">&raquo;</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			<!--/.col (left) -->
		</div>
		<!-- /.row -->
		</div>
	</section>
	<!-- /.content -->
	<form id="jobForm">
		<input type='hidden' name="page" value=${page.cri.page }>
		<input type='hidden' name="perPageNum" value=${page.cri.perPageNum }>
	</form>
<!-- /.content-wrapper -->

	<script>
		$(".pagination li a").on("click", function(event){
			event.preventDefault();
			
			var targetPage = $(this).attr("href");
			
			var jobForm =$("#jobForm");
			jobForm.find("[name='page']").val(targetPage);
			jobForm.attr("action","theaterlistpage").attr("method","get");
			jobForm.submit();
		});
	</script>
</body>
</html>