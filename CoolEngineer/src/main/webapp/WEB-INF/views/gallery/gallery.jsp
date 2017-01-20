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
</style> 

<!-- START SCRIPTS -->
<!-- START PLUGINS -->

<script type="text/javascript" src="../../../resources/resource/js/plugins/jquery/jquery-ui.min.js"></script>
<script type="text/javascript"
	src="../../../resources/resource/js/plugins/bootstrap/bootstrap.min.js"></script>
<!-- END PLUGINS -->

<!-- START THIS PAGE PLUGINS-->
<script type='text/javascript' src='../../../resources/resource/js/plugins/icheck/icheck.min.js'></script>
<script type="text/javascript"
	src="../../../resources/resource/js/plugins/jquery-mousewheel-master/jquery.mousewheel.min.js"></script>
<script type="text/javascript"
	src="../../../resources/resource/js/plugins/mcustomscrollbar/jquery.mCustomScrollbar.min.js"></script>

<script type="text/javascript"
	src="../../../resources/resource/js/plugins/blueimp/jquery.blueimp-gallery.min.js"></script>
<script type="text/javascript" src="../../../resources/resource/js/plugins/dropzone/dropzone.min.js"></script>
<script type="text/javascript" src="../../../resources/resource/js/plugins/icheck/icheck.min.js"></script>
<!-- END THIS PAGE PLUGINS-->

<!-- START TEMPLATE -->
<script type="text/javascript" src="../../../resources/resource/js/settings.js"></script>

<script type="text/javascript" src="../../../resources/resource/js/plugins.js"></script>
<script type="text/javascript" src="../../../resources/resource/js/actions.js"></script>
<!-- END TEMPLATE -->

<script>            
            document.getElementById('links').onclick = function (event) {
                event = event || window.event;
                var target = event.target || event.srcElement;
                var link = target.src ? target.parentNode : target;
                var options = {index: link, event: event,onclosed: function(){
                        setTimeout(function(){
                            $("body").css("overflow","");
                        },200);                        
                    }};
                var links = this.getElementsByTagName('a');
                blueimp.Gallery(links, options);
            };
        </script>

