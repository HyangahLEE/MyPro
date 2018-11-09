package lms.student.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;

import com.util.JdbcUtil;

import lms.student.dto.SattendmDTO;

public class SattendmDAO {
    private static SattendmDAO sattendmDAO = new SattendmDAO();
    public static SattendmDAO getInstance() {
        
        return sattendmDAO;
    }
    
    public SattendmDAO() {}//싱글톤
    
    public static List<SattendmDTO> select(Connection conn, String index) throws SQLException{
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        SattendmDTO sattendmDto = null;
        ArrayList<SattendmDTO> list = new ArrayList<>();
        try {
            pstmt = conn.prepareStatement(
                    " select samid"
                    + "     , sacurr"
                    + "     , sametime"
                    + "     , samltime"
                    + "     , tpid"
                    + "     , memberid"
                    + "     , jacid"
                    + "   from sattend_m"
                    + "   where tpid = ?");
            pstmt.setString(1, index);
            rs = pstmt.executeQuery();
            while(rs.next()) {
                sattendmDto= new SattendmDTO();
                sattendmDto.setSamid(rs.getString("samid"));
                sattendmDto.setSacurr(rs.getString("sacurr"));
                sattendmDto.setSametime(rs.getTimestamp("sametime"));
                sattendmDto.setSamltime(rs.getTimestamp("samltime"));
                sattendmDto.setTpid(rs.getString("tpid"));
                sattendmDto.setMemberid(rs.getString("memberid"));
                sattendmDto.setJacid(rs.getInt("jacid"));
                list.add(sattendmDto);
            }
            
            return list;
        } finally {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
        }
    }
    
    
    public static List<SattendmDTO> getMember(Connection conn, String memberId) throws SQLException{
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      List<SattendmDTO> list = new ArrayList<>();
      
      
      try {
        pstmt = conn.prepareStatement(
        "        SELECT A.memberid  AS memberid " +
        "        , A.TOTCNT AS totcnt " +
        "        , nvl(B.CNT,0)    AS cnt " +
        "        , A.TOTCNT - nvl(floor(b.cnt/3),0) + NVL(D.holiday,'0') as payday" +
        "        ,  nvl(c.notCnt - NVL(D.holiday,0),0) as notcnt " +
        "        ,  ((A.TOTCNT + nvl(D.holiday,'0') - nvl(floor(b.cnt/3),0) ) * 5800) + 300000  as pay"+ 
        "        , a.totcnt + nvl(c.notCnt,0) as total" +
        "        , (select mname from member where memberId = A.memberId) as name" +
        "        , NVL(D.holiday,'0') AS holiday" +
        "     FROM (SELECT COUNT(*) AS TOTCNT" +
        "                , memberid" +
        "                , tpid" +
        "             FROM SAttend_m" +
        "            WHERE TO_CHAR(samETime,'MM') = '09'" +
        "            GROUP BY memberid,tpid) A," +
        "            (SELECT memberid" +
        "               , COUNT(*) AS CNT" +
        "            FROM SAttend_m" +
        "           WHERE TO_CHAR(samETime,'hh24') > '08'" +
        "             AND TO_CHAR(samETime,'MM') = '09'" +
        "           GROUP BY memberid) B," +
        "             (SELECT memberid" +
        "               , COUNT(*) AS notCnt" +
        "            FROM SAttend_m" +
        "           WHERE TO_CHAR(samETime,'hh24') + TO_CHAR(samLTime,'hh24')  < '04'" +
        "           OR TO_CHAR(samLTime,'hh24') is null" +
        "           GROUP BY memberid) C ," +
        "            (SELECT memberid   " + 
        "                    ,COUNT(*) AS HOLIDAY  " + 
        "                    FROM SAttend_m  " + 
        "                    where holiday = '휴가'  " + 
        "                    GROUP BY memberid) D   " +
        "    WHERE A.memberid = B.memberid(+)" +
        "    and a.memberid = c.memberid(+) " +
        "    and a.memberid = D.memberid(+) " +
        "    and a.memberid=?");
        pstmt.setString(1, memberId);

        rs = pstmt.executeQuery();
        while(rs.next()) {
            SattendmDTO memberInfo = new SattendmDTO();
            memberInfo.setMemberid(rs.getString("memberid"));
            memberInfo.setTotal(rs.getInt("total"));
            memberInfo.setTotcnt(rs.getInt("totcnt"));
            memberInfo.setCnt(rs.getInt("cnt"));
            memberInfo.setNotcnt(rs.getInt("notcnt"));
            memberInfo.setPayday(rs.getInt("payday"));
            
            int payday = rs.getInt("payday");
            int alpha = (payday*5800<=116000) ? payday*5800 : 116000;
            int pay = alpha + 300000;
            
            
            memberInfo.setPay(pay);
            memberInfo.setMname(rs.getString("name"));
            memberInfo.setHoliday(rs.getString("holiday"));
            
            list.add(memberInfo);
        }
        
        return list;
      }finally {
          JdbcUtil.close(rs);
          JdbcUtil.close(pstmt);
          
     }
  }
    
    public static String getMonth(Connection conn, String memberId) throws SQLException{
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String month = null;
        try {
          pstmt = conn.prepareStatement(
                  "  select month"
                  + "  from sattend_m "
                  + " where memberid =?");
          pstmt.setString(1, memberId);
          rs = pstmt.executeQuery();
          while(rs.next()) {
              month = rs.getString("month");
              
          }
          
          return month;
        }finally {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
            
       }
    }
}