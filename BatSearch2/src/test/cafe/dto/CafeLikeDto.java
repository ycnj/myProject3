package test.cafe.dto;

public class CafeLikeDto {
	private int num;
	private int boardNum;
	private String name;
	private int like_check;
	
	public CafeLikeDto() {}
	
	public CafeLikeDto(int num, int boardNum, String name, int like_check) {
		super();
		this.num = num;
		this.boardNum = boardNum;
		this.name = name;
		this.like_check = like_check;
	}
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getLike_check() {
		return like_check;
	}
	public void setLike_check(int like_check) {
		this.like_check = like_check;
	}
	
	
}
