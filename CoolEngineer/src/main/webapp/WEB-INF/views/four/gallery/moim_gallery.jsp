<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../../etc/moim_header.jsp"%>

<style>
@media only screen and (max-width: 1010px) {
	.x-dashboard .page-container .page-content .page-content-wrap .x-hnavigation .x-features
		{
		width: 100%;
		background-color: #FBFBFB;
		padding: 0px 20px;
	}
}

@media only screen and (max-width: 1010px) {
	.x-dashboard .page-container .page-content .page-content-wrap .x-hnavigation .x-features .x-features-nav-open
		{
		display: block;
	}
}

@media (min-width: 1100px){
.col-md-56 {
    width: 60%;
    height: 870px;
}
}
.chart-holder {
	height: 100%;
}

.main {
	height: 100%;
}

.panel .panel-body {
	height: 780px;
	overflow: scroll;
}

.col-md-25 {
	display: block;
}

li {
	float: left;
	margin: 1px 1px 1px;
	list-style: none;
	left: -3px;
}
</style>

<!-- START BREADCRUMB -->
   <ul class="breadcrumb push-down-0">
       <li><a href="../main/main.jsp">Home</a></li>
       <li><a href="../category/category_hobby.jsp">모임</a></li>
       <li><a href="../moim/moim_main.jsp">영등포 볼링</a></li>
       <li class="active">모임게시판</li>
   </ul>
<!-- END BREADCRUMB -->  

<!-- START ROW -->


