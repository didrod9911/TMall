package tMallDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import tMallDBConn.TMallDBConn;
import tMallVO.TMallProductVO;
import tMallVO.TMallPurchaseListVO;
import tMallVO.TMalltUserVO;
import tMallVO.USERSAY;

public class TMallDAO {
	private Connection con;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public TMallDAO() throws ClassNotFoundException, SQLException{
		con= new TMallDBConn().getConnection();
	}
	
	public ArrayList<TMalltUserVO> getAllUserInfo() throws SQLException{
		ArrayList<TMalltUserVO> allUser = new ArrayList<TMalltUserVO>();

		String sql = "SELECT * FROM tUser";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();

		while(rs.next()) {
			int flag = rs.getInt("flag");
			String id = rs.getString("id");
			String pw = rs.getString("pw");
			String nickname = rs.getString("nickname");
			String name = rs.getString("name");
			String tel = rs.getString("tel");
			String address = rs.getString("address");
			String language = rs.getString("language");
			int gender = rs.getInt("gender");
			int age = rs.getInt("age");
			String introduce = rs.getString("introduce");

			TMalltUserVO user = new TMalltUserVO(flag, id, pw, nickname, name, tel, address, language, gender, age, introduce);
			allUser.add(user);
		}

		return allUser;
	}
	
	public ArrayList<TMallProductVO> getAllProductInfo() throws SQLException{
		ArrayList<TMallProductVO> allProduct = new ArrayList<TMallProductVO>();

		String sql = "SELECT * FROM PRODUCT ORDER BY sSeq desc";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();

		while(rs.next()) {
			int sSeq = rs.getInt("sSeq");
			String sID = rs.getString("sID");
			String sNickname = rs.getString("sNickname");
			String language = rs.getString("language");
			int sGender = rs.getInt("sGender");
			int sAge = rs.getInt("sAge");
			String className = rs.getString("className");
			int classTime = rs.getInt("classTime");
			int classNum = rs.getInt("classNum");
			String classPlace = rs.getString("classPlace");
			int classPrice = rs.getInt("classPrice");
			String classData = rs.getString("classData");

			TMallProductVO product = new TMallProductVO(sSeq, sID, sNickname, language, sGender, sAge,
					className, classTime, classNum, classPlace, classPrice, classData);
			allProduct.add(product);
		}

		return allProduct;
	}

	//12.01 권태영추가
	//물품목록화면 물품검색용
	public ArrayList<TMallProductVO> productSearch(String tLanguage, int tGender, int tAge, int tClassTime) {
		ArrayList<TMallProductVO> allProduct = new ArrayList<TMallProductVO>();
		boolean flag = false;

		String sql = "SELECT * FROM PRODUCT";

		if((tLanguage != null) || (tGender != -1) || (tAge != -1) || (tClassTime != -1))
			sql = sql + " WHERE";

		if(tLanguage != null) {
			if(flag)
				sql = sql + " AND language='" + tLanguage + "'";
			else {
				sql = sql + " language='" + tLanguage + "'";
				flag = true;
			}
		}

		if(tGender != -1) {
			if(flag)
				sql = sql + " AND sGENDER=" + tGender;
			else {
				sql = sql + " sGENDER=" + tGender;
				flag = true;
			}
		}

		if(tAge != -1) {
			if(tAge == 10) {
				if(flag)
					sql = sql + " AND sAGE<20";
				else {
					sql = sql + " sAGE<20";
					flag = true;
				}
			}
			if(tAge == 20) {
				if(flag)
					sql = sql + " AND sAGE>=20 AND sAGE<30";
				else {
					sql = sql + " sAGE>=20 AND sAGE<30";
					flag = true;
				}
			}
			if(tAge == 30) {
				if(flag)
					sql = sql + " AND sAGE>=30 AND sAGE<40";
				else {
					sql = sql + " sAGE>=30 AND sAGE<40";
					flag = true;
				}
			}
			if(tAge == 40) {
				if(flag)
					sql = sql + " AND sAGE>=40 AND sAGE<50";
				else {
					sql = sql + " sAGE>=40 AND sAGE<50";
					flag = true;
				}
			}
			if(tAge == 50) {
				if(flag)
					sql = sql + " AND sAGE>=50";
				else {
					sql = sql + " sAGE>=50";
					flag = true;
				}
			}
		}

		if(tClassTime != -1) {
			if(tClassTime == 1) {
				if(flag)
					sql = sql + " AND CLASSTIME<60";
				else {
					sql = sql + " CLASSTIME<60";
					flag = true;
				}
			}
			if(tClassTime == 2) {
				if(flag)
					sql = sql + " AND CLASSTIME>=60 AND CLASSTIME<120";
				else {
					sql = sql + " CLASSTIME>=60 AND CLASSTIME<120";
					flag = true;
				}
			}
			if(tClassTime == 3) {
				if(flag)
					sql = sql + " AND CLASSTIME>=120 AND CLASSTIME<180";
				else {
					sql = sql + " CLASSTIME>=120 AND CLASSTIME<180";
					flag = true;
				}
			}
			if(tClassTime == 4) {
				if(flag)
					sql = sql + " AND CLASSTIME>=180";
				else {
					sql = sql + " CLASSTIME>=180";
					flag = true;
				}
			}
		}
		
		sql = sql + " ORDER BY sSeq desc";

		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				int sSeq = rs.getInt("sSeq");
				String sID = rs.getString("sID");
				String sNickname = rs.getString("sNickname");
				String language = rs.getString("language");
				int sGender = rs.getInt("sGender");
				int sAge = rs.getInt("sAge");
				String className = rs.getString("className");
				int classTime = rs.getInt("classTime");
				int classNum = rs.getInt("classNum");
				String classPlace = rs.getString("classPlace");
				int classPrice = rs.getInt("classPrice");
				String classData = rs.getString("classData");

				TMallProductVO product = new TMallProductVO(sSeq, sID, sNickname, language, sGender, sAge,
						className, classTime, classNum, classPlace, classPrice, classData);

				allProduct.add(product);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return allProduct;
	}
	//12.01 권태영추가-end

