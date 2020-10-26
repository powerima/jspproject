<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="top.jsp"%>
<%@ include file="dbconn.jsp"%>
<%
	int count = 0; // 학생수 
	
	String bg; 	// 색
	String sql;	// 쿼리문
	
	String ch1 = request.getParameter("ch1");
	String ch2 = request.getParameter("ch2");
	
	
	try {
		sql = "select sno, sname, kor, eng, math, hist," 
				+ " kor + eng + math + hist as sum, "
				+ " (kor + eng + math + hist)/4 as avg from examtbl";

        // 가급적 쿼리문에 변수를 넣지않는 것이 좋다. 무리가 많이 가기때문
		if(ch2 != null && !ch2.equals("")){	// 검색어가 있을때만	
			ch2 = "%" + ch2 + "%";
		
			if (ch1.equals("sno")){
				sql = sql + " where sno like ? ";
			}
			else{
				sql = sql + " where sname like ?";
			}			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, ch2);
		}		
		else{
			pstmt = con.prepareStatement(sql);
		}
		
		
		rs = pstmt.executeQuery();
%>

<section>
	<br>
	<div align="center">
		<h2>학생 성적 목록보기</h2>
	</div>
	<table align=center width=500 border=1>
		<tr align=center>
			<td>번호</td>
			<td>이름</td>
			<td>국어</td>
			<td>영어</td>
			<td>수학</td>
			<td>역사</td>
			<td>합계</td>
			<td>평균</td>
		</tr>
		<%
			while (rs.next()) {
				count++;
				if (count % 2 == 0) {
					bg = "#e7dddd";
				} else {
					bg = "#aedede";
				}
		%>
		<tr align=center bgcolor=<%=bg%>>
			<td><a href='content.jsp?sno=<%=rs.getString("sno")%>'> <%=rs.getString("sno")%>
			</a></td>
			<td><%=rs.getString("sname")%></td>
			<td><%=rs.getString("kor")%></td>
			<td><%=rs.getString("eng")%></td>
			<td><%=rs.getString("math")%></td>
			<td><%=rs.getString("hist")%></td>
			<td><%=rs.getString("sum")%></td>
			<td><a href='pwd.jsp?sno=<%=rs.getString("sno")%>'> <%=rs.getString("avg")%>
			</a></td>
		</tr>
		<%
			}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(rs != null) try{ rs.close(); } catch(Exception e){}
				if(pstmt != null) try{ pstmt.close(); } catch(Exception e){}
				if(con != null) try{ con.close(); } catch(Exception e){}
			}
		%>
		<tr align=center>
			<td colspan=8>학생수: <%=count%></td>			
		</tr>
	</table>
	
	<form name=f2 align=center action=list.jsp>
		<select name="ch1">
			<option value=sno>번호</option>
			<option value=sname>이름</option>
		</select> 
		<input type="text" name="ch2"> 
		<input type="submit" value="검색">
	</form>		
</section>
<%@ include file="bottom.jsp"%>