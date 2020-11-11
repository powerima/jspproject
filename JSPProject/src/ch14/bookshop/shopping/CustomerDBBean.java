package ch14.bookshop.shopping;

import java.sql.*;

public class CustomerDBBean {
	private static CustomerDBBean instance =
			new CustomerDBBean();
	
	public static CustomerDBBean getInstance() {
		return instance;
	}
	
	private CustomerDBBean() {}
	
	private Connection getConnection() throws Exception{
		Connection conn = null;
		
		Class.forName("oracle.jdbc.OracleDriver");
		conn = DriverManager.getConnection(
				"jdbc:oracle:thin:@//localhost:1521/xe",
				"system","1234");
		
		return conn;
	}
	
	// 회원 가입
	public void insertMember(CustomerDataBean member) 
			throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement(
					"insert into member_tbl_ch14 values(?,?,?,?,?,?)");
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPasswd());
			pstmt.setString(3, member.getName());
			pstmt.setTimestamp(4, member.getReg_date());
			pstmt.setString(5, member.getTel());
			pstmt.setString(6, member.getAddress());
			
			pstmt.executeUpdate();
					
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if(pstmt != null) try { pstmt.close(); } catch(Exception ex) {}
			if(conn != null) try { conn.close(); } catch(Exception ex) {}
		}
		
	}
	
	// 사용자 인증 처리
	public int userCheck(String id, String passwd) 
			throws Exception {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbpasswd = "";
		int x = -1;
		
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement(
					"select passwd from "
					+ "member_tbl_ch14 where id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dbpasswd = rs.getString("passwd");
				if(dbpasswd.equals("passwd")) {
					x = 1;	// 인증 성공
				} else {
					x = 0;	// 비밀번호 틀림
				}
			} else {
				x = -1;	// 해당 아이디 없음
			}
				
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if(rs != null) try { rs.close(); } catch(Exception ex) {}
			if(pstmt != null) try { pstmt.close(); } catch(Exception ex) {}
			if(conn != null) try { conn.close(); } catch(Exception ex) {}
		}
		return x;
	}
	
	// 중복 아이디 체크
	public int confirmId(String id) 
			throws Exception {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = -1;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"select id from "
					+ "member_tbl_ch14 where id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				x = 1;	// 해당 아이디 있음
			} else {
				x = -1;	// 해당 아이디 없음
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if(rs != null) try { rs.close(); } catch(Exception ex) {}
			if(pstmt != null) try { pstmt.close(); } catch(Exception ex) {}
			if(conn != null) try { conn.close(); } catch(Exception ex) {}
		}
		return x;
	}
	
	// 회원 정보를 수정하기 위해 기존의 정보를 표시
	public CustomerDataBean getMember(String id) 
			throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		CustomerDataBean member = null;
		
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement(
					"select * from "
					+ "member_tbl_ch14 where id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				member = new CustomerDataBean();
				
				member.setId(rs.getString("id"));
				member.setPasswd(rs.getString("passwd"));
				member.setName(rs.getString("name"));
				member.setReg_date(rs.getTimestamp("reg_date"));
				member.setTel(rs.getString("tel"));
				member.setAddress(rs.getString("address"));				
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if(rs != null) try { rs.close(); } catch(Exception ex) {}
			if(pstmt != null) try { pstmt.close(); } catch(Exception ex) {}
			if(conn != null) try { conn.close(); } catch(Exception ex) {}
		}
		return member;
	}
	
	// 회원의 정보 수정
	public void updateMember(CustomerDataBean member)
			throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement(
					"update member_tbl_ch14 set passwd = ?, "
					+ "name = ?, tel = ?, address = ?, where id = ?");
			pstmt.setString(1, member.getPasswd());
			pstmt.setString(2, member.getName());
			pstmt.setString(3, member.getTel());
			pstmt.setString(4, member.getAddress());
			pstmt.setString(5, member.getId());
			
			pstmt.executeUpdate();
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if(pstmt != null) try { pstmt.close(); } catch(Exception ex) {}
			if(conn != null) try { conn.close(); } catch(Exception ex) {}
		}
		
	}
	
	// 회원 탈퇴
	public int deleteMember(String id, String passwd)
			throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbpasswd = "";
		int x = -1;
		
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement(
					"select passwd from "
					+ "member_tbl_ch14 where id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dbpasswd = rs.getString("passwd");
				if(dbpasswd.equals("passwd")) {
					pstmt = conn.prepareStatement(
							"delete from member_tbl_ch14 "
							+ " where id = ?");
					pstmt.setString(1, id);
					pstmt.executeUpdate();
					x = 1;	// 회원탈퇴 성공
				} else {
					x = 0;	// 비밀번호 틀림
				}
			} 
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if(rs != null) try { rs.close(); } catch(Exception ex) {}
			if(pstmt != null) try { pstmt.close(); } catch(Exception ex) {}
			if(conn != null) try { conn.close(); } catch(Exception ex) {}
		}
		return x;
	}
}
