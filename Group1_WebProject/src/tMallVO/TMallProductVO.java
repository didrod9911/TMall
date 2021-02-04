package tMallVO;

public class TMallProductVO {
	private int sSeq;
	private String sID;
	private String sNickname;
	private String language;
	private int sGender;
	private int sAge;
	private String className;
	private int classTime;
	private int classNum;
	private String classPlace;
	private int classPrice;
	private String classData;
	
	public TMallProductVO() {}
	public TMallProductVO(int sSeq, String sID, String sNickname, String language, int sGender, int sAge,
			String className, int classTime, int classNum, String classPlace, int classPrice, String classData) {
		this.sSeq = sSeq;	
		this.sID = sID;
		this.sNickname = sNickname;
		this.language = language;
		this.sGender = sGender;
		this.sAge = sAge;
		this.className = className;
		this.classTime = classTime;
		this.classNum = classNum;
		this.classPlace = classPlace;
		this.classPrice = classPrice;
		this.classData = classData;
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
	public int getsGender() {
		return sGender;
	}
	public void setsGender(int sGender) {
		this.sGender = sGender;
	}
	public int getsAge() {
		return sAge;
	}
	public void setsAge(int sAge) {
		this.sAge = sAge;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public int getClassTime() {
		return classTime;
	}
	public void setClassTime(int classTime) {
		this.classTime = classTime;
	}
	public int getClassNum() {
		return classNum;
	}
	public void setClassNum(int classNum) {
		this.classNum = classNum;
	}
	public String getClassPlace() {
		return classPlace;
	}
	public void setClassPlace(String classPlace) {
		this.classPlace = classPlace;
	}
	public int getClassPrice() {
		return classPrice;
	}
	public void setClassPrice(int classPrice) {
		this.classPrice = classPrice;
	}
	public String getClassData() {
		return classData;
	}
	public void setClassData(String classData) {
		this.classData = classData;
	}
}