<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../etc/header.jsp"%>
 
<style>
.page-container .page-content .content-frame{
background:#D3FFFF;
}
.breadcrumb{
background:#C1F3FF;
}

.gallery .gallery-item {

float: left;
width: 24%;
margin: 1px 1px 1px 1px;
padding: 0px;
}
</style> 


                <!-- START BREADCRUMB -->
                <ul class="breadcrumb push-down-0">
                    <li><a href="../main/main.jsp">Home</a></li>
                    <li><a href="../movie/movie.jsp">동영상</a></li>
                </ul>
                <!-- END BREADCRUMB -->                                                
                
                <!-- START CONTENT FRAME -->
                <div class="content-frame">   
                    
                    <!-- START CONTENT FRAME TOP -->
                    <div class="content-frame-top">                        
                        <div class="page-title">                    
                            <h2><span class="fa fa-youtube-play"></span> 동영상</h2>
                        </div>                                      
                        <div class="pull-right">                            
                            <button class="btn btn-primary"><span class="fa fa-upload"></span> Upload</button>
                            <button class="btn btn-default content-frame-right-toggle"><span class="fa fa-bars"></span></button>
                        </div>                         
                    </div>

                
                    <!-- START CONTENT FRAME BODY -->
                    <div class="content-frame-body content-frame-body-left">
                        
                        <div class="gallery" id="links">
                             
                            <a class="gallery-item"> 
                                <div>                              
                                    <video src="../../../resources/resource/assets/video/12.mp4"  height="250px" width="100%" alt="Nature Image 1" controls ></video>                                        
                                </div>
                                <div class="meta">
                                    <strong>Nature image 1</strong>
                                    <span>Description</span>
                                </div>      
                            </a>    
                            
                            <a class="gallery-item"> 
                                <div>                              
                                    <video src="../../../resources/resource/assets/video/12.mp4" height="250px" width="100%" alt="Nature Image 1" controls ></video>                                        
                                </div>
                                <div class="meta">
                                    <strong>Nature image 1</strong>
                                    <span>Description</span>
                                </div>                              
                 			</a> 
                 			
                 			<div class="gallery-item"> 
                                <div>                              
                                    <video src="../../../resources/resource/assets/video/12.mp4" height="250px" width="100%" alt="Nature Image 1" controls ></video>                                        
                                </div>
                                <div class="meta">
                                    <strong>Nature image 1</strong>
                                    <span>Description</span>
                                </div>                              
                 			</div> 
                 			
                 			<div class="gallery-item"> 
                                <div>                              
                                    <video src="../../../resources/resource/assets/video/12.mp4" height="250px" width="100%" alt="Nature Image 1" controls ></video>                                        
                                </div>
                                <div class="meta">
                                    <strong>Nature image 1</strong>
                                    <span>Description</span>
                                </div>                              
                 			</div> 
                 			
                 			<div class="gallery-item"> 
                                <div>                              
                                    <video src="../../../resources/resource/assets/video/12.mp4" height="250px" width="100%" alt="Nature Image 1" controls ></video>                                        
                                </div>
                                <div class="meta">
                                    <strong>Nature image 1</strong>
                                    <span>Description</span>
                                </div>                              
                 			</div> 
                             
                        </div>
                             
                        <ul class="pagination pagination-sm pull-right push-down-20 push-up-20">
                            <li class="disabled"><a href="#">«</a></li>
                            <li class="active"><a href="#">1</a></li>
                            <li><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">4</a></li>                                    
                            <li><a href="#">»</a></li>
                        </ul>
                    </div>       
                    <!-- END CONTENT FRAME BODY -->
                </div>               
                <!-- END CONTENT FRAME -->
                                
                
            </div>            
            <!-- END PAGE CONTENT -->
        </div>
        <!-- END PAGE CONTAINER -->
        
        <!-- BLUEIMP GALLERY -->
        <div id="blueimp-gallery" class="blueimp-gallery blueimp-gallery-controls">
            <div class="slides"></div>
            <h3 class="title"></h3>
            <a class="prev">‹</a>
            <a class="next">›</a>
            <a class="close">×</a>
            <a class="play-pause"></a>
            <ol class="indicator"></ol>
        </div>      
        <!-- END BLUEIMP GALLERY -->
        
        <!-- MESSAGE BOX-->
        <div class="message-box animated fadeIn" data-sound="alert" id="mb-signout">
            <div class="mb-container">
                <div class="mb-middle">
                    <div class="mb-title"><span class="fa fa-sign-out"></span> Log <strong>Out</strong> ?</div>
                    <div class="mb-content">
                        <p>Are you sure you want to log out?</p>                    
                        <p>Press No if youwant to continue work. Press Yes to logout current user.</p>
                    </div>
                    <div class="mb-footer">
                        <div class="pull-right">
                            <a href="pages-login.html" class="btn btn-success btn-lg">Yes</a>
                            <button class="btn btn-default btn-lg mb-control-close">No</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- END MESSAGE BOX-->

    
 <%@ include file="../etc/footer.jsp"%>            