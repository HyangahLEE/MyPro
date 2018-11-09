package join.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import net.sf.json.JSONObject;
import sist.mainHandler.MemberDTO;

public class JoinDAO {
	
	private static JoinDAO JoinDao = new JoinDAO();
	public static JoinDAO getInstance() {
	      return JoinDao;
	   }
	   
	   public JoinDAO() {}//싱글톤
	   
	   //아이디 중복체크
	   public int FailIdCheck(String id) throws SQLException, NamingException
	    {	System.out.println("다오1");
	        Connection conn = null;
	        PreparedStatement pstm = null;
	        ResultSet rs = null;
	        int res= 0;
	        
	        try {
	            // 쿼리
	        	
	            String sql =  "SELECT count(*) cnt FROM MEMBER WHERE memberid=? ";
	                        
	            conn = ConnectionProvider.getConnection();
	            pstm = conn.prepareStatement(sql);
	            pstm.setString(1, id);
	           
	            rs = pstm.executeQuery();
	            
	            if(rs.next()) return 1;
	           
	            	//값0 해당 아이디 x 사용 o
	           
	        } finally {
	            try{
	                if ( pstm != null ){ pstm.close(); pstm=null; }
	                if ( rs != null ){ rs.close(); rs=null; }
	                if ( conn != null ){ conn.close(); conn=null;    }
	            }catch(Exception e){
	                throw new RuntimeException(e.getMessage());
	            }
	        }
			return 0;
	    } // end FailIdCheck()

	   //중복체크 02
	   public JSONObject duplicateIdCheck(String id) throws SQLException, NamingException
	    {
		   //System.out.println("> id : " + id);
		   String sql = " SELECT count(*) cnt FROM member WHERE memberid = ? ";
		   //count == 0 사용 가능, count == 1 사용 불가능
		   Connection conn = null;
		   PreparedStatement pstmt = null;
		   ResultSet rs = null;
		   JSONObject data = null;
		   
		   try{
		      conn = ConnectionProvider.getConnection();
		      pstmt = conn.prepareStatement(sql);
		      pstmt.setString(1, id);
		      rs = pstmt.executeQuery();
		      
		      if(rs.next()) {
		      int cnt = rs.getInt("cnt");
		  /*System.out.println("javaDAO : "+cnt);*/
		      data = new JSONObject();
		      data.put("cnt", cnt);
		        return data;
		      }else {
		        return data;}
		   }catch(Exception e){
		      e.printStackTrace();
		   }finally{
		      try{
		         pstmt.close();
		         rs.close();
		         conn.close();
		      }catch(Exception e){}
		   }
		   return data;
		
	    } 

	   
	   
	   
	   
	   
	    public int insertMember(MemberDTO member) throws SQLException
	    {
	        Connection conn = null;
	        PreparedStatement pstmt = null;
	       
	        int cnt = 0;
	        
	        try {
	            // 커넥션을 가져온다.
	            conn = ConnectionProvider.getConnection();
	            
	            // 자동 커밋을 false로 한다.
	            //conn.setAutoCommit(false);
	            
	            // 쿼리 생성한다.
	            // 가입일의 경우 자동으로 세팅되게 하기 위해 sysdate를 사용
	            String sql = "insert into member(memberid,mname,mpwd,memail,mbirth,mgender,mzipcode,maddr1,mphone,mtel) ";
	            sql+= " values (?,?,?,?,?,?,?,?,?,?) ";
	           
	         
	            pstmt = conn.prepareStatement(sql);
	           
	           
	            pstmt.setString(1, member.getMemberid());
	            pstmt.setString(2, member.getMname());
	            pstmt.setString(3, member.getMpwd());
	            pstmt.setString(4, member.getMemail());
	            pstmt.setString(5, member.getMbirth());
	            pstmt.setInt(6, member.getMgender());
	            pstmt.setInt(7, member.getMzipcode());
	            pstmt.setString(8, member.getMaddr1());
	            pstmt.setString(9, member.getMphone());
	            pstmt.setString(10, member.getMtel());
	            
	            cnt = pstmt.executeUpdate();
	            //conn.commit(); 
	            return cnt;
	            
	            // 완료시 커밋
	           
	            
	        } catch (NamingException | SQLException e) {
	            // 오류시 롤백
	            //conn.rollback(); 
	        	e.printStackTrace();
	        } finally {
	            // Connection, PreparedStatement를 닫는다.
	            try{
	                if ( pstmt != null ){ pstmt.close();  }
	                if ( conn != null ){ conn.close();   }
	            }catch(Exception e){
	                throw new RuntimeException(e.getMessage());
	            }
	          
	        }
			return cnt;
	    
			
	    } // end insertMember()


	
	
	
		  
	
}
