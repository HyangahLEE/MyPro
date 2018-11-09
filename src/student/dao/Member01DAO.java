package student.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.util.JdbcUtil;

import student.model.Member02DTO;
import student.model.TpNameDTO;

public class Member01DAO {
    private static Member01DAO member01DAO = new Member01DAO();
    public static Member01DAO getInstance() {
        
        return member01DAO;
    }
    
    public Member01DAO () {}// 싱글톤
    
     public static Member02DTO getMember(Connection conn, String memberId) throws SQLException{
         PreparedStatement pstmt = null;
         ResultSet rs = null;
         Member02DTO memberInfo = new Member02DTO();
         try {
           pstmt = conn.prepareStatement(
                   "select MEMBERID " + 
                   "     , MNAME " + 
                   "     , MPWD  " + 
                   "     , MEMAIL  " + 
                   "     , MBIRTH  " + 
                   "     , MGENDER  " + 
                   "     , MZIPCODE  " + 
                   "     , MADDR1  " + 
                   "     , MEMBER_DIV  " + 
                   "     , MPHONE  " + 
                   "     , MTEL" + 
                   "  from member where memberid = ?");
           pstmt.setString(1, memberId);
           rs = pstmt.executeQuery();
           while(rs.next()) {
               memberInfo.setMemberid(rs.getString("MEMBERID"));
               memberInfo.setMname(rs.getString("MNAME"));
               memberInfo.setMpwd(rs.getString("MPWD"));
               memberInfo.setMemail(rs.getString("MEMAIL"));
               memberInfo.setMbirth(rs.getString("MBIRTH"));
               memberInfo.setMgender(rs.getString("MGENDER"));
               memberInfo.setMzipcode(rs.getInt("MZIPCODE"));
               memberInfo.setMaddr1(rs.getString("MADDR1"));
               memberInfo.setMember_div(rs.getString("MEMBER_DIV"));
               memberInfo.setMphone(rs.getString("MPHONE"));
               memberInfo.setMtel(rs.getString("MTEL"));

           }
           
           return memberInfo;
         }finally {
             JdbcUtil.close(rs);
             JdbcUtil.close(pstmt);
             
        }
     }
}
