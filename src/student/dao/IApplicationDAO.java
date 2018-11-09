package student.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.util.JdbcUtil;

import student.model.TpNameDTO;

public class IApplicationDAO {
    private static IApplicationDAO iApplicationDAO = new IApplicationDAO();
    public static IApplicationDAO getInstance() {
        
        return iApplicationDAO;
    }
    
    public IApplicationDAO () {}// 싱글톤
    
     public static int insert(Connection conn, Map paramMap) throws SQLException{
        PreparedStatement pstmt = null;
        PreparedStatement pstmt1 = null;
        ResultSet rs =null;
        try {
          pstmt1 = conn.prepareStatement("select nvl(max(iacId),0)+1 as seq from iApplication");
          rs = pstmt1.executeQuery();
          int seq = 0;
          while(rs.next()) {
              seq = rs.getInt("seq");
          };
          pstmt = conn.prepareStatement(
                  "insert into iApplication(   " + 
                  "iacId,   " + 
                  "tpId,   " + 
                  "memberId,   " + 
                  "company,   " + 
                  "department,   " + 
                  "tel,   " + 
                  "fax,   " + 
                  "naverid,   " + 
                  "division,   " + 
                  "mprocess,   " + 
                  "eprocess,   " + 
                  "payment   " + 
                  ") values(" + 
                  "?," + 
                  "?," + 
                  "?," + 
                  "?," + 
                  "?," + 
                  "?," + 
                  "?," + 
                  "?," + 
                  "?," + 
                  "?," + 
                  "?," + 
                  "?)");
          pstmt.setInt(1, seq);
          pstmt.setString(2, (String)paramMap.get("tpid"));
          pstmt.setString(3, (String)paramMap.get("memberId"));
          pstmt.setString(4, (String)paramMap.get("company"));
          pstmt.setString(5, (String)paramMap.get("department"));
          pstmt.setString(6, (String)paramMap.get("tel"));
          pstmt.setString(7, (String)paramMap.get("fax"));
          pstmt.setString(8, (String)paramMap.get("naverid"));
          pstmt.setString(9, (String)paramMap.get("division"));
          pstmt.setString(10, (String)paramMap.get("mprocess"));
          pstmt.setString(11, (String)paramMap.get("eprocess"));
          pstmt.setString(12, (String)paramMap.get("payment"));
          
          return pstmt.executeUpdate();
          
        }finally {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt1);
            JdbcUtil.close(pstmt);
        }
     }
 
}
