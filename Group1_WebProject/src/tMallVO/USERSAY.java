package tMallVO;

public class USERSAY {
	private int NO;
	private String TITLE;
	private String USERID;
	private String WRITED;
	private String UCON;
	private int UDEL;
	
	public USERSAY() {}
	public USERSAY(int NO,String TITLE,String USERID,String WRITED,String UCON,int UDEL) {
		this.NO=NO;
		this.TITLE=TITLE;
		this.USERID=USERID;
		this.WRITED=WRITED;
		this.UCON =UCON;
		this.UDEL=UDEL;
	}
	
	public int getNO() {
		return NO;
	}
	public void setNO(int nO) {
		NO = nO;
	}
	public String getTITLE() {
		return TITLE;
	}
	public void setTITLE(String tITLE) {
		TITLE = tITLE;
	}
	public String getUSERID() {
		return USERID;
	}
	public void setUSERID(String uSERID) {
		USERID = uSERID;
	}
	public String getWRITED() {
		return WRITED;
	}
	public void setWRITED(String wRITED) {
		WRITED = wRITED;
	}
	public String getUCON() {
		return UCON;
	}
	public void setUCON(String uCON) {
		UCON = uCON;
	}
	public int getUDEL() {
		return UDEL;
	}
	public void setUDEL(int uDEL) {
		UDEL = uDEL;
	}
}
