package hire.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import hire.model.HireDTO;


public class HireDAO {

	private static HireDAO dao = null;

	private HireDAO() {}

	public static HireDAO getInstance() {
		if( dao == null ) {
			dao = new HireDAO();
		}
		return dao;
	}


	public int insert(Connection conn, HireDTO dto) {
		PreparedStatement pstmt = null;
		int result = 0;



		String sql = "insert into hire_info ( "+
				" hinum, hiworkplace, hiemail,  hicontent,  hnumber, companyname, homepage, htype, hpay, htel, hpossi, deadline "
				+ ")"
				+" values "
				+" ( seq_hire.nextval, ?,?,?,?,?,?,?,?,?,?,? "
				+" )";
		try {

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, dto.getHiworkplace());	
			pstmt.setString(2, dto.getHiemail());
			pstmt.setString(3, dto.getHicontent());

			pstmt.setInt(4, dto.getHnumber());
			pstmt.setString(5, dto.getCompanyname());
			pstmt.setString(6, dto.getHomepage());
			pstmt.setString(7, dto.getHtye());
			pstmt.setInt(8, dto.getHpay());
			pstmt.setString(9, dto.getHtel());
			pstmt.setString(10, dto.getHpossi());
			pstmt.setString(11, dto.getDeadline());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try { pstmt.close(); } catch (SQLException e) {	e.printStackTrace();}				
			try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
		}



