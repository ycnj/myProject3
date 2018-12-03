package test.controller;

public class ActionForward {
	//이동 경로를 저장할 필드
	private String path;
	//리다이렉트 이동 여부를 저장할 필드
	private boolean isRedirect;
	
	//생성자
	public ActionForward(String path) {
		this.path=path;
	}
	//생성자2
	public ActionForward(String path, boolean isRedirect) {
		this.path=path;
		this.isRedirect=isRedirect;
	}
	
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public boolean isRedirect() {
		return isRedirect;
	}
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
}
