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

public class JApplicationDAO {
    private static JApplicationDAO jApplicationDAO = new JApplicationDAO();
    public static JApplicationDAO getInstance() {
        
        return jApplicationDAO;
    }
    
    public JApplicationDAO () {}// 싱글톤
    
     public static int insert(Connection conn, Map paramMap) throws SQLException{
        PreparedStatement pstmt = null;
        PreparedStatement pstmt1 = null;
        ResultSet rs =null;
        try {
          pstmt1 = conn.prepareStatement("select nvl(max(jacId),0)+1 as seq from jApplication");
          rs = pstmt1.executeQuery();
          int seq = 0;
          while(rs.next()) {
              seq = rs.getInt("seq");
          };
          pstmt = conn.prepareStatement(
                  "insert into jApplication(     " + 
                  "jacId,     " + 
                  "tpId,     " + 
                  "memberId,     " + 
                  "hschool,     " + 
                  "linea,     " + 
                  "college,     " + 
                  "cdepartment,     " + 
                  "university,     " + 
                  "udepartment,     " + 
                  "gschool,     " + 
                  "gdepartment,     " + 
                  "hgyear,     " + 
                  "hgmonth,     " + 
                  "hgclassification,     " + 
                  "hlocation,     " + 
                  "cgyear,     " + 
                  "cgmonth,     " + 
                  "cgclassification,     " + 
                  "clocation,     " + 
                  "ugyear,     " + 
                  "ugmonth,     " + 
                  "ugclassification,     " + 
                  "ulocation,     " + 
                  "ggyear,     " + 
                  "ggmonth,     " + 
                  "ggclassification,     " + 
                  "glocation,     " + 
                  "csexualA,     " + 
                  "csexualB,     " + 
                  "usexualA,     " + 
                  "usexualB,     " + 
                  "gsexualA,     " + 
                  "gsexualB,     " + 
                  "mprocess,     " + 
                  "eprocess,     " + 
                  "msd,     " + 
                  "stype,     " + 
                  "exemption,     " + 
                  "periodsy,     " + 
                  "periodsm,     " + 
                  "periodey,     " + 
                  "periodem,     " + 
                  "foreignlA,     " + 
                  "foreignlB,     " + 
                  "foreignlC,     " + 
                  "testA,     " + 
                  "testB,     " + 
                  "testC,     " + 
                  "scoreA,     " + 
                  "scoreB,     " + 
                  "scoreC,     " + 
                  "workesA,     " + 
                  "worketsyA,     " + 
                  "worketsmA,     " + 
                  "worketsdA,     " + 
                  "worketeyA,     " + 
                  "worketemA,     " + 
                  "worketedA,     " + 
                  "mworkeA,     " + 
                  "licenseA,     " + 
                  "acquisitionyA,     " + 
                  "acquisitionmA,     " + 
                  "acquisitiondA,     " + 
                  "issuanceA,     " + 
                  "computational,     " + 
                  "motive     " + 
                  ") values(     " + 
                  "?,     " + 
                  "?,     " + 
                  "?,     " + 
                  "?,     " + 
                  "?,     " + 
                  "?,     " + 
                  "?,     " + 
                  "?,     " + 
                  "?,     " + 
                  "?,     " + 
                  "?,     " + 
                  "?,     " + 
                  "?,     " + 
                  "?,     " + 
                  "?,     " + 
                  "?,     " + 
                  "?,     " + 
                  "?,     " + 
                  "?,     " + 
                  "?,     " + 
                  "?,     " + 
                  "?,     " + 
                  "?,     " + 
                  "?,     " + 
                  "?,     " + 
                  "?,     " + 
                  "?,     " + 
                  "?,     " + 
                  "?,     " + 
                  "?,     " + 
                  "?,     " + 
                  "?,     " + 
                  "?,     " + 
                  "?,     " + 
                  "?,     " + 
                  "?,     " + 
                  "?,     " + 
                  "?,     " + 
                  "?,     " + 
                  "?,     " + 
                  "?,     " + 
                  "?,     " + 
                  "?,     " + 
                  "?,     " + 
                  "?,     " + 
                  "?,     " + 
                  "?,     " + 
                  "?,     " + 
                  "?,     " + 
                  "?,     " + 
                  "?,     " + 
                  "?,     " + 
                  "?,     " + 
                  "?,     " + 
                  "?,     " + 
                  "?,     " + 
                  "?,     " + 
                  "?,     " + 
                  "?,     " + 
                  "?,     " + 
                  "?,     " + 
                  "?,     " + 
                  "?,     " + 
                  "?,     " + 
                  "?,     " + 
                  "?)" );
          pstmt.setInt(1, seq);
          pstmt.setString(2, (String)paramMap.get("tpid"));
          pstmt.setString(3, (String)paramMap.get("memberId"));
          pstmt.setString(4, (String)paramMap.get("hschool"));
          pstmt.setString(5, (String)paramMap.get("linea"));
          pstmt.setString(6, (String)paramMap.get("college"));
          pstmt.setString(7, (String)paramMap.get("cdepartment"));
          pstmt.setString(8, (String)paramMap.get("university"));
          pstmt.setString(9, (String)paramMap.get("udepartment"));
          pstmt.setString(10, (String)paramMap.get("gschool"));
          pstmt.setString(11, (String)paramMap.get("gdepartment"));
          pstmt.setInt(12, Integer.parseInt((String) paramMap.get("hgyear")));
          pstmt.setInt(13, Integer.parseInt((String) paramMap.get("hgmonth")));
          pstmt.setString(14, (String)paramMap.get("hgclassification"));
          pstmt.setString(15, (String)paramMap.get("hlocation"));
          pstmt.setInt(16, Integer.parseInt((String) paramMap.get("cgyear")));
          pstmt.setInt(17, Integer.parseInt((String) paramMap.get("cgmonth")));
          pstmt.setString(18, (String)paramMap.get("cgclassification"));
          pstmt.setString(19, (String)paramMap.get("clocation"));
          pstmt.setInt(20, Integer.parseInt((String) paramMap.get("ugyear")));
          pstmt.setInt(21, Integer.parseInt((String) paramMap.get("ugmonth")));
          pstmt.setString(22, (String)paramMap.get("ugclassification"));
          pstmt.setString(23, (String)paramMap.get("ulocation"));
          pstmt.setInt(24, Integer.parseInt((String) paramMap.get("ggyear")));
          pstmt.setInt(25, Integer.parseInt((String) paramMap.get("ggmonth")));
          pstmt.setString(26, (String)paramMap.get("ggclassification"));
          pstmt.setString(27, (String)paramMap.get("glocation"));
          pstmt.setString(28, (String)paramMap.get("csexualA"));
          pstmt.setString(29, (String)paramMap.get("csexualB"));
          pstmt.setString(30, (String)paramMap.get("usexualA"));
          pstmt.setString(31, (String)paramMap.get("usexualB"));
          pstmt.setString(32, (String)paramMap.get("gsexualA"));
          pstmt.setString(33, (String)paramMap.get("gsexualB"));
          pstmt.setString(34, (String)paramMap.get("mprocess"));
          pstmt.setString(35, (String)paramMap.get("eprocess"));
          pstmt.setString(36, (String)paramMap.get("msd"));
          pstmt.setString(37, (String)paramMap.get("stype"));
          pstmt.setString(38, (String)paramMap.get("exemption"));
          pstmt.setInt(39, Integer.parseInt((String) paramMap.get("periodsy")));
          pstmt.setInt(40, Integer.parseInt((String) paramMap.get("periodsm")));
          pstmt.setInt(41, Integer.parseInt((String) paramMap.get("periodey")));
          pstmt.setInt(42, Integer.parseInt((String) paramMap.get("periodem")));
          pstmt.setString(43, (String)paramMap.get("foreignlA"));
          pstmt.setString(44, (String)paramMap.get("foreignlB"));
          pstmt.setString(45, (String)paramMap.get("foreignlC"));
          pstmt.setString(46, (String)paramMap.get("testA"));
          pstmt.setString(47, (String)paramMap.get("testB"));
          pstmt.setString(48, (String)paramMap.get("testC"));
          pstmt.setString(49, (String) paramMap.get("scoreA"));
          pstmt.setString(50, (String) paramMap.get("scoreB"));
          pstmt.setString(51, (String) paramMap.get("scoreC"));
          pstmt.setString(52, (String)paramMap.get("workesA"));
          pstmt.setInt(53, Integer.parseInt((String) paramMap.get("worketsyA")));
          pstmt.setInt(54, Integer.parseInt((String) paramMap.get("worketsmA")));
          pstmt.setInt(55, Integer.parseInt((String) paramMap.get("worketsdA")));
          pstmt.setInt(56, Integer.parseInt((String) paramMap.get("worketeyA")));
          pstmt.setInt(57, Integer.parseInt((String) paramMap.get("worketemA")));
          pstmt.setInt(58, Integer.parseInt((String) paramMap.get("worketedA")));
          pstmt.setString(59, (String)paramMap.get("mworkeA"));
          pstmt.setString(60, (String)paramMap.get("licenseA"));
          pstmt.setInt(61, Integer.parseInt((String) paramMap.get("acquisitionyA")));
          pstmt.setInt(62, Integer.parseInt((String) paramMap.get("acquisitionmA")));
          pstmt.setInt(63, Integer.parseInt((String) paramMap.get("acquisitiondA")));
          pstmt.setString(64, (String)paramMap.get("issuanceA"));
          pstmt.setString(65, (String)paramMap.get("computational"));
          pstmt.setString(66, (String)paramMap.get("motive"));
          
          return pstmt.executeUpdate();
          
        }finally {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt1);
            JdbcUtil.close(pstmt);
        }
     }
 
}
