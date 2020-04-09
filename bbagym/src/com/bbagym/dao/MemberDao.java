package com.bbagym.dao;

import static com.bbagym.common.JDBCTemplate.close;


import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.bbagym.dao.MemberDao;
import com.bbagym.model.vo.Member;

	public class MemberDao {
		private Properties prop=new Properties();
	
	public MemberDao() {
		try {
			String path=MemberDao.class.getResource("/sql/member/member-query.properties").getPath();
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}

	public Member login(Connection conn, String id, String pw) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Member m=null;
		String sql=prop.getProperty("selectMember");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				m=new Member();
				m.setM_CODE(rs.getInt("M_CODE"));
				m.setM_ID(rs.getString("M_ID"));
				m.setM_NAME(rs.getString("M_NAME"));
				m.setM_EMAIL(rs.getString("M_EMAIL"));
				m.setM_PHONE(rs.getString("M_PHONE"));
				m.setM_ADDRESS(rs.getString("M_ADDRESS"));
				m.setM_LEVEL(rs.getInt("M_LEVEL"));
				m.setM_ENROLLDATE(rs.getDate("M_ENROLLDATE"));
				m.setM_STATUS(rs.getString("M_STATUS").charAt(0));
				m.setM_IMAGE(rs.getString("M_IMAGE"));
				m.setM_PHONE2(rs.getString("M_PHONE_2"));
				m.setM_ADDRESS_2(rs.getString("M_ADDRESS_2"));
				m.setM_GENDER(rs.getString("M_GENDER").charAt(0));
				m.setM_AGE(rs.getInt("M_AGE"));
				m.setBUSINESS_CODE(rs.getString("BUSINESS_CODE"));
			
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return m;
	}

	public boolean userIdDuplicate(Connection conn, String id) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		boolean flag=false;
		String sql=prop.getProperty("duplicate");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()) flag=true;
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return flag;
	}

	public int insertMember(Connection conn, Member m) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("insertMember");
		try {
			pstmt=conn.prepareStatement(sql);  
			pstmt.setString(1, m.getM_ID());
			pstmt.setString(2, m.getM_PW());
			pstmt.setString(3, m.getM_NAME());
			pstmt.setString(4, m.getM_EMAIL());
			pstmt.setString(5, m.getM_PHONE());
			pstmt.setString(6, m.getM_ADDRESS());
			pstmt.setString(7, m.getM_IMAGE());
			pstmt.setString(8,String.valueOf(m.getM_GENDER()));
			pstmt.setInt(9,m.getM_AGE());
			result=pstmt.executeUpdate();			
	

			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	//business 회원가입 등록
	public int insertBusiness(Connection conn, Member m) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("inserBusiness");
		
		try {
			pstmt=conn.prepareStatement(sql);  
			pstmt.setString(1, m.getM_ID());
			pstmt.setString(2, m.getM_PW());
			pstmt.setString(3, m.getM_NAME());
			pstmt.setString(4, m.getM_EMAIL());
			pstmt.setString(5, m.getM_PHONE());
			pstmt.setString(6, m.getM_ADDRESS());
			pstmt.setString(7, m.getM_IMAGE());
			pstmt.setString(8, m.getM_PHONE2());
			pstmt.setString(9, m.getM_ADDRESS_2());
			pstmt.setString(10,String.valueOf(m.getM_GENDER()));
			pstmt.setInt(11,m.getM_AGE());
			pstmt.setString(12, m.getBUSINESS_CODE());
			
			result=pstmt.executeUpdate();			
	

			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public Member selectMemberId(Connection conn, String userId) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Member m=null;
		String sql=prop.getProperty("duplicate");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				m=new Member();
				m.setM_CODE(rs.getInt("M_CODE"));	
				m.setM_ID(rs.getString("M_ID"));
				m.setM_NAME(rs.getString("M_NAME"));
				m.setM_EMAIL(rs.getString("M_EMAIL"));
				m.setM_PHONE(rs.getString("M_PHONE"));
				m.setM_ADDRESS(rs.getString("M_ADDRESS"));
				m.setM_LEVEL(rs.getInt("M_LEVEL"));
				m.setM_IMAGE(rs.getString("M_IMAGE"));
				m.setM_GENDER(rs.getString("M_GENDER").charAt(0));
				m.setM_AGE(rs.getInt("M_AGE"));
			
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return m;
	}
	//business 정보수정
	public Member selectBusinessId(Connection conn, String userId) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Member m=null;
		String sql=prop.getProperty("duplicate2");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				m=new Member();
				m.setM_CODE(rs.getInt("M_CODE"));	
				m.setM_ID(rs.getString("M_ID"));
				m.setM_NAME(rs.getString("M_NAME"));
				m.setM_EMAIL(rs.getString("M_EMAIL"));
				m.setM_PHONE(rs.getString("M_PHONE"));
				m.setM_ADDRESS(rs.getString("M_ADDRESS"));
				m.setM_LEVEL(rs.getInt("M_LEVEL"));
				m.setM_IMAGE(rs.getString("M_IMAGE"));
				m.setM_PHONE2(rs.getString("M_PHONE_2"));
				m.setM_ADDRESS_2(rs.getString("M_ADDRESS_2"));
				m.setM_GENDER(rs.getString("M_GENDER").charAt(0));
				m.setM_AGE(rs.getInt("M_AGE"));
				m.setBUSINESS_CODE(rs.getString("BUSINESS_CODE"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return m;
	}


	public int updateMember(Connection conn, Member m) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("updateMember");
		try {
			pstmt=conn.prepareStatement(sql); // SET M_NAME=?,M_GENDER=?,M_AGE=?,M_ADDRESS=?,M_PHONE=?,M_IMAGE=? WHERE M_CODE=?
			pstmt.setString(1,m.getM_NAME());
			pstmt.setString(2,String.valueOf(m.getM_GENDER()));
			pstmt.setInt(3,m.getM_AGE());
			pstmt.setString(4,m.getM_ADDRESS());		
			pstmt.setString(5,m.getM_PHONE());			
			pstmt.setString(6,m.getM_IMAGE());
			pstmt.setInt(7,m.getM_CODE());
			result=pstmt.executeUpdate();
	}catch(SQLException e) {
		e.printStackTrace();
	}finally {
		close(pstmt);
	}return result;
	}

	public int updateBusiness(Connection conn, Member m) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("updatebusiness");
		try {
			pstmt=conn.prepareStatement(sql); // SET M_NAME=?,M_GENDER=?,M_AGE=?,M_ADDRESS=?,M_PHONE=?,M_IMAGE=? WHERE M_CODE=?
			pstmt.setString(1,m.getM_NAME());
			pstmt.setString(2,String.valueOf(m.getM_GENDER()));
			pstmt.setInt(3,m.getM_AGE());
			pstmt.setString(4,m.getM_ADDRESS());		
			pstmt.setString(5,m.getM_PHONE());			
			pstmt.setString(6,m.getM_IMAGE());
			pstmt.setString(7,m.getM_PHONE2());
			pstmt.setString(8,m.getM_ADDRESS_2());
			pstmt.setInt(9,m.getM_CODE());
			result=pstmt.executeUpdate();
	}catch(SQLException e) {
		e.printStackTrace();
	}finally {
		close(pstmt);
	}return result;
	}


	public int updatePassword(Connection conn, String id, String pw) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("updatePassword");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, pw);
			pstmt.setString(2, id);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}//push

	

	}