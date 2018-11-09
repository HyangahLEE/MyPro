package Attended.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.util.JdbcUtil;

import Attended.model.TpNameDTO;

public class JapplicationDAO02 {
   private static JapplicationDAO02 japplicationDAO02 = new JapplicationDAO02();
   public static JapplicationDAO02 getInstance() {
       return japplicationDAO02;
   }
   
   public JapplicationDAO02() {}// 싱글톤
   
   public static String getName(Connection conn, String tpid) throws SQLException{
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String name = null;
    try {
        pstmt = conn.prepareStatement(
                "  select A.tpname    " + 
                "  from tp_name A, japplication B   " + 
                "  where A.tpid = B.tpid   " + 
                "  and B.jacid=? ");
        System.out.println( tpid);
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
   
   
   public static List<Map<String, String>> getName01(Connection conn) throws SQLException{
       PreparedStatement pstmt = null;
       ResultSet rs = null;
       List<Map<String, String>> name = new ArrayList<>();
       try {
           pstmt = conn.prepareStatement(
                   "select tpname, tpid from tp_name");

                   rs = pstmt.executeQuery();
                   while(rs.next()) {
                       Map<String, String> resultMap = new HashMap<String, String>();
                       resultMap.put("tpid", rs.getString("tpid"));
                       resultMap.put("tpname", rs.getString("tpname"));
                       name.add(resultMap);
                   }
                   return name;
       }finally {
           JdbcUtil.close(rs);
           JdbcUtil.close(pstmt);
       }
          
      }
   
   
   
 
}
