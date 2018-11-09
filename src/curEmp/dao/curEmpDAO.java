package curEmp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import curEmp.model.curEmpDTO;


public class curEmpDAO {

	private static curEmpDAO dao = null;

	private curEmpDAO() {}

	public static curEmpDAO getInstance() {
		if( dao == null ) {
			dao = new curEmpDAO();
		}
		return dao;
	}


	public int insert(Connection conn, curEmpDTO dto) {
		PreparedStatement pstmt = null;
		int result = 0;
		String getAdminstart = dto.getAdminstart();
		String getAdminend = dto.getAdminend();


//TO_DATE('10 SEPTEMBER 1992','DD MONTH YYYY')¡æ10-SEP-92 
//TO_DATE(' " + getAdminstart + " ','YYYY/MM/DD')
		String sql = "insert into curemp ( "+
				" ceid,  mname, cecname,  cecurrfield "
				+ ")"
				+" values "
				+" ( seq_curEmp.nextval, ?,?,?  "
				+" )";
		try {

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, dto.getMname());		
			pstmt.setString(2, dto.getCecname());
			pstmt.setString(3, dto.getCecurrfield());
		

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try { pstmt.close(); } catch (SQLException e) {	e.printStackTrace();}				
			try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
		}



		return result;
	}		




//s


	public List<curEmpDTO> selectList(
			Connection conn
			, int start, int end
			, String searchCondition
			, String searchWord ){


		String sql="select * from ";
		sql+="(";
		sql+=" select rownum rnum,  ceid,  adminstart, adminend,  mname, tpname,  cecname,  cecurrfield ";
		/*sql+= ", case       when ( sysdate - hiwritedt ) < 0.041667  then  'true'      else 'false'      end  new ";*/
		sql+=" from ( ";
		sql+="          select ceid,  adminstart, adminend, a.mname mname, tpname,  cecname,  cecurrfield from curemp a inner join member b on a.mname = b.mname "; 
        sql+="          inner join student c on b.memberid = c.memberid "; 
		sql+="                 inner join sbooking_m d on c.sid = d.sid "; 
		sql+="                 inner join tp_open e on d.tpoid = e.tpoid "; 
		sql+="                 inner join tp_name f on  e.tpid = f.tpid "; 
		
		/* sql+=" order by ref desc, step asc  ";*/
		 sql+=" order by ceid desc  ";
		sql+="         ) ";
		sql +=" where " + searchCondition +" like '%" + searchWord+"%' ";
		sql+=")";
		sql+=" where  rnum between ? and ?";						

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<curEmpDTO> list = new ArrayList<>();
		try {

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, start);
			pstmt.setInt(2, end);

			rs = pstmt.executeQuery();

			curEmpDTO dto = null;
			while( rs.next()) {
				dto = new curEmpDTO();					

				/*ceid,  adminstart, adminend,  mname, tpname,  cecname,  cecurrfield*/
				dto.setCeid(rs.getInt("ceid"));				
				String mname = rs.getString("mname");
				if( searchCondition.equals("mname")) {
					mname = mname.replace(searchWord, String.format("<span style='color:red;background:yellow;'>%s</span>", searchWord) );
				}
				dto.setMname(mname);
				dto.setCecname(rs.getString("cecname"));
				dto.setCecurrfield(rs.getString("cecurrfield"));
				dto.setAdminstart(rs.getString("adminstart"));
				dto.setAdminend(rs.getString("adminend"));	
				dto.setTpname(rs.getString("tpname"));

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




	public List<curEmpDTO> selectList(
			Connection conn
			, int start, int end){

		String sql="select * from ";
		sql+="(";
		sql+=" select rownum rnum,  ceid,  adminstart, adminend,  mname, tpname,  cecname,  cecurrfield ";
		/*sql+= ", case       when ( sysdate - hiwritedt ) < 0.041667  then  'true'      else 'false'      end  new ";*/
		sql+=" from ( ";
		sql+="           select ceid,  adminstart, adminend, a.mname, tpname,  cecname,  cecurrfield from curemp a inner join member b on a.mname = b.mname "; 
        sql+="          inner join student c on b.memberid = c.memberid	 "; 
		sql+="                 inner join sbooking_m d on c.sid = d.sid "; 
		sql+="                 inner join tp_open e on d.tpoid = e.tpoid "; 
		sql+="                inner join tp_name f on  e.tpid = f.tpid "; 
		/* sql+=" order by ref desc, step asc  ";*/
		 sql+=" order by ceid desc  ";
		sql+="         ) ";
		sql+=")";
		sql+=" where  rnum between ? and ?";	

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<curEmpDTO> list = new ArrayList<>();
		try {			
			pstmt = conn.prepareStatement(sql);			
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);			
			rs = pstmt.executeQuery();

			curEmpDTO dto = null;
			while( rs.next()) {
				dto = new curEmpDTO();

                dto.setCeid(rs.getInt("ceid"));
				dto.setMname(rs.getString("mname"));
				dto.setCecname(rs.getString("cecname"));
				dto.setCecurrfield(rs.getString("cecurrfield"));
				dto.setAdminstart(rs.getString("adminstart"));
				dto.setAdminend(rs.getString("adminend"));	
				dto.setTpname(rs.getString("tpname"));

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


	//Á¶È¸ +1
	/*public int updateReadcount(Connection conn, int num) {
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
	}*/



	// 
	public curEmpDTO selectOne(Connection conn, int num) {
		String sql = " select ceid,  adminstart, adminend, a.mname, tpname,  cecname,  cecurrfield " ;
				sql+="          from curemp a inner join member b on a.mname = b.mname "; 
		        sql+="          inner join student c on b.memberid = c.memberid "; 
				sql+="          inner join sbooking_m d on c.sid = d.sid "; 
				sql+="         inner join tp_open e on d.tpoid = e.tpoid "; 
				sql+="           inner join tp_name f on  e.tpid = f.tpid"; 
				sql+="          where ceid = ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		curEmpDTO dto = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if( rs.next()) {
				dto = new curEmpDTO();

				  dto.setCeid(rs.getInt("ceid"));
					dto.setMname(rs.getString("mname"));
					dto.setCecname(rs.getString("cecname"));
					dto.setCecurrfield(rs.getString("cecurrfield"));
					dto.setAdminstart(rs.getString("adminstart"));
					dto.setAdminend(rs.getString("adminend"));
					dto.setTpname(rs.getString("tpname"));



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


	//s
	public int getTotalRecords(Connection conn
			,String searchCondition, String searchWord) {
		int cnt = 0;
		String sql = "select count(*) cnt from curemp ";
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


	//
	public int getTotalRecords(Connection conn) {
		int cnt = 0;
		String sql = "select count(*) cnt from curemp ";

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
			else paging +=String.format("<a href='curEmp_list.do?page=%d&searchCondition=%s&searchWord=%s'>%d</a>", i,searchCondition,searchWord,i);
		}
		paging +="</div>";
		return paging; 
	}





	// 
	public int delete(Connection conn, int num) {

		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;


		String sql = " delete from curemp where ceid = ? ";		

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








