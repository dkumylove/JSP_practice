package com.momo.el;

public class MyElClass {
	
	public String gender;
	
	public String getGender() {
		return gender;
	}
	
	public void setGender(String gender) {
		this.gender = gender;
	}

	/**
	 * 주민등록번호를 입력 받아서 성별을 반환
	 * jumin : 000000-0000000
	 * @param jumin
	 * @return 성별(남, 여)
	 */
	public String getGender(String jumin) {
		
		String gender = "";
		
		// 문자열의 위치를 확인 indexOf
		int startIndex = jumin.indexOf("-")+1;
		
		// subString(시작번호, 끝번호)
		String str = jumin.substring(startIndex, startIndex + 1);
		
		// 주민번호 뒤의 첫번쨰 문자가 
		// 1, 3 이면 남자를 반환
		// 2, 4 이면 여자를 반환
		if ("1".equals(str) || "3".equals(str)) {
			System.out.println("남자");
			gender= "남자";
	    } else if ("2".equals(str) || "4".equals(str)) {
	    	System.out.println("여자");
	    	gender= "여자";
	    } else {
	    	System.out.println("주민등록번호를 확인해주세요");
	    	gender ="주민등록번호를 확인해주세요";
	    }	
		return gender;
	}
	
	
	public static void main(String[] args) {
		// 테스트
		MyElClass e = new MyElClass();
		System.out.println(e.getGender("000000-1000000"));
		System.out.println(e.getGender("000000-2000000"));
		System.out.println(e.getGender("000000-3000000"));
		System.out.println(e.getGender("000000-4000000"));
		System.out.println(e.getGender("000000-5000000"));
		

	}
}
