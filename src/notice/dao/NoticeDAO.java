package notice.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.util.ConnectionProvider;

import notice.model.NoticeDTO;


public class NoticeDAO {

	private static NoticeDAO dao = null;
	
	private NoticeDAO() {}
	
	public static NoticeDAO getInstance() {
		if( dao == null ) {
			dao = new NoticeDAO();
		}
		return dao;
	}
	
	
	// ?��?��?�� 추�? 명령?��
	
	public int insert(Connection conn, NoticeDTO dto) {
		PreparedStatement pstmt = null;
		int result = 0;
		
	      if ( dto.getNnum() != 0) {  //?���?
	          // 1.
	          String sql = "update notice "
	                +" set step=step+1 "
	                +" where ref=? and step > ?";
				
		   try {
			   
			   pstmt = conn.prepareStatement(sql);
	            pstmt.setInt(1, dto.getRef());
	            pstmt.setInt(2, dto.getStep());
	            
	            result = pstmt.executeUpdate();
		   
		   sql = "insert into notice ( "+
					" nnum, ntitle,  nreaded, ncontent, mgid, pass, email, ref, step, depth "
							+ ")"
					+" values "
					+" ( seq_notice.nextval, ?,?,?,?,?,?,?,?,? "
					+" )";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getNtitle());			
			pstmt.setInt(2, dto.getNreaded());
			pstmt.setString(3, dto.getNcontent());
			pstmt.setString(4, dto.getMgid());
			pstmt.setString(5, dto.getPass());
			pstmt.setString(6, dto.getEmail());
	         pstmt.setInt(7, dto.getRef());
	         pstmt.setInt(8, dto.getStep()+1);
	         pstmt.setInt(9, dto.getDepth()+1);
			
			result = pstmt.executeUpdate();
			
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				try { pstmt.close(); } catch (SQLException e) {	e.printStackTrace();}				
				try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
			}
			}else { //?���?
		         String sql = "insert into notice ( "+
		        		 " nnum, ntitle,  nreaded, ncontent, mgid, pass, email, ref, step, depth "
		                       +"  )"
		                 +" values "
		                 +" ( seq_notice.nextval, ?,?,?,?,?,?"
		                 +" ,seq_notice.currval,?,? )";
		                 try {
		                	pstmt = conn.prepareStatement(sql);
		                	pstmt.setString(1, dto.getNtitle());			
		         			pstmt.setInt(2, dto.getNreaded());
		         			pstmt.setString(3, dto.getNcontent());
		         			pstmt.setString(4, dto.getMgid());
		         			pstmt.setString(5, dto.getPass());
		         			pstmt.setString(6, dto.getEmail());
		         	         pstmt.setInt(7, dto.getStep());
		         	         pstmt.setInt(8, dto.getDepth());
		         	         
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
	
	
	
	// ?���? 게시�? ?��?���? 처리 ?��?�� �??��?��?�� 메서?��
	/*public List<ReplyBoardDTO> selectList(
			Connection conn){
		String sql = "select * from notice "
				+" order by ref desc, step asc";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<ReplyBoardDTO> list = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			ReplyBoardDTO dto = null;
			while( rs.next()) {
				dto.setNnum(rs.getInt("nnum"));
				dto.setNtitle(rs.getString("ntitle"));
				dto.setNwritedt(rs.getDate("nwritedt"));
				dto.setNreaded(rs.getInt("nreaded"));
				dto.setNcontent(rs.getString("ncontent"));
				dto.setMgid(rs.getString("mgid"));
				dto.setRef(rs.getInt("ref"));
				dto.setStep(rs.getInt("step"));
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
	}*/
	
	// �???��조건 ?��?�� ?�� ?��?��?�� �???��?���??
		public List<NoticeDTO> selectList(
				Connection conn
				, int start, int end
				, String searchCondition
				, String searchWord ){
			
					
			String sql="select * from ";
			sql+="(";
			sql+=" select rownum rnum, nnum,ntitle,nwritedt,nreaded,ncontent, mgid, depth ";
			sql+= ", case       when ( sysdate - nwritedt ) < 0.041667  then  'true'      else 'false'      end  new ";
			sql+=" from ( ";
			sql+="          select * from notice ";
			sql +=" where " + searchCondition +" like '%" + searchWord+"%'";
	        sql+=" order by ref desc, step asc  ";
			sql+="         ) ";
			sql+=")";
			sql+=" where rnum between ? and ?";	
			
			//System.out.println(sql);
			
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			ArrayList<NoticeDTO> list = new ArrayList<>();
			try {
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
				
				rs = pstmt.executeQuery();
				
				NoticeDTO dto = null;
				while( rs.next()) {
					dto = new NoticeDTO();
					dto.setNnum(rs.getInt("nnum"));
					
					//?���?? �???�� 조건?�� ?��치할 ?��.
					String ntitle = rs.getString("ntitle");
					if( searchCondition.equals("ntitle")) {
						ntitle = ntitle.replace(searchWord
							, String.format("<span style='color:red;background:yellow;'>%s</span>", searchWord) );
					}
					dto.setNtitle(ntitle);
					
					dto.setNwritedt(rs.getDate("nwritedt"));
					dto.setNreaded(rs.getInt("nreaded"));
					dto.setNcontent(rs.getString("ncontent"));
					dto.setMgid(rs.getString("mgid"));	
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
	
	// ?��?���?? ?�� �?? ?��?�� ?�� ?��?��?�� �???��?���??
	public List<NoticeDTO> selectList(
			Connection conn
			, int start, int end){
		
		String sql="select * from ";
		sql+="(";
		sql+=" select rownum rnum, nnum,ntitle,nwritedt,nreaded,ncontent, mgid, depth ";
		sql+= ", case       when ( sysdate - nwritedt ) < 0.041667  then  'true'      else 'false'      end  new ";
		sql+=" from ( ";
		sql+="          select * from notice ";
	    sql+=" order by ref desc, step asc  ";
		sql+="         ) ";
		sql+=")";
		sql+=" where rnum between ? and ?";	
		
		
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<NoticeDTO> list = new ArrayList<>();
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery();
			
			NoticeDTO dto = null;
			while( rs.next()) {
				dto = new NoticeDTO();
				dto.setNnum(rs.getInt("nnum"));
				dto.setNtitle(rs.getString("ntitle"));
				dto.setNwritedt(rs.getDate("nwritedt"));
				dto.setNreaded(rs.getInt("nreaded"));
				dto.setNcontent(rs.getString("ncontent"));
				dto.setMgid(rs.getString("mgid"));	
				dto.setDepth(rs.getInt("depth"));
				list.add(dto);
			}
			System.out.println(dto.getNtitle());
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try { pstmt.close(); } catch (SQLException e) {	e.printStackTrace();}
			try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
			//try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
		}
		return list;
	}
	
	
	//조회?�� 증�? ?��?���??.
	public int updateReadcount(Connection conn, int num) {
		String sql = "update notice "
				+" set nreaded = nreaded +1 "
				+" where nnum = ?";
		
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
		
	
	
	// ?��?�� ?��?��?�� �?? 조회?���??.
	public NoticeDTO selectOne(Connection conn, int num) {
		String sql = "select * from notice "
				+" where nnum = ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		NoticeDTO dto = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if( rs.next()) {
				dto = new NoticeDTO();
				dto.setNnum(rs.getInt("nnum"));
				dto.setNtitle(rs.getString("ntitle"));
				dto.setNwritedt(rs.getDate("nwritedt"));
				dto.setNreaded(rs.getInt("nreaded"));
				dto.setNcontent(rs.getString("ncontent"));
				dto.setMgid(rs.getString("mgid"));		
				dto.setEmail(rs.getString("email"));				
				dto.setStep(rs.getInt("step"));
				dto.setDepth(rs.getInt("depth"));				
				dto.setRef(rs.getInt("ref"));
			
				
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
	
	
	//�?? 게사?�� ?�� �???��?���??(�???��조건 ?��?��?��)
	public int getTotalRecords(Connection conn
			,String searchCondition, String searchWord) {
		int cnt = 0;
		String sql = "select count(*) cnt from notice";
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
	
	
	//�?? 게사?�� ?�� �???��?���??(�???��조건 ?��?��?��)
	public int getTotalRecords(Connection conn) {
		int cnt = 0;
		String sql = "select count(*) cnt from notice";
		
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
			else paging +=String.format("<a href='notice_list.do?page=%d&searchCondition=%s&searchWord=%s'>%d</a>", i,searchCondition,searchWord,i);
		}
		paging +="</div>";
		return paging; 
	}
	
	
	
	
	// 
	public int delete(Connection conn, int num, String pass) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String original_pass = null;
		
		String sql = "select pass from notice "
					+" where nnum = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			rs.next();
			original_pass = rs.getString(1);
			
			if( original_pass.equals(pass)) {
				sql = " delete from notice where nnum = ? ";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				result = pstmt.executeUpdate();
			}else {
				return -1; //비�?번호 ?���?
			}
		} catch (Exception e) {
			System.out.println("> DAO.delete : " + e.toString());
		}finally {
			try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
			try {rs.close();} catch (SQLException e) {e.printStackTrace();}
			try {conn.close();} catch (SQLException e) {e.printStackTrace();}
		}
	
		return result;
}
	
	
	// ?��?��?�� ?��?��?���??.(?���??)
	public int edit(Connection conn, NoticeDTO dto) {

		int result = 0 ;		 
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String original_pass= null;
		String sql= "select pass from notice where nnum = ?";
		try {
			pstmt =  conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getNnum());
			rs = pstmt.executeQuery();
			if( rs.next() ){
				original_pass = rs.getString("pass");
				System.out.println(original_pass); 
				
				if( original_pass.equals(dto.getPass())){
					// ?��?�� 처리
					sql=" update notice ";
					sql+=" set email=?,ntitle=?,ncontent=? ";
					sql+=" where nnum = ?";
					
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, dto.getEmail());
					pstmt.setString(2, dto.getNtitle());
					pstmt.setString(3, dto.getNcontent());
					pstmt.setInt(4, dto.getNnum());
					
					result = pstmt.executeUpdate();  // result =1
				}else{
					result = -1; // 비�?번호 ??리다.
				}
			}else{
				// 게시�? ?��?��?�� 경우
				result = -2;
			}
		} catch (SQLException e) { 
			e.printStackTrace();
		}finally{
			try {
				rs.close();
				pstmt.close();
			} catch (SQLException e) { 
				e.printStackTrace();
			}
		}
		System.out.println(result);
		return result; 
	}
	
	//게시글 전체 가져오기
	public List<NoticeDTO> getAllNotice() {
		
		NoticeDTO ndto = null;
		Connection conn = null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		ArrayList<NoticeDTO> listN = null;
		
		try {
			String sql = " SELECT ntitle FROM NOTICE ";
			
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			listN = new ArrayList<>();
			
			while (rs.next()) {
				ndto = new NoticeDTO();
				ndto.setNtitle(rs.getString("ntitle"));
				listN.add(ndto);
				
			}
			
		} catch (Exception e) {
			System.out.println(" getAllNotice() 에러 " + e.toString());
		} finally {
			try { rs.close(); } catch (SQLException e) {	e.printStackTrace();}
			try { pstmt.close(); } catch (SQLException e) {	e.printStackTrace();}
			try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
		} // finally
		
		return listN;
	}
	
}
   
   