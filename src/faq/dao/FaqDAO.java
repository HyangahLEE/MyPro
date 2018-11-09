package faq.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ceo.model.CeoDTO;
import faq.model.FaqDTO;




public class FaqDAO {

   private static FaqDAO dao = null;
   
   private FaqDAO() {}
   
   public static FaqDAO getInstance() {
      if( dao == null ) {
         dao = new FaqDAO();
      }
      return dao;
   }
   
   
   // ceoinsert
   
   public int insert(Connection conn, FaqDTO dto) {
      PreparedStatement pstmt = null;
      int result = 0;
      
        
             // 1.
             String sql = "insert into faq ( "+
                  " faqnum, faqtitle,  faqreaded, faqcontent, mgid,faqdid "
                  + ")"
            +" values "
            +" ( seq_faq.nextval, ?,?,?,?,?  )";
            
          
         try {
            
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, dto.getFaqtitle());         
            pstmt.setInt(2, dto.getFaqreaded());
            pstmt.setString(3, dto.getFaqcontent());
            pstmt.setString(4, dto.getMgid());
            pstmt.setString(5, dto.getFaqdid());
            
               result = pstmt.executeUpdate();
               return result;
         } catch (SQLException e) {
            e.printStackTrace();
         }finally {
            try { pstmt.close(); } catch (SQLException e) {   e.printStackTrace();}            
            try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
         }
         
           
   
      
      return result;
   } 
   
   

   
   // selectList 검색조건 o
      public List<FaqDTO> selectList(
            Connection conn
            , int start, int end
            , String searchCondition
            , String searchWord ){
         
               
         String sql="select * from ";
         sql+="(";
         sql+=" select rownum rnum, faqnum,faqtitle,faqWRITEDT,faqREADed,faqCONTENT, mgid ";
         sql+= ", case       when ( sysdate - faqWRITEDT ) < 0.041667  then  'true'      else 'false'      end  new ";
         sql+=" from ( ";
         sql+="          select * from faq ";
         sql +=" where " + searchCondition +" like '%" + searchWord+"%'";
         sql+="         ) ";
         sql+=")";
         sql+=" where rnum between ? and ?";   
         
         //System.out.println(sql);
         
         PreparedStatement pstmt = null;
         ResultSet rs = null;
         ArrayList<FaqDTO> list = new ArrayList<>();
         try {
            
            pstmt = conn.prepareStatement(sql);
            
            pstmt.setInt(1, start);
            pstmt.setInt(2, end);
            
            rs = pstmt.executeQuery();
            
            FaqDTO dto = null;
            while( rs.next()) {
               dto = new FaqDTO();
               dto.setFaqnum(rs.getInt("faqnum"));
               
               String faqtitle = rs.getString("faqtitle");
               if( searchCondition.equals("faqtitle")) {
                  faqtitle = faqtitle.replace(searchWord
                     , String.format("<span style='color:red;background:yellow;'>%s</span>", searchWord) );
               }
               dto.setFaqtitle(faqtitle);
               
               dto.setFaqwritedt(rs.getDate("FAQWRITEDT"));
               dto.setFaqreaded(rs.getInt("FAQREADED"));
               dto.setFaqcontent(rs.getString("FAQCONTENT"));
               dto.setMgid(rs.getString("mgid"));   
               list.add(dto);
            }
         } catch (SQLException e) {
            e.printStackTrace();
         }finally {
            try { pstmt.close(); } catch (SQLException e) {   e.printStackTrace();}
            try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
         }
         return list;
      }
   
      
      
   // selectList 검색조건 x
   public List<FaqDTO> selectList(
         Connection conn
         , int start, int end){
      
      String sql="select * from ";
      sql+="(";
      sql+=" select rownum rnum, faqnum,faqtitle,faqWRITEDT,faqREADed,faqCONTENT, mgid ,faqdname";
      sql+= ", case       when ( sysdate - faqWRITEDT ) < 0.041667  then  'true'      else 'false'      end  new ";
      sql+=" from  faq a, faq_div b ";
      sql+=" where a.faqdid = b.faqdid ";
      sql+=" order by faqnum desc) ";
      sql+=" where rnum between ? and ?"; 
      
      
      
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      ArrayList<FaqDTO> list = new ArrayList<>();
      try {
         
         pstmt = conn.prepareStatement(sql);
         
         pstmt.setInt(1, start);
         pstmt.setInt(2, end);
         
         rs = pstmt.executeQuery();
         
         FaqDTO dto = null;
         while( rs.next()) {
            dto = new FaqDTO();
            dto.setFaqnum(rs.getInt("faqnum"));
            dto.setFaqtitle(rs.getString("faqtitle"));
            dto.setFaqwritedt(rs.getDate("faqWRITEDT"));
            dto.setFaqreaded(rs.getInt("faqREADed"));
            dto.setFaqcontent(rs.getString("faqCONTENT"));
            dto.setMgid(rs.getString("mgid"));   
            dto.setFaqdname(rs.getString("faqdname"));
            list.add(dto);
         }
         
      } catch (SQLException e) {
         e.printStackTrace();
      }finally {
         try { pstmt.close(); } catch (SQLException e) {   e.printStackTrace();}
         try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
         //try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
      }
      return list;
   }
   
   
   //updateReadcount
   public int updateReadcount(Connection conn, int num) {
      String sql = "update faq "
            +" set faqreaded = faqreaded +1 "
            +" where faqnum = ?";
      
      PreparedStatement pstmt = null;
      int result = 0;   
      
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, num);
         result = pstmt.executeUpdate();
         
         
      } catch (SQLException e) {
         e.printStackTrace();
      }finally {
         try { pstmt.close(); } catch (SQLException e) {   e.printStackTrace();}
         //try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
      }
      return result;
   }
   
   
   
   // selectOne
   public FaqDTO selectOne(Connection conn, int num) {
      String sql = "select faqnum,faqtitle,faqwritedt,faqreaded,faqcontent,mgid,faqdname "
    		  + " from faq a, faq_div b "
            +"  where a.faqdid = b.faqdid and faqnum = ?";
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      
      FaqDTO dto = null;
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, num);
         rs = pstmt.executeQuery();
         
         if( rs.next()) {
            dto = new FaqDTO();
            dto.setFaqnum(rs.getInt("faqnum"));          
            dto.setFaqtitle(rs.getString("faqtitle"));
            dto.setFaqwritedt(rs.getDate("faqwritedt"));
            dto.setFaqreaded(rs.getInt("faqreaded"));
            dto.setFaqcontent(rs.getString("faqcontent"));
            dto.setMgid(rs.getString("mgid"));      
            dto.setFaqdname(rs.getString("faqdname"));
         
         
            
         }
      } catch (SQLException e) {
         e.printStackTrace();
      }finally {
         try { pstmt.close(); } catch (SQLException e) {   e.printStackTrace();}
         try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
         //try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
      }
      return dto;
   }
   
   
   //getTotalRecords
   public int getTotalRecords(Connection conn
         ,String searchCondition, String searchWord) {
      int cnt = 0;
      String sql = "select count(*) cnt from faq";
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
         try { pstmt.close(); } catch (SQLException e) {   e.printStackTrace();}
         //try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
         
      }
      return cnt;
   }
   
   
   
   public int getTotalRecords(Connection conn) {
      int cnt = 0;
      String sql = "select count(*) cnt from faq";
      
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
         try { pstmt.close(); } catch (SQLException e) {   e.printStackTrace();}
         //try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
         
      }
      return cnt;
   }
   
   
   
   
   //"1 2 3 4 5 6 7 8 9 10 >";
   public String pagingProc(int currentPage, int pageSize, int pageBlock   // 1 2 3... 10
         , int totalPages, String searchCondition, String searchWord ) { 
      
      int blockStart = ((currentPage-1)/pageBlock)*pageBlock+1;
      int blockEnd = blockStart + pageBlock -1;
      if( blockEnd > totalPages) blockEnd = totalPages;
      
      String paging = "<div style='width:100%;text-align:center'>";
      
      for( int i= blockStart; i<=blockEnd; i++) {
         if( i == currentPage ) paging += i;
         else paging +=String.format("<a href='faq_list.do?page=%d&searchCondition=%s&searchWord=%s'>%d</a>", i,searchCondition,searchWord,i);
      }
      paging +="</div>";
      return paging; 
   }
   
   
   
   
   public int delete(Connection conn, int num) {
      
      PreparedStatement pstmt = null;
      int cnt = 0;
      
      
      String sql = " delete from faq where faqnum = ? ";
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, num);
         cnt = pstmt.executeUpdate();
         
         
      
            return cnt;
         
      } catch (Exception e) {
         System.out.println("> DAO.delete : " + e.toString());
      }finally {
         try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
         try {conn.close();} catch (SQLException e) {e.printStackTrace();}
      }
   
      return cnt;
}

   
   
//수정하기
    public int edit(Connection conn, FaqDTO dto) {

      int result = 0 ;       
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      String sql= " update faq ";
      sql+=" set faqtitle=?,faqcontent=? ";
      sql+=" where faqnum = ?";
      
      try {
         pstmt =  conn.prepareStatement(sql);

         pstmt.setString(1, dto.getFaqtitle());
         pstmt.setString(2, dto.getFaqcontent());
         pstmt.setInt(3, dto.getFaqnum());
         rs = pstmt.executeQuery();
         if( rs.next() ){
               
               result = pstmt.executeUpdate();  
               return 1;
            }else{
               result = -1; 
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
      
      return result; 
   }
}
   
   