package lms.student.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import lms.student.dto.RgraphDTO;

public class RgraphDAO {

	private static RgraphDAO rgraphDAO = new RgraphDAO();
	public static RgraphDAO getInstance() {
	
		return rgraphDAO;	
	}
	public RgraphDAO() {}//싱글톤
	
	public static List<RgraphDTO> select(Connection conn, String memberId) throws SQLException{
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        RgraphDTO rgraphDTO = null;
        ArrayList<RgraphDTO> list = new ArrayList<>();
        try {
/*          pstmt = conn.prepareStatement(
                  "  select graphid"
                  + "     , pescore"
                  + "     , pename"
                  + "     , sname"
                  + "     , sscore"
                  + "     , sid"
                  + "  from rgraph "
                  + " where sid =?");*/
        	
        	
        	pstmt = conn.prepareStatement(
/*                    "  select graphid"
                            + "     , pescore"
                            + "     , pename"
                            + "     , sname"
                            + "     , sscore"
                            + "     , sid"
                            + "     , memberiId"
                            + "  from rgraph "
                            + " where sid = ( select s.sid "
                            + " form MEMBER m, STUDENT s "
                            + " where m.MEMBERID = ?  AND m.MEMBERID = s.MEMBERID"*/
        			" select * "
        			+ " from rgraph "
        			+ " where sid = " 
        			+ " ( select s.sid "
        			+ " from MEMBER m, STUDENT s "
        			+ " where m.MEMBERID = ? AND m.MEMBERID = s.MEMBERID)"
        			);
        	
          pstmt.setString(1, memberId);
          rs = pstmt.executeQuery();
          while(rs.next()) {
        	  rgraphDTO = new RgraphDTO();
        	  rgraphDTO.setGraphId(rs.getInt("graphid"));
        	  rgraphDTO.setPescore(rs.getInt("pescore"));
        	  rgraphDTO.setPename(rs.getString("pename"));
        	  rgraphDTO.setSname(rs.getString("sname"));
        	  rgraphDTO.setSscore(rs.getInt("sscore"));
        	  rgraphDTO.setsId(rs.getString("sid"));
              list.add(rgraphDTO);
          }
          return list;
        } finally {
			if (rs != null)
				try {
					rs.close();
				} catch (Exception e2) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (Exception e2) {
				}
		}
    }
	
	
}
