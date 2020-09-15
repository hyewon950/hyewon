package org.kh.java.api;

public class TestWrapperClass {

	public static void main(String []args) {
		//기본 자료형을 객체화 해주는 클래스!
		int num = 3;
		
		Integer num2 = new Integer(3);
		Double dNUM =new Double(1.1);
	    Long lNUM = new Long(2L);
		Float fNUM = new Float(2.2f);
		
		
		System.out.println("기본형  : " +num +"\n"
				              + "Wrapper Class: "+num2);
		
		System.out.println(num2.MAX_VALUE  + "\n" 
		                      + num2.MAX_VALUE);
		
		
//		public void print(Object obj) {
//			System.out.println(obj);
//		}
		//Wrapper 클래스 형변환
		//오토박싱(auto -boxing) : 기본형 ->Wrapper
		Integer iNum=new Integer(3);
		Integer iNumm = 3;
		//오토언박싱(auto - nuboxing) :Wrapper->기본형
		int n = iNum.intValue();
		int n2 = iNum;
		
		//String을 기본 자료형으로 바꾸기
		String strNum = "1";            //저장되면 문자로 저장됨
		int i = Integer.parseInt(strNum); //parseint로 숫자로 변환시켜 계산할때 사용

		short s = Short.parseShort("2");
		
		double d = Double.parseDouble("2.2");
		
		boolean b = Boolean.parseBoolean("true");    //boolean b = "true"라고 쓸 수 없음 문자열을 사용하기위해 parseboolean 으로 사용
		
		
		//기본자료형을 String으로 바꾸기 보내는 숫자를 문자로
		
		String strInt =3+ "";
		//String strInt ="3"';
		//Integer.valueOf(3).toString();
		
		
		
		
	}
}