	//12.07 권태영추가 purchase_List 테이블 관련
	public boolean purchaseCheck(String bID, int sSeq) throws SQLException {
		boolean flag;

		String sql = "SELECT * FROM PURCHASE_LIST WHERE ID=? AND sSeq=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, bID);
		pstmt.setInt(2, sSeq);
		rs = pstmt.executeQuery();

		if(rs.next()) {
			flag = true;
		} else {
			flag = false;
		}

		return flag;
	}


	public void insertPList(String bID, int sSeq, String sID, String sNickname, String language,
			String className, int classPrice) throws SQLException{
		String sql = "INSERT INTO PURCHASE_LIST VALUES(?,?,?,?,?,?,?,1)";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, bID);
		pstmt.setInt(2, sSeq);
		pstmt.setString(3, sID);
		pstmt.setString(4, sNickname);
		pstmt.setString(5, language);
		pstmt.setString(6, className);
		pstmt.setInt(7, classPrice);
		pstmt.executeUpdate();
	}

	public void updatePList(String bID, int sSeq) throws SQLException {
		String sql = "UPDATE PURCHASE_LIST SET PURCHASECNT = PURCHASECNT+1 WHERE ID=? AND sSeq=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, bID);
		pstmt.setInt(2, sSeq);
		pstmt.executeUpdate();
	}
	//12.07권태영추가-end

	//12.06 권태영추가
	//물품상세화면 물품정보(작성자:손혜지)
	//+게시판용(작성자:손혜지)
	public TMallProductVO getInfo(int sSeq)			//상품클릭시 상품번호로 상품 상세정보 가져오기
			throws SQLException{
		TMallProductVO cVO=null;
		String sql = "SELECT * FROM PRODUCT where sSeq=?";	//? : 상품번호
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, sSeq);
		rs = pstmt.executeQuery();
		if(rs.next()){	//찾았으면 rs종이박스에 상품정보가 있다는 것
			String sID = rs.getString("sID");
			String sNickname=rs.getString("sNickname");
			String language = rs.getString("language");
			int sGender = rs.getInt("sGender");
			int sAge = rs.getInt("sAge");
			String className = rs.getString("className");
			int classTime = rs.getInt("classTime");
			int classNum = rs.getInt("classNum");
			String classPlace =rs.getString("classPlace");
			int classPrice = rs.getInt("classPrice");
			String classData = rs.getString("classData");

			//상품정보 전부꺼내서 

			//vo 그릇에 넣자 
			cVO = new TMallProductVO(sSeq, sID, sNickname, language, sGender,sAge,
					className, classTime, classNum, classPlace, classPrice, classData);
			//생성자로 가서 

		}else {
			cVO=null;
		}
		return cVO;		
	}// 11/30 - 상품 클릭시 상세정보 가져오기 추가

	public String getDate() {
		String sql = "SELECT SYSDATE FROM DUAL";	
		//현재시간 가져오기		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1); //현재의 날짜 반환
			}

		}catch(Exception e) {
			e.printStackTrace();
		}
		return ""; //데이터베이스 오류시 알려줌
	}//getDate() end

	public int getNext() {
		String sql = "SELECT NO FROM USERSAY ORDER BY NO DESC";	
		//게시글 번호 가져오는 함수	
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1)+1; //게시글 +1
			}
			return 1; //첫번째 게시물인 경우 1을 반환
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류시 알려줌
	}//getNext() end

	public int write(String TITLE, String USERID,String UCON) {
		String sql = "INSERT INTO USERSAY VALUES(?, ?, ?, TO_DATE(?,'yyyy-mm-dd hh24:mi:ss'), ?, ?)";
		try {
			PreparedStatement pstmt2 = null;
			pstmt2 = con.prepareStatement(sql);	
			pstmt2.setInt(1, getNext());
			pstmt2.setString(2,TITLE);
			pstmt2.setString(3, USERID);
			pstmt2.setString(4, getDate());
			pstmt2.setString(5, UCON);
			pstmt2.setInt(6, 1);
			return pstmt2.executeUpdate();

		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류시 알려줌
	}//write() end

	public ArrayList<USERSAY> getList(int pageNumber) {
		String sql = "SELECT * FROM (SELECT * FROM USERSAY WHERE NO <? AND UDEL = 1 ORDER BY NO DESC) WHERE ROWNUM <= 10";
		//한페이지 글 10개까지														
		ArrayList<USERSAY> list = new ArrayList<USERSAY>();
		PreparedStatement pstmt3 = null;
		try {			
			pstmt3 = con.prepareStatement(sql);
			pstmt3.setInt(1, getNext() -(pageNumber - 1)*10);	//getNext();
			rs = pstmt3.executeQuery();
			while(rs.next()){
				USERSAY usersay = new USERSAY();
				usersay.setNO(rs.getInt(1));
				usersay.setTITLE(rs.getString(2));
				usersay.setUSERID(rs.getString(3));
				usersay.setWRITED(rs.getString(4));
				usersay.setUCON(rs.getString(5));
				usersay.setUDEL(rs.getInt(6));
				list.add(usersay);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list; //데이터베이스 오류시 알려줌
	}//getlist() end

	public boolean nextPage(int pageNumber) {
		String sql = "SELECT * FROM (SELECT * FROM USERSAY WHERE NO <? AND UDEL = 1 ORDER BY NO DESC) WHERE ROWNUM <= 10";
		ArrayList<USERSAY> list = new ArrayList<USERSAY>();	
		try {
			PreparedStatement pstmt4=null;
			pstmt4 = con.prepareStatement(sql);
			pstmt4.setInt(1, getNext() -(pageNumber - 1)*10);
			rs = pstmt4.executeQuery();
			if(rs.next()) {
				return true; //게시글 +1
			}
			return true; //첫번째 게시물인 경우 1을 반환
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false; //데이터베이스 오류시 알려줌
	}//nextPage() end

	public USERSAY getWrite(int NO) {
		String sql = "SELECT * FROM USERSAY WHERE NO =?";	

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,NO);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				USERSAY usersay = new USERSAY();
				usersay.setNO(rs.getInt(1));
				usersay.setTITLE(rs.getString(2));
				usersay.setUSERID(rs.getString(3));
				usersay.setWRITED(rs.getString(4));
				usersay.setUCON(rs.getString(5));
				usersay.setUDEL(rs.getInt(6));
				return usersay;
			}

		}catch(Exception e) {
			e.printStackTrace();
		}
		return null; //데이터베이스 오류시 알려줌
	}//getWrite() end
	//12.06 권태영추가(작성자:손혜지)-end	

	//12.07 권태영추가(작성자:이상민)
	// 아이디 중복 검사 - 이상민
	public int checkOverlap(String checkValue, boolean isId) throws ClassNotFoundException {
		String sql = null;
		String id = "SELECT id FROM tUser WHERE id = ?";
		String nickname = "SELECT nickname FROM tUser WHERE nickname = ?";
		sql = (isId) ? id : nickname;
		try (Connection conn = new TMallDBConn().getConnection();
				PreparedStatement pst = conn.prepareStatement(sql)) {
			pst.setString(1, checkValue);
			ResultSet rset = pst.executeQuery();
			return rset.next() ? 1 : 0;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	} // 아이디 중복 검사 - END

	// 유저 DB 저장 - 이상민
	public void insertUser(TMalltUserVO vo) {
		String sql = "INSERT INTO tUser VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try (Connection conn = new TMallDBConn().getConnection();
				PreparedStatement pst = conn.prepareStatement(sql)) {
			pst.setInt(1, vo.getFlag());
			pst.setString(2, vo.getId());
			pst.setString(3, vo.getPw());
			pst.setString(4, vo.getNickname());
			pst.setString(5, vo.getName());
			pst.setString(6, vo.getTel());
			pst.setString(7, vo.getAddress());
			pst.setString(8, vo.getLanguage());
			pst.setInt(9, vo.getGender());
			pst.setInt(10, vo.getAge());
			pst.setString(11, vo.getIntroduce());
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	// 유저 DB 저장 - END

	// 유저 한명 정보 SELECT - 이상민
	public TMalltUserVO getOneUserInfo(String id) {
		String sql = "SELECT * FROM tUser WHERE id = ?";
		try (Connection conn = new TMallDBConn().getConnection();
				PreparedStatement pst = conn.prepareStatement(sql)) {
			pst.setString(1, id);
			ResultSet rset = pst.executeQuery();
			while (rset.next()) {
				System.out.println("응??");
				TMalltUserVO vo = new TMalltUserVO();
				vo.setFlag(rset.getInt(1));
				vo.setId(rset.getString(2));
				vo.setPw(rset.getString(3));
				vo.setNickname(rset.getString(4));
				vo.setName(rset.getString(5));
				vo.setTel(rset.getString(6));
				vo.setAddress(rset.getString(7));
				vo.setGender(rset.getInt(9));
				vo.setAge(rset.getInt(10));
				if (vo.getFlag() == 2) {
					vo.setLanguage(rset.getString(8));
					vo.setIntroduce(rset.getString(11));
				}
				System.out.println("RETURN VO");
				return vo;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("RETURN NULL");
		return null;
	} // 유저 한명 정보 SELECT - END
	//12.07 권태영추가(작성자:이상민)-end

	//12.07 권태영추가(작성자:배건우)
	// 구매자 정보 UPDATE - 배건우
	public void UpdateUSer(String pw, String name, String nickname, int age, String address, String tel, int gender, String id) {
		String sql = "UPDATE tUser SET pw = ?, name = ?, nickname = ?, age= ?, address = ?, tel = ?, gender = ? WHERE id = ?";
		try {
			con = new TMallDBConn().getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, pw);
			pstmt.setString(2, name);
			pstmt.setString(3, nickname);
			pstmt.setInt(4, age);
			pstmt.setString(5, address);
			pstmt.setString(6, tel);
			pstmt.setInt(7, gender);
			pstmt.setString(8, id);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	} // 구매자 정보 - END

	// 판매자 정보 UPDATE - 배건우
	public void UpdateUSer2(String pw2, String name2, String nickname2, int age2, String address2, String tel2, int gender2, String language, String id2) {
		String sql = "UPDATE tUser SET pw = ?, name = ?, nickname = ?, age= ?, address = ?, tel = ?, gender = ?, language = ? WHERE id = ?";
		try {
			con = new TMallDBConn().getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, pw2);
			pstmt.setString(2, name2);
			pstmt.setString(3, nickname2);
			pstmt.setInt(4, age2);
			pstmt.setString(5, address2);
			pstmt.setString(6, tel2);
			pstmt.setInt(7, gender2);
			pstmt.setString(8, language);
			pstmt.setString(9, id2);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	} // 구매자 정보 - END

	/*sSeq		NUMBER,				-- 물품 시퀀스
		sID		VARCHAR2(20),		-- 판매자 ID
		sNickname	VARCHAR2(20),		-- 판매자 닉네임
		language	VARCHAR2(20),		-- 물품언어
		className	VARCHAR2(100),		-- 물품 글제목
		classPrice	NUMBER(10),			-- 물품가격
		purchaseCnt	NUMBER(10)			-- 구입횟수*/

	// 구매현황
	public List<TMallProductVO> selectPurchaseList (String id) {
		List<TMallProductVO> list = new ArrayList<>();
		String sql = "SELECT * FROM PURCHASE_LIST WHERE id = ?";
		try {
			con = new TMallDBConn().getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				TMallProductVO vo = new TMallProductVO();
				vo.setsSeq(rs.getInt("sSeq"));
				vo.setsID(rs.getString("sID"));
				vo.setsNickname(rs.getString("sNickname"));
				vo.setLanguage(rs.getString("language"));
				vo.setClassName(rs.getString("className"));
				vo.setClassPrice(rs.getInt("classPrice"));
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return list;
	}
	// 판매현황
	public List<TMallProductVO> selectProduct (String sID) {
		List<TMallProductVO> list30 = new ArrayList<>();
		String sql = "SELECT * FROM PRODUCT WHERE sID = ?";
		try {
			con = new TMallDBConn().getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, sID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				TMallProductVO vo = new TMallProductVO();
				vo.setsSeq(rs.getInt("sSeq"));
				vo.setsID(rs.getString("sID"));
				vo.setsNickname(rs.getString("sNickname"));
				vo.setLanguage(rs.getString("language"));
				vo.setClassName(rs.getString("className"));
				vo.setClassPrice(rs.getInt("classPrice"));
				list30.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return list30;
	}
	//12.07 권태영추가(작성자:배건우)-end

	//12.07 권태영추가(물품등록관련, 작성자:이상민)
	public void insertProduct(TMallProductVO vo) {
		String sql = "INSERT INTO PRODUCT VALUES(p_seq.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try (Connection conn = new TMallDBConn().getConnection();
				PreparedStatement pst = conn.prepareStatement(sql)) {
			pst.setString(1, vo.getsID());
			pst.setString(2, vo.getsNickname());
			pst.setString(3, vo.getLanguage());
			pst.setInt(4, vo.getsGender());
			pst.setInt(5, vo.getsAge());
			pst.setString(6, vo.getClassName());
			pst.setInt(7, vo.getClassTime());
			pst.setInt(8, vo.getClassNum());
			pst.setString(9, vo.getClassPlace());
			pst.setInt(10, vo.getClassPrice());
			pst.setString(11, vo.getClassData());
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public TMallProductVO selectOneProduct(int number) {
		String sql = "SELECT * FROM PRODUCT WHERE sSeq = ?";
		try (Connection conn = new TMallDBConn().getConnection();
				PreparedStatement pst = conn.prepareStatement(sql)) {
			pst.setInt(1, number);
			ResultSet rset = pst.executeQuery();
			if (rset.next()) {
				TMallProductVO vo = new TMallProductVO();
				vo.setsSeq(rset.getInt(1));
				vo.setsID(rset.getString(2));
				vo.setsNickname(rset.getString(3));
				vo.setLanguage(rset.getString(4));
				vo.setsGender(rset.getInt(5));
				vo.setsAge(rset.getInt(6));
				vo.setClassName(rset.getString(7));
				vo.setClassTime(rset.getInt(8));
				vo.setClassNum(rset.getInt(9));
				vo.setClassPlace(rset.getString(10));
				vo.setClassPrice(rset.getInt(11));
				vo.setClassData(rset.getString(12));
				return vo;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	//12.07 권태영추가(물품등록관련, 작성자:이상민)-end

	public String getOneUserinInfo(String sID) throws SQLException{

		String sql = "SELECT introduce FROM tUser WHERE id = ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, sID);
		rs = pstmt.executeQuery();
		String introduce = null;
		while(rs.next()) {
			introduce = rs.getString("introduce");

		}
		return introduce;
	} //12.8 손혜지 추가(물품상세정보에서 introduce 가져오기)

	public ArrayList<TMallProductVO> getAllSales(String id) throws SQLException{
		
		ArrayList<TMallProductVO> products = new ArrayList<TMallProductVO>();
		
		String sql = "SELECT * FROM PRODUCT WHERE sID=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			int sSeq = rs.getInt("sSeq");
			String sID = rs.getString("sID");
			String sNickname = rs.getString("sNickname");
			String language = rs.getString("language");
			int sGender = rs.getInt("sGender");
			int sAge = rs.getInt("sAge");
			String className = rs.getString("className");
			int classTime = rs.getInt("classTime");
			int classNum = rs.getInt("classNum");
			String classPlace = rs.getString("classPlace");
			int classPrice = rs.getInt("classPrice");
			String classData = rs.getString("classData");
			
			TMallProductVO product = new TMallProductVO(sSeq, sID, sNickname, language, sGender, sAge,
									className, classTime, classNum, classPlace, classPrice, classData);
			products.add(product);
		}
		
		return products;
	}
	
	public ArrayList<TMallPurchaseListVO> getAllPList(String bId) throws SQLException{
		
		ArrayList<TMallPurchaseListVO> allPList = new ArrayList<TMallPurchaseListVO>();
		
		String sql = "SELECT * FROM PURCHASE_LIST WHERE id=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, bId);
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			String id = rs.getString("id");
			int sSeq = rs.getInt("sSeq");
			String sID = rs.getString("sID");
			String sNickname = rs.getString("sNickname");
			String language = rs.getString("language");
			String className = rs.getString("className");
			int classPrice = rs.getInt("classPrice");
			int purchaseCnt = rs.getInt("purchaseCnt");
			
			TMallPurchaseListVO pList = new TMallPurchaseListVO(id, sSeq, sID, sNickname, language,
																className, classPrice, purchaseCnt);
			allPList.add(pList);
		}
		
		return allPList;
	}
	
	
}

