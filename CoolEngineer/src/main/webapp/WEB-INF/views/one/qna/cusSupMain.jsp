<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../../etc/header.jsp"%>

<style>

.btn-success:active, .btn-success:active:focus{
	background-color: #9bb2be;
	border-color: #9bb2be;
}

.btn-success {
    background-color: white;
    border-color: #c5c4c6;
	color: #82a3b9;
}

.btn-success:hover{
	background-color: #a0b5c1;
	border-color: #a8d5f8;
	color:white;
}

.col-md-3 {
	width: 45%;
	margin: auto;
}
.col-md-4 {
	width: 43%;
}

.col-md-5 {
	width: 90%;
	margin: auto;
}

.col-md-8 {
	width: 50%;
}

.col-md-12{
	
}

.input-group {
	width: 100%;
}
.profile {
	background: #e3dbd7;
}
</style>
<!-- START BREADCRUMB -->
<ul class="breadcrumb">
	<li><a href="../main/main.jsp">Home</a></li>
	<li class="active">고객지원</li>
</ul>
<!-- END BREADCRUMB -->

<!-- PAGE TITLE -->
<div class="page-title">
	<h2>
		<span class="fa fa-users"></span> 고객지원 <small>CUSTOMER CENTER</small>
	</h2>
</div>
<!-- END PAGE TITLE -->

<!-- PAGE CONTENT WRAPPER -->
<div class="page-content-wrap">

	<div class="row">
		<div class="col-md-12">

			<div class="panel panel-default">
				<div class="panel-body">
					<p>검색 후 문의가 해결되지 않으면 Q&A를 이용하세요.</p>
					<form class="form-horizontal">
						<div class="form-group">
							<div class="col-md-8" style="float:left">
								<div class="input-group">
									<div class="input-group-addon">
										<span class="fa fa-search"></span>
									</div>
									<input type="text" class="form-control"
										placeholder="문의 내용을 입력해주세요" />
									<div class="input-group-btn">
										<button class="btn btn-primary">Search</button>
									</div>
								</div>
							</div>
							<div class="col-md-4" style="float:left">
								<input type="button" class="btn btn-success btn-block" style="margin: 5px; float:left; width:20%;" value="건의사항" onclick="window.location='/moyeo/two/suggestionInputForm'">
								<input type="button" class="btn btn-success btn-warning" style="margin: 5px; float:left; width:20%;" value="건의사항확인" onclick="window.location='/moyeo/two/suggestionList'">
								
							</div>
						</div>
					</form>
				</div>
			</div>

		</div>
	</div>

	<div class="row">
		<div class="col-md-3">
			<!-- CONTACT ITEM -->
			<div class="panel panel-default">
				<div class="panel-body profile">
					<div class="profile-data">
						<div class="profile-data-name"><a href="/moyeo/three/faq/">FAQ</a></div>
					</div>
				</div>
				<div class="panel-body">
					<div class="contact-info">
						<p>
							FAQ게시글1
						</p>
						<p>
							FAQ게시글2
						</p>
						<p>
							FAQ게시글3
						</p>
						<p>
							FAQ게시글4
						</p>
						<p>
							FAQ게시글5
						</p>
					</div>
				</div>
			</div>
			<!-- END CONTACT ITEM -->
		</div>

		<div class="col-md-3">
			<!-- CONTACT ITEM -->
			<div class="panel panel-default">
				<div class="panel-body profile">
					<div class="profile-data">
						<div class="profile-data-name"><a href="/moyeo/six/notice/notice">공지사항</a></div>
						
					</div>
				</div>
				<div class="panel-body">
					<div class="contact-info">
						<p>
							공지사항1
						</p>
						<p>
							공지사항2
						</p>
						<p>
							공지사항3
						</p>
						<p>
							공지사항4
						</p>
						<p>
							공지사항5
						</p>
					</div>
				</div>
			</div>
			<!-- END CONTACT ITEM -->
		</div>

		<div class="col-md-3">
			<!-- CONTACT ITEM -->
			<div class="panel panel-default">
				<div class="panel-body profile">
					<div class="profile-data">
						<div class="profile-data-name"><a href="/moyeo/one/qna/">Q&A</a></div>
						
					</div>
				</div>
				<div class="panel-body">
					<div class="contact-info">
						<p>
							Q&A 1
						</p>
						<p>
							Q&A 2
						</p>
						<p>
							Q&A 3
						</p>
						<p>
							Q&A 4
						</p>
						<p>
							Q&A 5
						</p>
					</div>
				</div>
			</div>
			<!-- END CONTACT ITEM -->
		</div>
		
		<div class="col-md-3">
			<!-- CONTACT ITEM -->
			<div class="panel panel-default">
				<div class="panel-body profile">
					<div class="profile-data">
						<div class="profile-data-name"><a href="/moyeo/three/customer-support/notice.jsp">이벤트</a></div>
						
					</div>
				</div>
				<div class="panel-body">
					<div class="contact-info">
						<p>
							이벤트1
						</p>
						<p>
							이벤트2
						</p>
						<p>
							이벤트3
						</p>
						<p>
							이벤트4
						</p>
						<p>
							이벤트5
						</p>
					</div>
				</div>
			</div>
			<!-- END CONTACT ITEM -->
		</div>
	</div>

</div>
<!-- END PAGE CONTENT WRAPPER -->

<%@ include file="../../etc/footer.jsp"%>  
