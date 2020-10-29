<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
<section>
	<div id="title">
		<h3>종아하는 기업 투표하기</h3>
	</div>
	<form method="post" action="vote_ok.jsp">	
		<table border="1" width="250" align="center">
			<tr><td><input type="radio" name="pool" value="n" checked="checked">
				네이버(금융+게임)</td></tr>
			<tr><td><input type="radio" name="pool" value="k">
				카카오(검색+쇼핑)</td></tr>
			<tr><td><input type="radio" name="pool" value="j">
				JYP(음악플랫폼)</td></tr>
			<tr align="center">
				<td><input type="submit" value="투표하기">
					<input type="button" value="결과보기" 
						onclick="location.href='vote_result.jsp'"></td>
			</tr>
		</table>
	</form>
</section>
<%@ include file="bottom.jsp" %>