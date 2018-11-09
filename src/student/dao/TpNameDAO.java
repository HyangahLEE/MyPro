package student.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import student.model.TpNameDTO;

public class TpNameDAO {
    private static TpNameDAO tpnameDAO = new TpNameDAO();
    public static TpNameDAO getInstance() {
        
        return tpnameDAO;
    }
    
    public TpNameDAO () {}// 싱글톤
    
     public static int insert(Connection conn, TpNameDTO tpnameDTO) throws SQLException{
        PreparedStatement pstmt = null;
        try {
          pstmt = conn.prepareStatement(
                  "insert into "
                  + " tp_name "
                  + " (tpid, tpname, tptime, col, tpdaily, tplass, tptype, tpcost, mgid, adminstart, adminend, apid )"
                  + " values  (? ,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
          pstmt.setString(1, tpnameDTO.getTpid());
          pstmt.setString(2, tpnameDTO.getTpname());
          pstmt.setInt(3, tpnameDTO.getTptime());
          pstmt.setInt(4, tpnameDTO.getCol());
          pstmt.setString(5, tpnameDTO.getTpdaily());
          pstmt.setInt(6, tpnameDTO.getTpclass());
          pstmt.setString(7, tpnameDTO.getTptype());
          pstmt.setInt(8, tpnameDTO.getTpcost());
          pstmt.setString(9, tpnameDTO.getMgid());
          pstmt.setDate(10, (Date) tpnameDTO.getAdminstart());
          pstmt.setDate(11, (Date) tpnameDTO.getAdminend());
          pstmt.setString(12, tpnameDTO.getApid());
          
          return pstmt.executeUpdate();
          
        }finally {
            JdbcUtil.close(pstmt);
        }
     }
 
     public static List<TpNameDTO> select(Connection conn, String index) throws SQLException{
         PreparedStatement pstmt = null;
         ResultSet rs = null;
         TpNameDTO tpNameDto = null;
         ArrayList<TpNameDTO> list = new ArrayList<>();
         try {
           pstmt = conn.prepareStatement(
                   "  select tpid"
                   + "     , tpname"
                   + "     , campusname"
                   + "     , mcnt"
                   + "     , tpcost"
                   + "     ,adminstart"
                   + "     ,adminend"
                   + "     , tptime"
                   + "     , col"
                   + "  from tp_name "
                   + " where menutype =?");
           pstmt.setString(1, index);
           rs = pstmt.executeQuery();
           while(rs.next()) {
               tpNameDto = new TpNameDTO();
               tpNameDto.setTpid(rs.getString("tpid"));
               tpNameDto.setTpname(rs.getString("tpname"));
               tpNameDto.setCampusname(rs.getString("campusname"));
               tpNameDto.setMcnt(rs.getInt("mcnt"));
               tpNameDto.setTpcost(rs.getInt("tpcost"));
               tpNameDto.setAdminstart(rs.getDate("adminstart"));
               tpNameDto.setAdminend(rs.getDate("adminend"));
               tpNameDto.setTptime(rs.getInt("tptime"));
               tpNameDto.setCol(rs.getInt("col"));
               list.add(tpNameDto);
           }
           
           return list;
         }finally {
             JdbcUtil.close(rs);
             JdbcUtil.close(pstmt);
             
        }
     }
     
     
     public static String getName(Connection conn, String tpid) throws SQLException{
         PreparedStatement pstmt = null;
         ResultSet rs = null;
         String name = null;
         try {
           pstmt = conn.prepareStatement(
                   "  select tpname"
                   + "  from tp_name "
                   + " where tpid =?");
           pstmt.setString(1, tpid);
           rs = pstmt.executeQuery();
           while(rs.next()) {
               name = rs.getString("tpname");
               
           }
           
           return name;
         }finally {
             JdbcUtil.close(rs);
             JdbcUtil.close(pstmt);
             
        }
     }
     
     public static int getCost(Connection conn, String tpid) throws SQLException{
         PreparedStatement pstmt = null;
         ResultSet rs = null;
         int cost=0;
         System.out.println("=========="+tpid+"========");
         try {
           pstmt = conn.prepareStatement(
                   "  select tpcost"
                   + "  from tp_name "
                   + " where tpid =?");
           pstmt.setString(1, tpid);
           rs = pstmt.executeQuery();
           while(rs.next()) {
               cost = rs.getInt("tpcost");
               
           }
           
           return cost;
         }finally {
             JdbcUtil.close(rs);
             JdbcUtil.close(pstmt);
             
        }
     }
     
     //강남캠퍼스별 모집과정
     
     public List<TpNameDTO> getCourse() {

    	 TpNameDTO tndto = null;
    	 Connection conn = null;
     	 PreparedStatement pstmt = null;
     	 ResultSet rs  = null;
     	 ArrayList<TpNameDTO> list = null;
   	
    	 
    	 try {
    		 String sql = "SELECT tpname, campusname  FROM TP_NAME ";

    		 
    		conn= ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(sql);
			
/*			pstmt.setString(1, campusname);*/
			
			rs = pstmt.executeQuery();

			list = new ArrayList<>();
			
	    	while (rs.next()) {
	    		 
	    		 tndto = new TpNameDTO();
	    		 tndto.setTpname(rs.getString("tpname"));
	    		 tndto.setCampusname(rs.getString("campusname"));
				list.add(tndto);
			}
	    	 
		} catch (Exception e) {
			System.out.println(" getCourse() 에러 " +e.toString());
		} finally {
			try { rs.close(); } catch (SQLException e) {	e.printStackTrace();}
			try { pstmt.close(); } catch (SQLException e) {	e.printStackTrace();}
			try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
		} // finally

    	 return list;
    	 
     }
 
}
