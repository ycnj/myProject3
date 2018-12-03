package test.users.dto;

public class UsersDto {
	private String email;
	private String name;
	private String pwd;
	private String regdate;
	public UsersDto() {}
	public UsersDto(String email, String name, String pwd, String regdate) {
		super();
		this.email = email;
		this.name = name;
		this.pwd = pwd;
		this.regdate = regdate;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	
}
