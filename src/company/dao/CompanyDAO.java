package company.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import company.model.Company;

public class CompanyDAO {

	// 싱글톤
	private static CompanyDAO dao = null;

	public CompanyDAO() {}
	public static CompanyDAO getInstance() {
		if( dao == null ) {
			dao = new CompanyDAO();
		}
		return dao;
	}

	// 업체등록 insert
	public int insert(Company company, Connection conn) throws SQLException {

		int result = 0;

		PreparedStatement pstmt = null;

		try {
			
			String sql = " insert into company "
					+" (cpname, cpnum, cphomepage, cpestablished, cpceo, cpzipcode, cpaddr1, cpaddr2, cpempnum, cpsector, cpscale "
					+" , cpbusinessarea, cpannual, cpfax, cpetc,  cpcontactname, cpcontactposition, cpcontacttel, cptel, cpcontactemail ) "
					+" values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";	


			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, company.getCpname());
			pstmt.setInt(2, company.getCpnum());
			pstmt.setString(3, company.getCphomepage());
			pstmt.setString(4, company.getCpestablished());
			pstmt.setString(5, company.getCpceo());
			pstmt.setInt(6, company.getCpzipcode());
			pstmt.setString(7, company.getCpaddr1());
			pstmt.setString(8, company.getCpaddr2());
			pstmt.setInt(9, company.getCpempnum());
			pstmt.setString(10, company.getCpsector());
			pstmt.setString(11, company.getCpscale());
			pstmt.setString(12, company.getCpbusinessarea());
			pstmt.setString(13, company.getCpannual());
			pstmt.setString(14, company.getCpfax());
			pstmt.setString(15, company.getCpetc());
			pstmt.setString(16, company.getCpcontactname());
			pstmt.setString(17, company.getCpcontactposition());
			pstmt.setString(18, company.getCpcontacttel());
			pstmt.setString(19, company.getCptel());
			pstmt.setString(20, company.getCpcontactemail());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			System.out.println("> CompanyDAO() : " + e.toString());	
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}
		return result;
	}
	
	// 사업자등록번호 중복체크
	public int cpNumCheck(int cpnum, Connection conn) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from company where cpnum = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cpnum);
			rs = pstmt.executeQuery();

			if ( rs.next() ) {
				result = 1;
			} else {
				result = 0;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}

		return result;
	}

}
