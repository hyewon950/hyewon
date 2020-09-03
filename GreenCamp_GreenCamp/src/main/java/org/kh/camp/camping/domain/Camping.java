package org.kh.camp.camping.domain;

public class Camping {

	private int cNo;
	private String cName;
	private String cType;  //캠핑장구분
	private String cAddr;  //도로명주소
	private String cPhone;  //야영장 전화면호
	private int cParkSum;  //주차장면수
	private String cConUtil;  //편의시설
	private String cSafe; //안전시설
	private String cEtc; //기타시설
	private String cTime; //이용시간
	private String cCharge;  //이용요금
	private String cManageTel; //관리가관 전화번호
	private double longitude;   //경도
	private double latitude;    //위도
	private String clocal;  //지역구분명
	private int cRoomsSum;  //객실수
	private int cImg;  //이미지 경로
	private int cCount; //조회수
	private int cRecom; //추천수
	
	public Camping() {}

	public int getcNo() {
		return cNo;
	}

	public void setcNo(int cNo) {
		this.cNo = cNo;
	}

	public String getcName() {
		return cName;
	}

	public void setcName(String cName) {
		this.cName = cName;
	}

	public String getcType() {
		return cType;
	}

	public void setcType(String cType) {
		this.cType = cType;
	}

	public String getcAddr() {
		return cAddr;
	}

	public void setcAddr(String cAddr) {
		this.cAddr = cAddr;
	}

	public String getcPhone() {
		return cPhone;
	}

	public void setcPhone(String cPhone) {
		this.cPhone = cPhone;
	}

	public int getcParkSum() {
		return cParkSum;
	}

	public void setcParkSum(int cParkSum) {
		this.cParkSum = cParkSum;
	}

	public String getcConUtil() {
		return cConUtil;
	}

	public void setcConUtil(String cConUtil) {
		this.cConUtil = cConUtil;
	}

	public String getcSafe() {
		return cSafe;
	}

	public void setcSafe(String cSafe) {
		this.cSafe = cSafe;
	}

	public String getcEtc() {
		return cEtc;
	}

	public void setcEtc(String cEtc) {
		this.cEtc = cEtc;
	}

	public String getcTime() {
		return cTime;
	}

	public void setcTime(String cTime) {
		this.cTime = cTime;
	}

	public String getcCharge() {
		return cCharge;
	}

	public void setcCharge(String cCharge) {
		this.cCharge = cCharge;
	}

	public String getcManageTel() {
		return cManageTel;
	}

	public void setcManageTel(String cManageTel) {
		this.cManageTel = cManageTel;
	}

	public double getLongitude() {
		return longitude;
	}

	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}

	public double getLatitude() {
		return latitude;
	}

	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}

	public String getClocal() {
		return clocal;
	}

	public void setClocal(String clocal) {
		this.clocal = clocal;
	}

	public int getcRoomsSum() {
		return cRoomsSum;
	}

	public void setcRoomsSum(int cRoomsSum) {
		this.cRoomsSum = cRoomsSum;
	}

	public int getcImg() {
		return cImg;
	}

	public void setcImg(int cImg) {
		this.cImg = cImg;
	}

	public int getcCount() {
		return cCount;
	}

	public void setcCount(int cCount) {
		this.cCount = cCount;
	}

	public int getcRecom() {
		return cRecom;
	}

	public void setcRecom(int cRecom) {
		this.cRecom = cRecom;
	}

	public Camping(int cNo, String cName, String cType, String cAddr, String cPhone, int cParkSum, String cConUtil,
			String cSafe, String cEtc, String cTime, String cCharge, String cManageTel, double longitude,
			double latitude, String clocal, int cRoomsSum, int cImg, int cCount, int cRecom) {
		super();
		this.cNo = cNo;
		this.cName = cName;
		this.cType = cType;
		this.cAddr = cAddr;
		this.cPhone = cPhone;
		this.cParkSum = cParkSum;
		this.cConUtil = cConUtil;
		this.cSafe = cSafe;
		this.cEtc = cEtc;
		this.cTime = cTime;
		this.cCharge = cCharge;
		this.cManageTel = cManageTel;
		this.longitude = longitude;
		this.latitude = latitude;
		this.clocal = clocal;
		this.cRoomsSum = cRoomsSum;
		this.cImg = cImg;
		this.cCount = cCount;
		this.cRecom = cRecom;
	}

	@Override
	public String toString() {
		return "Camping [cNo=" + cNo + ", cName=" + cName + ", cType=" + cType + ", cAddr=" + cAddr + ", cPhone="
				+ cPhone + ", cParkSum=" + cParkSum + ", cConUtil=" + cConUtil + ", cSafe=" + cSafe + ", cEtc=" + cEtc
				+ ", cTime=" + cTime + ", cCharge=" + cCharge + ", cManageTel=" + cManageTel + ", longitude="
				+ longitude + ", latitude=" + latitude + ", clocal=" + clocal + ", cRoomsSum=" + cRoomsSum + ", cImg="
				+ cImg + ", cCount=" + cCount + ", cRecom=" + cRecom + "]";
	}

	
	
}