<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <h1>Moyeo WordCloud</h1> -->
<script src="/moyeo/resources/customScript/five/tagCanvas.js"></script>
<script src="/moyeo/resources/customScript/five/tagCloud.js"></script>
<div>
	<div id="myCanvasContainer">
		<canvas width="750" height="350" id="myCanvas"> <!-- 	<p>Moyeo word cloud</p> -->
		</canvas>
	</div>
	<div id="tags">
		<ul>
			<c:forEach var="wordDto" items="${wordDtos}">
				<li><a href="#" target="_blank">${wordDto.word}</a></li>
			</c:forEach>
		</ul>
	</div>
</div>
