<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../etc/header.jsp"%>

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
	width: 200px;
}

.col-md-5 {
	width: 90%;
	margin: auto;
}

.col-md-12{
	width: 70%;
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
							<div class="col-md-8">
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
							<div class="col-md-4">
								<button class="btn btn-success btn-block">
									<span class=""></span> Q&A
								</button>
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
						<div class="profile-data-name"><a href="faq.jsp">FAQ</a></div>
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
						<div class="profile-data-name"><a href="../customer-support/notice.jsp">공지사항</a></div>
						
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

		<div class="col-md-5">
			<!-- CONTACT ITEM -->
			<div class="panel panel-default">
				<div class="panel-body profile">
					<div class="profile-data">
						<div class="profile-data-name"><a href="../event/ing-event.jsp">이벤트 안내</a></div>
						
					</div>
				</div>
				<div class="panel-body">
					<div class="contact-info">
						<p>
							이벤트
						</p>
						<p>
							좌우 슬라이드 
						</p>
						<p>
							형식으로 띄울것
						</p>
					</div>
				</div>
			</div>
			<!-- END CONTACT ITEM -->
		</div>
	</div>

</div>
<!-- END PAGE CONTENT WRAPPER -->

<%@ include file="../etc/footer.jsp"%>
