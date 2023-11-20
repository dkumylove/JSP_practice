package com.momo.utils;

import java.io.IOException;

import jakarta.servlet.jsp.JspWriter;

public class JSFunction {
	
	/**
	 * 알림창을 뛰우고 이전페이지로 이동한다. 
	 */
	public static void alertBack(String msg, JspWriter out) {
		// 삽일할 자바스크립트 코드 생성
		String script = ""
						+ "<script type='text/javascript'>"
						+ "		alert('" + msg + "');"
						+ "		history.go(-1);"
						+ "</script>";
		try {
			// out객체를 활용하여 스크립트를 화면에 출력
			out.print(script);
		} catch (IOException e) {
			System.out.println("JSFunction.alertBack()===IOException 예외상황 발생");
			e.printStackTrace();
		}
	}
	/**
	 * 알림창을 띄우고 URL로 이동 합니다.
	 * @param msg
	 * @param url
	 * @param out
	 */
	public static void alertLocation(String msg, String url, JspWriter out) {
		// 삽일할 자바스크립트 코드 생성
			String script = ""
							+ "<script type='text/javascript'>"
							+ "		alert('" + msg + "');"
							+ "		location.href='" + url + "';"
							+ "</script>";
			try {					// out객체를 활용하여 스크립트를 화면에 출력
				out.print(script);
			} catch (IOException e) {
				System.out.println("JSFunction.alertLocation()===IOException 예외상황 발생");
				e.printStackTrace();				
			}
	}
	
}
