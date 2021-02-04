package tMallVO;

public class TMalltUserVO {
	private int flag;
	private String id;
	private String pw;
	private String nickname;
	private String name;
	private String tel;
	private String address;
	private String language;
	private int gender;
	private int age;
	private String introduce;
	
	public TMalltUserVO() {}
	public TMalltUserVO(int flag, String id, String pw, String nickname, String name, String tel,
						String address, String language, int gender, int age, String introduce) {
		this.flag = flag;
		this.id = id;
		this.pw = pw;
		this.nickname = nickname;
		this.name = name;
		this.tel = tel;
		this.address = address;
		this.language = language;
		this.gender = gender;
		this.age = age;
		this.introduce = introduce;
	}
	
	public int getFlag() {
		return flag;
	}
	public void setFlag(int flag) {
		this.flag = flag;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
}