<!-- END SCRIPTS -->







 
         <!-- START BREADCRUMB -->
                <ul class="breadcrumb push-down-0">
                    <li><a href="../main/main.jsp">Home</a></li>
                    <li class="active">사진</li>
                </ul>
               <!-- END BREADCRUMB -->                                             
                
                <!-- START CONTENT FRAME -->
                <div class="content-frame">   
                    
                    <!-- START CONTENT FRAME TOP -->
                    <div class="content-frame-top">                        
                        <div class="page-title">                    
                            <h2><span class="fa fa-image"></span> Gallery</h2>
                        </div>                                      
                        <div class="pull-right">                            
                            <button class="btn btn-primary"><span class="fa fa-upload"></span> Upload</button>
                            <button class="btn btn-default content-frame-right-toggle"><span class="fa fa-bars"></span></button>
                        </div>                         
                    </div>
                    
                    <!-- START CONTENT FRAME RIGHT -->
                    <div class="content-frame-right">                        
                        <div class="block push-up-10">
                            <form action="upload.php" class="dropzone dropzone-mini"></form>
                        </div>                        
                                        
                        <h4>Tags:</h4>
                        <ul class="list-tags">
                            <li><a href="#"><span class="fa fa-tag"></span> amet</a></li>
                            <li><a href="#"><span class="fa fa-tag"></span> rutrum</a></li>
                            <li><a href="#"><span class="fa fa-tag"></span> nunc</a></li>
                            <li><a href="#"><span class="fa fa-tag"></span> tempor</a></li>
                            <li><a href="#"><span class="fa fa-tag"></span> eros</a></li>
                            <li><a href="#"><span class="fa fa-tag"></span> suspendisse</a></li>
                            <li><a href="#"><span class="fa fa-tag"></span> dolor</a></li>
                        </ul>
                    </div>
                    <!-- END CONTENT FRAME RIGHT -->
                
                    <!-- START CONTENT FRAME BODY -->
                    <div class="content-frame-body content-frame-body-left">
                        
                        <div class="gallery" id="links">
                             
                            <a class="gallery-item" href="../../../resources/resource/assets/images/gallery/nature-1.jpg" title="Nature Image 1" data-gallery>
                                <div class="image">                              
                                    <img src="../../../resources/resource/assets/images/gallery/nature-1.jpg" alt="Nature Image 1" width="144px" height="105px"/>                                        
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

                            <a class="gallery-item" href="../../../resources/resource/assets/images/gallery/music-1.jpg" title="Music picture 1" data-gallery>
                                <div class="image">
                                    <img src="../../../resources/resource/assets/images/gallery/music-1.jpg" alt="Music picture 1" width="144px" height="105px"/>    
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

                            <a class="gallery-item" href="../../../resources/resource/assets/images/gallery/girls-1.jpg" title="Girls Image 1" data-gallery>
                                <div class="image">
                                    <img src="../../../resources/resource/assets/images/gallery/girls-1.jpg" alt="Girls Image 1" width="144px" height="105px"/>                                        
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

                            <a class="gallery-item" href="../../../resources/resource/assets/images/gallery/nature-2.jpg" title="Nature Image 2" data-gallery>
                                <div class="image">
                                    <img src="../../../resources/resource/assets/images/gallery/nature-2.jpg" alt="Nature Image 2" width="144px" height="105px"/>    
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

                            <a class="gallery-item" href="../../../resources/resource/assets/images/gallery/space-1.jpg" title="Space picture 1" data-gallery>
                                <div class="image">
                                    <img src="../../../resources/resource/assets/images/gallery/space-1.jpg" alt="Space picture 1" width="144px" height="105px"/>    
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
                                                 
                            <a class="gallery-item" href="../../../resources/resource/assets/images/gallery/music-2.jpg" title="Music picture 2" data-gallery>
                                <div class="image">
                                    <img src="../../../resources/resource/assets/images/gallery/music-2.jpg" alt="Music picture 2" width="144px" height="105px"/>    
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

                            <a class="gallery-item" href="../../../resources/resource/assets/images/gallery/nature-3.jpg" title="Nature Image 3" data-gallery>
                                <div class="image">
                                    <img src="../../../resources/resource/assets/images/gallery/nature-3.jpg" alt="Nature Image 3" width="144px" height="105px"/>    
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

                            <a class="gallery-item" href="../../../resources/resource/assets/images/gallery/girls-2.jpg" title="Girls Image 2" data-gallery>
                                <div class="image">
                                    <img src="../../../resources/resource/assets/images/gallery/girls-2.jpg" alt="Girls Image 2" width="144px" height="105px"/>    
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
                            
                            <a class="gallery-item" href="../../../resources/resource/assets/images/gallery/space-2.jpg" title="Space picture 2" data-gallery>
                                <div class="image">
                                    <img src="../../../resources/resource/assets/images/gallery/space-2.jpg" alt="Space picture 2" width="144px" height="105px"/>    
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

                            <a class="gallery-item" href="../../../resources/resource/assets/images/gallery/nature-4.jpg" title="Nature Image 4" data-gallery>
                                <div class="image">
                                    <img src="../../../resources/resource/assets/images/gallery/nature-4.jpg" alt="Nature Image 4" width="144px" height="105px"/>    
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
                            
                            <a class="gallery-item" href="../../../resources/resource/assets/images/gallery/music-3.jpg" title="Music picture 3" data-gallery>
                                <div class="image">
                                    <img src="../../../resources/resource/assets/images/gallery/music-3.jpg" alt="Music picture 3" width="144px" height="105px"/>    
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
                            
                            <a class="gallery-item" href="../../../resources/resource/assets/images/gallery/nature-5.jpg" title="Nature Image 5" data-gallery>
                                <div class="image">
                                    <img src="../../../resources/resource/assets/images/gallery/nature-5.jpg" alt="Nature Image 5" width="144px" height="105px"/>    
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
                            
                            <a class="gallery-item" href="../../../resources/resource/assets/images/gallery/nature-6.jpg" title="Nature Image 6" data-gallery>
                                <div class="image">
                                    <img src="../../../resources/resource/assets/images/gallery/nature-6.jpg" alt="Nature Image 6" width="144px" height="105px"/>    
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
                             
                            <a class="gallery-item" href="../../../resources/resource/assets/images/gallery/girls-3.jpg" title="Girls Image 3" data-gallery>
                                <div class="image">
                                    <img src="../../../resources/resource/assets/images/gallery/girls-3.jpg" alt="Girls Image 3" width="144px" height="105px"/>    
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
                             
                            <a class="gallery-item" href="../../../resources/resource/assets/images/gallery/nature-7.jpg" title="Nature Image 7" data-gallery>
                                <div class="image">
                                    <img src="../../../resources/resource/assets/images/gallery/nature-7.jpg" alt="Nature Image 7" width="144px" height="105px"/>
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
                            
                            <a class="gallery-item" href="../../../resources/resource/assets/images/gallery/music-5.jpg" title="Music picture 5" data-gallery>
                                <div class="image">
                                    <img src="../../../resources/resource/assets/images/gallery/music-5.jpg" alt="Music picture 5" width="120px" height="105px"/>    
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