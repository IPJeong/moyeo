<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<script src="/moyeo/resources/customScript/five/tagCanvas.js"></script>
<script src="/moyeo/resources/customScript/five/tagCloud.js"></script>
<script src="/moyeo/resources/customScript/five/wordCloudScript.js"></script>

<div>
	<div>
		<div style="float:left; width:500">
			<div>
				<canvas width="500" height="350" id="myCanvas"> <!-- 	<p>Moyeo word cloud</p> -->
				</canvas>
			</div>
			<div id="tags" style="float:left;">
				<ul>
					<c:forEach var="wordDto" items="${wordDtos}">
						<li><a href="#" target="_blank">${wordDto.word}</a></li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<form action="refreshWordcloud" name="wordSearchForm" method="post" onsubmit="return validChk();">
			<div style="width:290px; float:left; margin-top:20px;" class="form-horizontal">
				<div class="form-group">
	                <label class="col-md-3 control-label"><font size="4px;">기간</font></label><br>
	                <div class="col-md-5" style="width:100%; margin-top:10px;">
	                    <div class="input-group">
	                        <input type="text" class="form-control datepicker" name="strDate" id="strDate" style="height:42px;" >
	                        <span class="input-group-addon add-on"> - </span>
	                        <input type="text" class="form-control datepicker" name="endDate" id="endDate" onchange="dateCheck();" style="height:42px;" >
	                    </div>
	                </div>
	                <label class="col-md-3 control-label" style="margin-top:20px;"><font size="4px;">조건</font></label>
	                <div class="col-md-4" style="width:100%;">
	                    <label class="check"><input type="checkbox" class="icheckbox" name="wordOps" value="Noun" /><font size="3px;">명사</font></label>&nbsp;&nbsp;
	                    <label class="check"><input type="checkbox" class="icheckbox" name="wordOps" value="Verb" /><font size="3px;">동사</font></label>&nbsp;&nbsp;
	                    <label class="check"><input type="checkbox" class="icheckbox" name="wordOps" value="Hashtag" /><font size="3px;">Hash Tag</font></label>
	                    <button type="submit" class="btn btn-warning btn-rounded" style="margin-top:10px; margin-left: 80%;" onclick="doc();">검색</button>
	                </div>
	                <div class="col-md-4" style="width:100%; margin-top: 20px;">
	                	
	                </div>
	            </div>
			</div>
		</form>
	</div>
</div>
<script type="text/javascript" src="/moyeo/resources/resource/js/plugins/bootstrap/bootstrap-datepicker.js"></script>


