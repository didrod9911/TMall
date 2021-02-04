package tMallVO;

public class TMallPurchaseListVO {
	private String id;
	private int sSeq;
	private String sID;
	private String sNickname;
	private String language;
	private String className;
	private int classPrice;
	private int purchaseCnt;
	
	public TMallPurchaseListVO() {}
	public TMallPurchaseListVO(String id, int sSeq, String sID, String sNickname, String language,
								String className, int classPrice, int purchaseCnt) {
		this.id = id;
		this.sSeq = sSeq;
		this.sID = sID;
		this.sNickname = sNickname;
		this.language = language;
		this.className = className;
		this.classPrice = classPrice;
		this.purchaseCnt = purchaseCnt;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getsSeq() {
		return sSeq;
	}
	public void setsSeq(int sSeq) {
		this.sSeq = sSeq;
	}
	public String getsID() {
		return sID;
	}
	public void setsID(String sID) {
		this.sID = sID;
	}
	public String getsNickname() {
		return sNickname;
	}
	public void setsNickname(String sNickname) {
		this.sNickname = sNickname;
	}
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public int getClassPrice() {
		return classPrice;
	}
	public void setClassPrice(int classPrice) {
		this.classPrice = classPrice;
	}
	public int getPurchaseCnt() {
		return purchaseCnt;
	}
	public void setPurchaseCnt(int purchaseCnt) {
		this.purchaseCnt = purchaseCnt;
	}
}