<!-- 모임 사이드바 시작 -->
<div class="row">
	<div class="col-md-50" style="margin-top: 10px; margin-left: 10%;">
		<!-- START LOGIN BLOCK -->
	
		<!-- 모임페이지 사이드바 시작 -->
		<%@include file="../../etc/moim_side.jsp"%>
		<!-- 모임페이지 사이드바 종료 -->
		
		<!-- START PHOTO BLOCK -->
		<div class="col-md-56" style="margin-top: 10px;">
			<div class="panel panel-default">
				<div class="panel-heading">
					<div class="panel-title-box">
						<h3>가입인사 게시판</h3>
					</div>
				</div>
				 <div class="gallery" id="links">
                             
                            <a class="gallery-item" href="assets/images/gallery/nature-1.jpg" title="Nature Image 1" data-gallery>
                                <div class="image">                              
                                    <img src="assets/images/gallery/nature-1.jpg" alt="Nature Image 1"/>                                        
                                    <ul class="gallery-item-controls">
                                        <li><label class="check"><input type="checkbox" class="icheckbox"/></label></li>
                                        <li><span class="gallery-item-remove"><i class="fa fa-times"></i></span></li>
                                    </ul>                                                                    
                                </div>
                                <div class="meta">
                                    <strong>Nature image 1</strong>
                                    <span>Description</span>
                                </div>                                
                            </a>

                            <a class="gallery-item" href="assets/images/gallery/music-1.jpg" title="Music picture 1" data-gallery>
                                <div class="image">
                                    <img src="assets/images/gallery/music-1.jpg" alt="Music picture 1"/>    
                                    <ul class="gallery-item-controls">
                                        <li><label class="check"><input type="checkbox" class="icheckbox"/></label></li>
                                        <li><span class="gallery-item-remove"><i class="fa fa-times"></i></span></li>
                                    </ul>                                                                    
                                </div>
                                <div class="meta">
                                    <strong>Music picture 1</strong>
                                    <span>Other description</span>
                                </div>                                
                            </a>                            

                            <a class="gallery-item" href="assets/images/gallery/girls-1.jpg" title="Girls Image 1" data-gallery>
                                <div class="image">
                                    <img src="assets/images/gallery/girls-1.jpg" alt="Girls Image 1"/>                                        
                                    <ul class="gallery-item-controls">
                                        <li><label class="check"><input type="checkbox" class="icheckbox"/></label></li>
                                        <li><span class="gallery-item-remove"><i class="fa fa-times"></i></span></li>
                                    </ul>                                                                    
                                </div>
                                <div class="meta">
                                    <strong>Girls image 1</strong>
                                    <span>Description</span>
                                </div>                                
                            </a>

                            <a class="gallery-item" href="assets/images/gallery/nature-2.jpg" title="Nature Image 2" data-gallery>
                                <div class="image">
                                    <img src="assets/images/gallery/nature-2.jpg" alt="Nature Image 2"/>    
                                    <ul class="gallery-item-controls">
                                        <li><label class="check"><input type="checkbox" class="icheckbox"/></label></li>
                                        <li><span class="gallery-item-remove"><i class="fa fa-times"></i></span></li>
                                    </ul>                                                                    
                                </div>
                                <div class="meta">
                                    <strong>Nature image 2</strong>
                                    <span>Description</span>
                                </div>                                
                            </a>

                            <a class="gallery-item" href="assets/images/gallery/space-1.jpg" title="Space picture 1" data-gallery>
                                <div class="image">
                                    <img src="assets/images/gallery/space-1.jpg" alt="Space picture 1"/>    
                                    <ul class="gallery-item-controls">
                                        <li><label class="check"><input type="checkbox" class="icheckbox"/></label></li>
                                        <li><span class="gallery-item-remove"><i class="fa fa-times"></i></span></li>
                                    </ul>                                                                    
                                </div>
                                <div class="meta">
                                    <strong>Space picture 1</strong>
                                    <span>Other description</span>
                                </div>                                
                            </a>
                                                 
                            <a class="gallery-item" href="assets/images/gallery/music-2.jpg" title="Music picture 2" data-gallery>
                                <div class="image">
                                    <img src="assets/images/gallery/music-2.jpg" alt="Music picture 2"/>    
                                    <ul class="gallery-item-controls">
                                        <li><label class="check"><input type="checkbox" class="icheckbox"/></label></li>
                                        <li><span class="gallery-item-remove"><i class="fa fa-times"></i></span></li>
                                    </ul>                                                                    
                                </div>
                                <div class="meta">
                                    <strong>Music picture 2</strong>
                                    <span>Other description</span>
                                </div>                                
                            </a>                            

                            <a class="gallery-item" href="assets/images/gallery/nature-3.jpg" title="Nature Image 3" data-gallery>
                                <div class="image">
                                    <img src="assets/images/gallery/nature-3.jpg" alt="Nature Image 3"/>    
                                    <ul class="gallery-item-controls">
                                        <li><label class="check"><input type="checkbox" class="icheckbox"/></label></li>
                                        <li><span class="gallery-item-remove"><i class="fa fa-times"></i></span></li>
                                    </ul>                                                                    
                                </div>
                                <div class="meta">
                                    <strong>Nature image 3</strong>
                                    <span>Description</span>
                                </div>                                
                            </a>                                                     

                            <a class="gallery-item" href="assets/images/gallery/girls-2.jpg" title="Girls Image 2" data-gallery>
                                <div class="image">
                                    <img src="assets/images/gallery/girls-2.jpg" alt="Girls Image 2"/>    
                                    <ul class="gallery-item-controls">
                                        <li><label class="check"><input type="checkbox" class="icheckbox"/></label></li>
                                        <li><span class="gallery-item-remove"><i class="fa fa-times"></i></span></li>
                                    </ul>                                                                    
                                </div>
                                <div class="meta">
                                    <strong>Girls image 2</strong>
                                    <span>Description</span>
                                </div>                                
                            </a>                                                
                            
                            <a class="gallery-item" href="assets/images/gallery/space-2.jpg" title="Space picture 2" data-gallery>
                                <div class="image">
                                    <img src="assets/images/gallery/space-2.jpg" alt="Space picture 2"/>    
                                    <ul class="gallery-item-controls">
                                        <li><label class="check"><input type="checkbox" class="icheckbox"/></label></li>
                                        <li><span class="gallery-item-remove"><i class="fa fa-times"></i></span></li>
                                    </ul>                                                                    
                                </div>
                                <div class="meta">
                                    <strong>Space picture 2</strong>
                                    <span>Other description</span>
                                </div>                                
                            </a>                               

                            <a class="gallery-item" href="assets/images/gallery/nature-4.jpg" title="Nature Image 4" data-gallery>
                                <div class="image">
                                    <img src="assets/images/gallery/nature-4.jpg" alt="Nature Image 4"/>    
                                    <ul class="gallery-item-controls">
                                        <li><label class="check"><input type="checkbox" class="icheckbox"/></label></li>
                                        <li><span class="gallery-item-remove"><i class="fa fa-times"></i></span></li>
                                    </ul>                                                                    
                                </div>
                                <div class="meta">
                                    <strong>Nature image 4</strong>
                                    <span>Description</span>
                                </div>                                
                            </a>                                                                 
                            
                            <a class="gallery-item" href="assets/images/gallery/music-3.jpg" title="Music picture 3" data-gallery>
                                <div class="image">
                                    <img src="assets/images/gallery/music-3.jpg" alt="Music picture 3"/>    
                                    <ul class="gallery-item-controls">
                                        <li><label class="check"><input type="checkbox" class="icheckbox"/></label></li>
                                        <li><span class="gallery-item-remove"><i class="fa fa-times"></i></span></li>
                                    </ul>                                                                    
                                </div>
                                <div class="meta">
                                    <strong>Music picture 3</strong>
                                    <span>Other description</span>
                                </div>                                
                            </a>                            
                            
                            <a class="gallery-item" href="assets/images/gallery/nature-5.jpg" title="Nature Image 5" data-gallery>
                                <div class="image">
                                    <img src="assets/images/gallery/nature-5.jpg" alt="Nature Image 5"/>    
                                    <ul class="gallery-item-controls">
                                        <li><label class="check"><input type="checkbox" class="icheckbox"/></label></li>
                                        <li><span class="gallery-item-remove"><i class="fa fa-times"></i></span></li>
                                    </ul>                                                                    
                                </div>
                                <div class="meta">
                                    <strong>Nature image 5</strong>
                                    <span>Description</span>
                                </div>                                
                            </a>
                            
                            <a class="gallery-item" href="assets/images/gallery/nature-6.jpg" title="Nature Image 6" data-gallery>
                                <div class="image">
                                    <img src="assets/images/gallery/nature-6.jpg" alt="Nature Image 6"/>    
                                    <ul class="gallery-item-controls">
                                        <li><label class="check"><input type="checkbox" class="icheckbox"/></label></li>
                                        <li><span class="gallery-item-remove"><i class="fa fa-times"></i></span></li>
                                    </ul>                                                                    
                                </div>
                                <div class="meta">
                                    <strong>Nature image 6</strong>
                                    <span>Description</span>
                                </div>                                
                            </a>                                                    
                             
                            <a class="gallery-item" href="assets/images/gallery/girls-3.jpg" title="Girls Image 3" data-gallery>
                                <div class="image">
                                    <img src="assets/images/gallery/girls-3.jpg" alt="Girls Image 3"/>    
                                    <ul class="gallery-item-controls">
                                        <li><label class="check"><input type="checkbox" class="icheckbox"/></label></li>
                                        <li><span class="gallery-item-remove"><i class="fa fa-times"></i></span></li>
                                    </ul>                                                                    
                                </div>
                                <div class="meta">
                                    <strong>Girls image 3</strong>
                                    <span>Description</span>
                                </div>                                
                            </a>                                                      
                             
                            <a class="gallery-item" href="assets/images/gallery/nature-7.jpg" title="Nature Image 7" data-gallery>
                                <div class="image">
                                    <img src="assets/images/gallery/nature-7.jpg" alt="Nature Image 7"/>
                                    <ul class="gallery-item-controls">
                                        <li><label class="check"><input type="checkbox" class="icheckbox"/></label></li>
                                        <li><span class="gallery-item-remove"><i class="fa fa-times"></i></span></li>
                                    </ul>                                                                    
                                </div>
                                <div class="meta">
                                    <strong>Nature image 7</strong>
                                    <span>Description</span>
                                </div>                                
                            </a>                                                    
                            
                            <a class="gallery-item" href="assets/images/gallery/music-5.jpg" title="Music picture 5" data-gallery>
                                <div class="image">
                                    <img src="assets/images/gallery/music-5.jpg" alt="Music picture 5"/>    
                                    <ul class="gallery-item-controls">
                                        <li><label class="check"><input type="checkbox" class="icheckbox"/></label></li>
                                        <li><span class="gallery-item-remove"><i class="fa fa-times"></i></span></li>
                                    </ul>                                                                    
                                </div>
                                <div class="meta">
                                    <strong>Music picture 5</strong>
                                    <span>Other description</span>
                                </div>                                
                            </a>                            
                             
                        </div>
			<!-- END PHOTO BLOCK -->
		</div>
	</div>
<!-- END ROW -->
</div>

<%@ include file="../../etc/footer.jsp"%>