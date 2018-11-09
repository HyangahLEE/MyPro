package lms.student.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import lms.student.dto.QuestionDTO;

public class QuestionDAO {

	private static QuestionDAO dao = null;
	
	private QuestionDAO() {}
	
	public static QuestionDAO getInstance() {
		if( dao == null ) {
			dao = new QuestionDAO();
		}
		return dao;
	}
	

	
	public int insert(Connection conn, QuestionDTO dto) {
		PreparedStatement pstmt = null;
		int result = 0;
		
	      if ( dto.getQid() != 0) {  //답글
	          // 1.
	          String sql = "update question "
	                +" set step=step+1 "
	                +" where ref=? and step > ?";
				
		   try {
			   
			   pstmt = conn.prepareStatement(sql);
	            pstmt.setInt(1, dto.getRef());
	            pstmt.setInt(2, dto.getStep());
	            
	            result = pstmt.executeUpdate();
		   
		   sql = "insert into question ( "+
					" qid, qtitle, content, logid, ref, step, depth "
							+ ")"
					+" values "
					+" ( seq_question.nextval, ?,?,?  "
                    +" ,?,?,? )";
		   
			pstmt = conn.prepareStatement(sql);	
			pstmt.setString(1, dto.getQtitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getLogid());
			 pstmt.setInt(4, dto.getRef());
			 pstmt.setInt(5, dto.getStep()+1);
 	         pstmt.setInt(6, dto.getDepth()+1);			
			result = pstmt.executeUpdate();
			
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				try { pstmt.close(); } catch (SQLException e) {	e.printStackTrace();}				
				try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
			}
			}else {
		         String sql = "insert into question ( "+
		        		 " qid, qtitle, content, logid, ref, step, depth "
		                       +"  )"
		                 +" values "
		                 +" ( seq_question.nextval, ?,?,? "
		                 +" ,seq_question.currval,?,? )";
		                 try {
		                	pstmt = conn.prepareStatement(sql);
		                	pstmt.setString(1, dto.getQtitle());
		        			pstmt.setString(2, dto.getContent());
		        			pstmt.setString(3, dto.getLogid());
		        			 pstmt.setInt(4, dto.getStep());
		         	         pstmt.setInt(5, dto.getDepth());			         	         
		         	        result = pstmt.executeUpdate();
		                    
		                 } catch (SQLException e) {
		                    e.printStackTrace();
		                 }finally {
		                    try { pstmt.close(); } catch (SQLException e) {   e.printStackTrace();}
		                    
		                    try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
		                 }
		        }
	
		
		return result;
	}
	

