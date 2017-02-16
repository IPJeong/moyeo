<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<body>
	<%
		String manager_id = (String)request.getAttribute("manager_id");
		int cnt = (Integer)request.getAttribute("cnt");
		
		if(cnt == 1) {
	%>
		<form action="confirmId" method="post" name="confirmform">
		
			<table>
					<tr>
						<th colspan="2">
							<span><%=manager_id %></span>는 사용할 수 없습니다.
						</th>
					</tr>
					<tr>
						<th>아이디 : </th>
						<td>
							<input class="input" type="text" type="text" name="manager_id" maxlength="20"
							   	   style="width:100px">
						</td>
					</tr>
					<tr>
						<th colspan="2">
						<input class="inputButton" type="submit" value="확인">
						<input class="inputButton" type="reset" value="취소" onclick="self.close();">
						</th>
					</tr>
				</table>
		</form>
	<%
		} else {
	%>
		<table>
			<tr>
				<td align="center">
					<span><%=manager_id %></span>는 사용할 수 있습니다.
				</td>
			</tr>
			<tr>
				<th>
					<input class="inputButton" type="button" value="확인" onclick="setId('<%=manager_id%>');">
				</th>
			</tr>
		</table>
		
	<% 		
		}
	%>
	
	<script type="text/javascript">
		function setId(manager_id) {
		opener.document.inputform.manager_id.value = manager_id;
		self.close();
		}
	</script>
		
</body>