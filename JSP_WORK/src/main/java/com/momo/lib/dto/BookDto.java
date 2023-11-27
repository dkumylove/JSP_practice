package com.momo.lib.dto;

/**
 * 도서 테이블의 정보를 담아준다.
 * 
 */
public class BookDto {
	private String no;
	private String title;
	private String author;
	private String rentyn;
	private String rentynStr;
	
	/**
	 * object객체가 가지고있는 메서드
	 * '객체의이름@주소값'을 출력
	 */
	@Override
	public String toString() {
		return "[title : " + title + " ]";
	}
	

	public BookDto() {
		
	}
	
	
	
	public BookDto(String title, String author) {
		super();
		this.title = title;
		this.author = author;
	}


	public BookDto(String no, String title, String author, String rentyn) {
		this.no = no;
		this.title = title;
		this.author = author;
		this.rentyn = rentyn;
		
		rentynStr = rentyn.equals("Y") ? "대여중" : "대여가능";
	}
	
	
	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getRentyn() {
		return rentyn;
	}

	public void setRentyn(String rentyn) {
		this.rentyn = rentyn;
		this.rentynStr = rentyn.equals("Y") ? "대여중" : "대여가능";
	}

	public String getRentynStr() {
		return rentynStr;
	}

	public void setRentynStr(String rentynStr) {
		this.rentynStr = rentynStr;
	}
	
	
}