		public List<QuestionDTO> selectList(
				Connection conn
				, int start, int end
				, String searchCondition
				, String searchWord, String memberId ){
			
					
			String sql="select * from ";
			sql+="(";
			sql+=" select rownum rnum, qid, qtitle, content, logid, ref, step, depth ";
			sql+= ", case       when ( sysdate - qdate ) < 0.041667  then  'true'      else 'false'      end  new ";
			sql+=" from ( ";
			sql+="          select * from question ";
			sql +=" where " + searchCondition +" like '%" + searchWord+"%' and logId = ? ";
	        sql+=" order by ref desc, step asc  ";
			sql+="         ) ";
			sql+=")";
			sql+=" where rnum between ? and ?";	
						
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			ArrayList<QuestionDTO> list = new ArrayList<>();
			try {
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, memberId);
				pstmt.setInt(2, start);
				pstmt.setInt(3, end);
				
				rs = pstmt.executeQuery();
				
				QuestionDTO dto = null;
				while( rs.next()) {
					dto = new QuestionDTO();
					dto.setQid(rs.getInt("qid"));
				
					String qtitle = rs.getString("qtitle");
					
					if( searchCondition.equals("qtitle")) {
						qtitle = qtitle.replace(searchWord
							, String.format("<span style='color:red;background:yellow;'>%s</span>", searchWord) );
					}
					dto.setQtitle(qtitle);
					dto.setContent(rs.getString("content"));
					dto.setLogid(rs.getString("logid"));
					dto.setDepth(rs.getInt("depth"));
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
	
	
	public List<QuestionDTO> selectList(
			Connection conn
			, int start, int end , String memberId){
		
		String sql="select * from ";
		sql+="(";
		sql+=" select rownum rnum, qid, qtitle, qdate, content, logid, ref, step, depth ";
		sql+= ", case       when ( sysdate - qdate ) < 0.041667  then  'true'      else 'false'      end  new ";
		sql+=" from ( ";
		sql+="          select * from question ";
		sql+=" where logid= ?";
	    sql+=" order by ref desc, step asc  ";
		sql+="         ) ";
		sql+=")";
		sql+=" where rnum between ? and ?";	
		
		
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<QuestionDTO> list = new ArrayList<>();
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, memberId);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			
			rs = pstmt.executeQuery();
			
			QuestionDTO dto = null;
			while( rs.next()) {
				dto = new QuestionDTO();
				dto.setQid(rs.getInt("qid"));
				dto.setQtitle(rs.getString("qtitle"));
				dto.setQdate(rs.getDate("qdate"));
				dto.setContent(rs.getString("content"));
				dto.setLogid(rs.getString("logid"));
				dto.setDepth(rs.getInt("depth"));
				list.add(dto);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try { pstmt.close(); } catch (SQLException e) {	e.printStackTrace();}
			try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
			//try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
		}
		return list;
	}
	
	

	public int updateReadcount(Connection conn, int num) {
		String sql = "update question "
				+" set qreaded = qreaded +1 "
				+" where qid = ?";
		
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
		
	

	public QuestionDTO selectOne(Connection conn, int num) {
		String sql = "select * from question "
				+" where qid = ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		QuestionDTO dto = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if( rs.next()) {
				dto = new QuestionDTO();
				
				dto.setQid(rs.getInt("qid"));
				dto.setQtitle(rs.getString("qtitle"));
				dto.setQdate(rs.getDate("qdate"));
				dto.setContent(rs.getString("content"));
				dto.setLogid(rs.getString("logid"));
				dto.setRef(rs.getInt("ref"));
				dto.setDepth(rs.getInt("depth"));
			
			
				
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
	
	
	
	public int getTotalRecords(Connection conn
			,String searchCondition, String searchWord) {
		int cnt = 0;
		String sql = "select count(*) cnt from question";
		sql +=" where " + searchCondition +" like '%" + searchWord+"%'";
		
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
	
	
	
	public int getTotalRecords(Connection conn) {
		int cnt = 0;
		String sql = "select count(*) cnt from question";
		
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
			else paging +=String.format("<a href='question_list.do?page=%d&searchCondition=%s&searchWord=%s'>%d</a>", i,searchCondition,searchWord,i);
		}
		paging +="</div>";
		return paging; 
	}
	
	
	
	
	// 
	public int delete(Connection conn, int num) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
			
			String sql = " delete from question where qid = ? ";
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				result = pstmt.executeUpdate();
				
		} catch (Exception e) {
			System.out.println("> DAO.delete : " + e.toString());
		}finally {
			try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
			/*try {rs.close();} catch (SQLException e) {e.printStackTrace();}*/
			try {conn.close();} catch (SQLException e) {e.printStackTrace();}
		}
	
		return result;
}
	
	
	
	public int edit(Connection conn, QuestionDTO dto) {

		int result = 0 ;		 
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
				String	sql=" update question ";
					sql+=" set qtitle=?, content=? ";
					sql+=" where qid = ?";
			
			try {		
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, dto.getQtitle());
					pstmt.setString(2, dto.getContent());	
					pstmt.setInt(3, dto.getQid());
					result = pstmt.executeUpdate();  // result =1
				
		} catch (SQLException e) { 
			e.printStackTrace();
		}finally{
			try {
				/*rs.close();*/
				pstmt.close();
			} catch (SQLException e) { 
				e.printStackTrace();
			}
		}
		System.out.println(result);
		return result; 
	}
	
}
