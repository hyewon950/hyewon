package org.kh.java.api;

public class TestWrapperClass {

	public static void main(String []args) {
		//�⺻ �ڷ����� ��üȭ ���ִ� Ŭ����!
		int num = 3;
		
		Integer num2 = new Integer(3);
		Double dNUM =new Double(1.1);
	    Long lNUM = new Long(2L);
		Float fNUM = new Float(2.2f);
		
		
		System.out.println("�⺻��  : " +num +"\n"
				              + "Wrapper Class: "+num2);
		
		System.out.println(num2.MAX_VALUE  + "\n" 
		                      + num2.MAX_VALUE);
		
		
//		public void print(Object obj) {
//			System.out.println(obj);
//		}
		//Wrapper Ŭ���� ����ȯ
		//����ڽ�(auto -boxing) : �⺻�� ->Wrapper
		Integer iNum=new Integer(3);
		Integer iNumm = 3;
		//�����ڽ�(auto - nuboxing) :Wrapper->�⺻��
		int n = iNum.intValue();
		int n2 = iNum;
		
		//String�� �⺻ �ڷ������� �ٲٱ�
		String strNum = "1";            //����Ǹ� ���ڷ� �����
		int i = Integer.parseInt(strNum); //parseint�� ���ڷ� ��ȯ���� ����Ҷ� ���

		short s = Short.parseShort("2");
		
		double d = Double.parseDouble("2.2");
		
		boolean b = Boolean.parseBoolean("true");    //boolean b = "true"��� �� �� ���� ���ڿ��� ����ϱ����� parseboolean ���� ���
		
		
		//�⺻�ڷ����� String���� �ٲٱ� ������ ���ڸ� ���ڷ�
		
		String strInt =3+ "";
		//String strInt ="3"';
		//Integer.valueOf(3).toString();
		
		
		
		
	}
}
