package org.kh.java.api;

import java.util.StringTokenizer;

public class TestStringTokenizer {
	public static void main (String [] args) {
		
		//String str ="AA,BB,CC";
		//String str = "AA,BB,,CC";           // , , �� ������ �־����� Tokneizer �� ���� ����
		String str = "AA,BB,CC,";             //
		
		
		StringTokenizer strTk = new StringTokenizer(str, ",");    //���, �����ڸ� ����
		
//		while(strTk.hasMoreTokens()) {
//			System.out.println("�� : "+strTk.nextToken());
//		}
//		
		
		for(int i = 0 ;  strTk.hasMoreTokens() ; i++) {
			System.out.println((i+1) + "��° �� : " + strTk.nextToken());
			
		}
		System.out.println("==================================");    //   split�� ,,������ ���鵵 �����
		String [] strResult = str.split(",", 4);   //,�� �������� �迭�� ������  / ("," , 4) ,���������� 4���� �ܾ ����� (split�� ���鵵 ���)
		for(int i = 0 ; i < strResult.length ; i ++) {        //for������ �������
			System.out.println((i+1) + "��° �� : " + strResult[i]);
		}
		
		
		
		
	}
	
	
}
