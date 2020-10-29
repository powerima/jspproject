<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="testBean" class="ch10.TestBean" >
	<jsp:setProperty name="testBean" property="pname"/>
	<jsp:setProperty name="testBean" property="page"/>
</jsp:useBean>


<h2>자바빈을 사용하는 JSP 페이지</h2>
<p>
입력된 이름은 <jsp:getProperty name="testBean" property="pname"/> 입니다.
나이는 <jsp:getProperty name="testBean" property="page" />입니다.