		return result;
	}		







	public List<HireDTO> selectList(
			Connection conn
			, int start, int end
			, String searchCondition
			, String searchWord ){


		String sql="select * from ";
		sql+="(";
		sql+=" select rownum rnum,  hinum, hiworkplace, hiemail,  hicontent, hnumber, companyname, homepage, htype, hpay, htel, hpossi, deadline, hireaded ";
		sql+= ", case       when ( sysdate - hiwritedt ) < 0.041667  then  'true'      else 'false'      end  new ";
		sql+=" from ( ";
		sql+="          select * from hire_info ";
		sql +=" where " + searchCondition +" like '%" + searchWord+"%' ";
		/* sql+=" order by ref desc, step asc  ";*/
		 sql+=" order by hinum desc  ";
		sql+="         ) ";
		sql+=")";
		sql+=" where  rnum between ? and ?";						

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<HireDTO> list = new ArrayList<>();
		try {

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, start);
			pstmt.setInt(2, end);

			rs = pstmt.executeQuery();

			HireDTO dto = null;
			while( rs.next()) {
				dto = new HireDTO();					

				/*hinum, hiworkplace, hiemail,  hicontent, jrid, hnumber, companyname, homepage, htype, hpay, htel, hpossi, deadline */
				dto.setHinum(rs.getInt("hinum"));					
				String companyname = rs.getString("companyname");
				if( searchCondition.equals("companyname")) {
					companyname = companyname.replace(searchWord
							, String.format("<span style='color:red;background:yellow;'>%s</span>", searchWord) );
				}
				dto.setCompanyname(companyname);					
				dto.setHiworkplace(rs.getString("hiworkplace"));
				dto.setHiemail(rs.getString("hiemail"));
				dto.setHicontent(rs.getString("hicontent"));
				
				dto.setHnumber(rs.getInt("hnumber"));
				dto.setHomepage(rs.getString("homepage"));
				dto.setHtype(rs.getString("htype"));
				dto.setHpay(rs.getInt("hpay"));
				dto.setHtel(rs.getString("htel"));
				dto.setHpossi(rs.getString("hpossi"));
				dto.setDeadline(rs.getString("deadline"));
				dto.setHireaded(rs.getInt("hireaded"));

				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try { pstmt.close(); } catch (SQLException e) {	e.printStackTrace();}
			try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
			try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
		}
		return list;
	}




	public List<HireDTO> selectList(
			Connection conn
			, int start, int end){

		String sql="select * from ";
		sql+="(";
		sql+=" select rownum rnum, hinum, hiworkplace, hiemail,  hicontent,  hnumber, companyname, homepage, htype, hpay, htel, hpossi, deadline, hireaded ";
		sql+= ", case       when ( sysdate - hiwritedt ) < 0.041667  then  'true'      else 'false'      end  new ";
		sql+=" from ( ";
		sql+="          select * from hire_info ";
		/* sql+=" order by ref desc, step asc  ";*/
		 sql+=" order by hinum desc  ";
		sql+="         ) ";
		sql+=")";
		sql+=" where  rnum between ? and ? ";		

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<HireDTO> list = new ArrayList<>();
		try {			
			pstmt = conn.prepareStatement(sql);			
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);			
			rs = pstmt.executeQuery();

			HireDTO dto = null;
			while( rs.next()) {
				dto = new HireDTO();

				dto.setHinum(rs.getInt("hinum"));				
				dto.setCompanyname(rs.getString("companyname"));					
				dto.setHiworkplace(rs.getString("hiworkplace"));
				dto.setHiemail(rs.getString("hiemail"));
				dto.setHicontent(rs.getString("hicontent"));
		
				dto.setHnumber(rs.getInt("hnumber"));
				dto.setHomepage(rs.getString("homepage"));
				dto.setHtype(rs.getString("htype"));
				dto.setHpay(rs.getInt("hpay"));
				dto.setHtel(rs.getString("htel"));
				dto.setHpossi(rs.getString("hpossi"));
				dto.setDeadline(rs.getString("deadline"));
				dto.setHireaded(rs.getInt("hireaded"));

				list.add(dto);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try { pstmt.close(); } catch (SQLException e) {	e.printStackTrace();}
			try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }

		}
		return list;
	}


	//조회?�� 증�? ?��?���??.
	public int updateReadcount(Connection conn, int num) {
		String sql = "update hire_info "
				+" set hireaded = hireaded +1 "
				+" where hinum = ?";

		PreparedStatement pstmt = null;
		int result = 0;	

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			result = pstmt.executeUpdate();


		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try { pstmt.close(); } catch (SQLException e) {	e.printStackTrace();}
			//try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
		}
		return result;
	}



	// e
	public HireDTO selectOne(Connection conn, int num) {
		String sql = "select * from hire_info "
				+" where hinum = ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		HireDTO dto = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if( rs.next()) {
				dto = new HireDTO();

				dto.setHinum(rs.getInt("hinum"));				
				dto.setCompanyname(rs.getString("companyname"));					
				dto.setHiworkplace(rs.getString("hiworkplace"));
				dto.setHiemail(rs.getString("hiemail"));
				dto.setHicontent(rs.getString("hicontent"));
			
				dto.setHnumber(rs.getInt("hnumber"));
				dto.setHomepage(rs.getString("homepage"));
				dto.setHtype(rs.getString("htype"));
				dto.setHpay(rs.getInt("hpay"));
				dto.setHtel(rs.getString("htel"));
				dto.setHpossi(rs.getString("hpossi"));
				dto.setDeadline(rs.getString("deadline"));
				dto.setHiwritedt(rs.getDate("hiwritedt"));



			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try { pstmt.close(); } catch (SQLException e) {	e.printStackTrace();}
			try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
			//try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
		}
		return dto;
	}


	//e
	public int getTotalRecords(Connection conn
			,String searchCondition, String searchWord) {
		int cnt = 0;
		String sql = "select count(*) cnt from hire_info";
		sql +=" where " + searchCondition +" like '%" + searchWord +"%'  ";

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			cnt = rs.getInt("cnt");
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try { pstmt.close(); } catch (SQLException e) {	e.printStackTrace();}
			//try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }

		}
		return cnt;
	}


	//s
	public int getTotalRecords(Connection conn) {
		int cnt = 0;
		String sql = "select count(*) cnt from hire_info ";

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			cnt = rs.getInt("cnt");
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try { pstmt.close(); } catch (SQLException e) {	e.printStackTrace();}
			//try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }

		}
		return cnt;
	}




	//"1 2 3 4 5 6 7 8 9 10 >";
	public String pagingProc(int currentPage, int pageSize, int pageBlock	// 1 2 3... 10
			, int totalPages, String searchCondition, String searchWord ) { 

		int blockStart = ((currentPage-1)/pageBlock)*pageBlock+1;
		int blockEnd = blockStart + pageBlock -1;
		if( blockEnd > totalPages) blockEnd = totalPages;

		String paging = "<div style='width:100%;text-align:center'>";

		for( int i= blockStart; i<=blockEnd; i++) {
			if( i == currentPage ) paging += i;
			else paging +=String.format("<a href='hire_list.do?page=%d&searchCondition=%s&searchWord=%s'>%d</a>", i,searchCondition,searchWord,i);
		}
		paging +="</div>";
		return paging; 
	}





	// 
	public int delete(Connection conn, int num) {

		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;


		String sql = " delete from hire_info where hinum = ? ";		

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			result = pstmt.executeUpdate();


		} catch (Exception e) {
			System.out.println("> DAO.delete : " + e.toString());
		}finally {
			try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
			try {rs.close();} catch (SQLException e) {e.printStackTrace();}
			try {conn.close();} catch (SQLException e) {e.printStackTrace();}
		}

		return result;
	}
}








