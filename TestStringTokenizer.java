package org.kh.java.api;

import java.util.StringTokenizer;

public class TestStringTokenizer {
	public static void main (String [] args) {
		
		//String str ="AA,BB,CC";
		//String str = "AA,BB,,CC";           // , , 로 공백을 넣었지만 Tokneizer 는 공백 무시
		String str = "AA,BB,CC,";             //
		
		
		StringTokenizer strTk = new StringTokenizer(str, ",");    //어떤것, 구분자를 써줌
		
//		while(strTk.hasMoreTokens()) {
//			System.out.println("값 : "+strTk.nextToken());
//		}
//		
		
		for(int i = 0 ;  strTk.hasMoreTokens() ; i++) {
			System.out.println((i+1) + "번째 값 : " + strTk.nextToken());
			
		}
		System.out.println("==================================");    //   split은 ,,사이의 공백도 출력함
		String [] strResult = str.split(",", 4);   //,를 기준으로 배열에 저장함  / ("," , 4) ,를기준으로 4개의 단어를 출력함 (split은 공백도 출력)
		for(int i = 0 ; i < strResult.length ; i ++) {        //for문으로 저장출력
			System.out.println((i+1) + "번째 값 : " + strResult[i]);
		}
		
		
		
		
	}
	
	
}
