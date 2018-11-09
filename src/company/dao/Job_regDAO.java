package company.dao;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.util.DBConn;
import com.util.JdbcUtil;

import company.model.Job_reg;
import notice.model.NoticeDTO;

public class Job_regDAO {

	// 싱글톤
	private static Job_regDAO dao = null;

	private Job_regDAO() {}
	public static Job_regDAO getInstance() {
		if( dao == null ) {
			dao = new Job_regDAO();
		}
		return dao;
	}

	// 구인의뢰 insert
	public int insert(Job_reg jobreg, Connection conn) throws SQLException {

		int result = 0;

		PreparedStatement pstmt = null;
		try {
			String jrdeadline = jobreg.getJrdeadline();

			String sql = "insert into Job_reg "
					+" (jrId, jrapproval, cpnum, jrfields, jrrespon, jrworkplace, jrsal, jrrequiredskill, jreducation "
					+" , jrcareer, jrrecruit, jrdeadline, jrcondition, jrpreference, jremptype, jretc ) "
					+" values ('jrId'||lpad(seq_job_reg.nextval, 4, 0) , '미승인', ?, ?, ?, ?, ?, ?, ?, ?, ?, TO_DATE('"+ jrdeadline +"','YYYY/MM/DD'), ?, ?, ?, ?) " ;	

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, jobreg.getCpnum());
			pstmt.setString(2, jobreg.getJrfields());
			pstmt.setString(3, jobreg.getJrrespon());
			pstmt.setString(4, jobreg.getJrworkplace());
			pstmt.setInt(5, jobreg.getJrsal());
			pstmt.setString(6, jobreg.getJrrequiredskill());
			pstmt.setString(7, jobreg.getJreducation());
			pstmt.setString(8, jobreg.getJrcareer());
			pstmt.setInt(9, jobreg.getJrrecruit());
			pstmt.setString(10, jobreg.getJrcondition());
			pstmt.setString(11, jobreg.getJrpreference());
			pstmt.setString(12, jobreg.getJremptype());
			pstmt.setString(13, jobreg.getJretc());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			System.out.println("> Job_regDAO() insert : " + e.toString());
			e.printStackTrace();
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}
		return result;
	}


	// 구인의뢰목록보이기 select  - editJobList
	public List<Job_reg> selectList(Connection conn, int cpnum){

		String sql ="select jrId, jrfields, jrrespon , jrworkplace, jrapproval "
				+" from job_reg where cpnum = ? ";

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Job_reg> list = new ArrayList<>();
		try {

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, cpnum);

			rs = pstmt.executeQuery();

			Job_reg dto = null;


			while( rs.next()) {

				dto = new Job_reg();
				//dto.setCpnum(rs.getInt("cpnum"));
				dto.setJrid(rs.getString("jrid"));
				dto.setJrfields(rs.getString("jrfields"));
				dto.setJrrespon(rs.getString("jrrespon"));
				dto.setJrworkplace(rs.getString("jrworkplace"));
				dto.setJrapproval(rs.getString("jrapproval"));
				list.add(dto);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try { pstmt.close(); } catch (SQLException e) {	e.printStackTrace();}
			try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
			try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
		}
		return list;
	}

	// 수정할 구인의뢰 selectOne
	public Job_reg selectOne(Connection conn, String jrid) {
		
		String sql = " select jrfields, jrrespon, jrworkplace, jrsal, jrrequiredskill, jreducation, jrcareer "
				+" , jrrecruit, jrdeadline, jretc, jrpreference, jrapproval, jrcondition, jremptype, cpnum "
				+" from job_reg "
				+" where jrid = ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		Job_reg dto = null;


		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, jrid);
			rs = pstmt.executeQuery();
			dto = new Job_reg();
			dto.setJrid(jrid);

			if( rs.next()) {
				
				dto.setJrfields(rs.getString("jrfields"));
				dto.setJrrespon(rs.getString("jrrespon"));
				dto.setJrworkplace(rs.getString("jrworkplace"));
				dto.setJrsal(rs.getInt("jrsal"));
				dto.setJrrequiredskill(rs.getString("jrrequiredskill"));	
				dto.setJreducation(rs.getString("jreducation"));	
				dto.setJrcareer(rs.getString("jrcareer"));
				dto.setJrrecruit(rs.getInt("jrrecruit"));		
				
				// 2018-11-09 00:00:00
				// 2018/11/09
				String  jrdeadline =  rs.getString("jrdeadline").replace("-", "/").substring(0, 10);
				dto.setJrdeadline(jrdeadline);
				
				dto.setJretc(rs.getString("jretc"));
				dto.setJrpreference(rs.getString("jrpreference"));
				dto.setJrapproval(rs.getString("jrapproval"));
				dto.setJrcondition(rs.getString("jrcondition"));
				dto.setJremptype(rs.getString("jremptype"));
				dto.setCpnum(rs.getInt("cpnum"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try { pstmt.close(); } catch (SQLException e) {	e.printStackTrace();}
			try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
			// try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
		}
		return dto;
	}

	
	// 구인의뢰목록수정 update
	public int edit(Connection conn, Job_reg dto, int cpnum, String jrid) throws SQLException {
	 
		PreparedStatement pstmt = null;

		int result = 0;
		
		try {
			String jrdeadline = dto.getJrdeadline();
			String sql =" update Job_reg "
					   +" set jrfields=?, jrrespon=?, jrworkplace=?, jrsal=?, jrrequiredskill=? , jreducation=?, jrcareer=? "
					   +" , jrrecruit=?, jrdeadline = TO_DATE('"+ jrdeadline  +"','yyyy/MM/dd'), jretc=?, jrpreference=?, jrapproval=?, jrcondition=?, jremptype=? "
					   +" where cpnum=? and jrid=? "; 
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getJrfields());
			pstmt.setString(2, dto.getJrrespon());
			pstmt.setString(3, dto.getJrworkplace());
			pstmt.setInt(4, dto.getJrsal());
			pstmt.setString(5, dto.getJrrequiredskill());
			pstmt.setString(6, dto.getJreducation()); 
			pstmt.setString(7, dto.getJrcareer());
			pstmt.setInt(8, dto.getJrrecruit());
			pstmt.setString(9, dto.getJretc());
			pstmt.setString(10, dto.getJrpreference());
			pstmt.setString(11, dto.getJrapproval());
			pstmt.setString(12, dto.getJrcondition());
			pstmt.setString(13, dto.getJremptype());
			pstmt.setInt(14, dto.getCpnum());
			pstmt.setString(15, dto.getJrid());
			
			result = pstmt.executeUpdate();
			
		}catch(Exception e) {
			System.out.println("> ERR : " + e.toString());
		}
		finally{
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}
		return result;
	}

}
