package reservation.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.naming.NamingException;

import com.util.ConnectionProvider;

import sist.mainHandler.MemberDTO;

public class ReservDAO {

	private static ReservDAO ReservDAO = new ReservDAO();
	public static ReservDAO getInstance() {
	      return ReservDAO;
	   }
	   
	   public ReservDAO() {}//싱글톤
	
	   
	   public int insert(MemberDTO member) throws SQLException
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
