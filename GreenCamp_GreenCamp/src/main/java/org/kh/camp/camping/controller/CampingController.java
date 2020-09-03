package org.kh.camp.camping.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kh.camp.camping.common.Pagination;
import org.kh.camp.camping.domain.CampReview;
import org.kh.camp.camping.domain.Camping;
import org.kh.camp.camping.domain.PageInfo;
import org.kh.camp.camping.domain.Reservation;
import org.kh.camp.camping.service.CampingService;
import org.kh.camp.member.domain.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
@Controller
public class CampingController {

	@Autowired
	public CampingService cService;
	

	
	//캠핑장전체리스트를 보여주는 페이지
	@RequestMapping("campingList.do")
	public ModelAndView campList(ModelAndView mv ,@RequestParam(value="page",required=false)Integer page) {
		
		
		int currentPage= (page !=null) ? page:1;
		/*System.out.println("currentpage:"+currentPage);*/
		int listCount =cService.getListCount();
		PageInfo pi= Pagination.getPageInfo(currentPage, listCount);
		ArrayList<Camping> list=cService.selectCampingList(pi);
	/*	System.out.println("가져오는 객체:"+list.size());*/
		
		if(!list.isEmpty()) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.addObject("count", listCount);
			mv.setViewName("camping/campingList");
			
		}else {
			mv.addObject("msg", "게시글 전체조회 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	//캠핑장 상세페이지로 이동
	@RequestMapping("campingDetail.do")
	public ModelAndView campDetail(ModelAndView mv,int cNo,HttpSession session) {
		//@RequestParam("page")Integer page,
		Member loginUser =(Member)session.getAttribute("loginUser");

	//	int currentPage = (page != null) ? page : 1;

		cService.addCount(cNo);
		Camping camping =cService.selectCampingOne(cNo);
		
		if(camping !=null ) {
			mv.addObject("camping",camping)
		
		//	.addObject("currentPage", currentPage)
			.setViewName("camping/detailCampPage");
		}else {
			mv.addObject("msg","게시글 상세조회실패")
			.setViewName("common/errorPage");
		}
		
		return mv;
	}

	//캠핑 예약페이지로 넘어가는 메소드
	@RequestMapping("reservation.do")
	public ModelAndView reservation(ModelAndView mv,int cNo) {
		
		Camping camping =cService.selectCampingOne(cNo);
		
		if(camping !=null) {
			mv.addObject("camping",camping)
			.setViewName("camping/reservation");
		}else {
			mv.addObject("msg","게시글 상세조회실패")
			.setViewName("common/errorPage");
		}
		
		
		return mv;
	}
	
	
	//예약정보 받아와서 예약하는(insert) 메소드
	@RequestMapping(value="insertReservation.do")
	public ModelAndView insertReservation(ModelAndView mv,Reservation reservation) {
		
		int re=cService.insertReservation(reservation);
		//	System.out.println(reservation);

			//예약완료후에 상세페이지로 돌아가기위한 캠핑장 정보 메소드
		Camping camping =cService.selectCampingOne(reservation.getcNo());
		
		if(re>0) {
			mv.addObject("msg", "캠핑장 예약 완료.")
			.addObject("camping",camping)
			.setViewName("camping/detailCampPage");
		
		}else {
			mv.addObject("msg", "캠핑장 예약 실패!!.");
			
		}
		
		return mv;
	}
	
	//게시글 좋아요 숫자 올라가는 메소드
	@RequestMapping(value ="insertRecommend.do",  method = RequestMethod.GET)
	@ResponseBody
	public String likecampingdetailpage(int cNo){
		
		int result=cService.addLike(cNo);
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	//게시글에 좋아요버튼을 누를시에 좋아요 개수 올라는거 보여주는 메소드
	@RequestMapping("likecount.do")
	@ResponseBody
	public String getLikeCount(int cNo,HttpServletResponse response) {
		Camping camping =cService.selectCampingOne(cNo);
		int cRecommend=camping.getcRecom();
		
		return  cRecommend+"";
	}
	
	
	
//----------------댓글-------------------------
	
	
	//리뷰작성 추가하는 메소드
	@RequestMapping(value="insertrv.do")
	@ResponseBody
	public String insertReview(CampReview cr,HttpSession session,Reservation rs) {

	     Member loginUser =(Member)session.getAttribute("loginUser"); //로그인에서 userId받아옴
	     String mId = loginUser.getmId();   //저장함
	     
	     cr.setmId(mId);
	     
	     rs.setmId(mId);
		 rs.setcNo(cr.getcNo());
		 
	     int checkUser=cService.selectReservation(rs); //캠핑장 예약자이면 0 이상을  반환함
	     int sumReview=cService.sumReview(cr); //로그인한 유저의 한 캠핑장후기 댓글의 갯수를 반홤함
		/*
		 * System.out.println("한캠핑장당 예약건수:"+checkUser);
		 * System.out.println("댓글 리뷰 개수:"+sumReview); System.out.println("CR:"+cr);
		 */
	     
	     if(checkUser>0 && sumReview ==0) { //예약내역이 하나 이상이고   캠핑 리뷰를 작성하지않은 사람은 sumReview가 0임 
	 		
	 	    int result=cService.insertReview(cr);  //위 조건을 만족했을시에 INSERT가된다.
	 	    if(result>0) {
	 	    	System.out.println("댓글 추가 성공");
	 	    } return "success";
	     }else if( checkUser>0 && sumReview >0) {
	    	 System.out.println("댓글이 이미 있어요!");
	    	return "over";
	     }else {
	    	 return "fail";
	     }
	}
	
	//리뷰 불러오는 메소드
	@RequestMapping("campingRvList.do")
	public void selectRivewList(HttpServletResponse response, int cNo) throws JsonIOException, IOException{
 		
	//System.out.println(cNo);
		ArrayList<CampReview> commentList = cService.selectReivewList(cNo);
		
		for (CampReview cr : commentList) {
			cr.setRvContent(URLEncoder.encode(cr.getRvContent(), "utf-8"));
	
		//기존 JSONObject, JSONArray를 이용해서 JSON형태로 만들어줬음
		//여기선 Gson라이브러리를 사용하여 간단하게 만들고자함(pom.xml에 넣어줘야함)
		//reply 객체를 JSON형태로 변환해줘서 data로 보내줘야함 
		//{'bId' :1, 'bName':'제목'}이 형태가 json형태
		//	System.out.println(cr);
		}	
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(commentList, response.getWriter());
	// return new Gson().toJson(member) ->member객체일때 json형태로 member를 보내준다!이렇게 쓰면된당
	}
	
	//리뷰 수정 메소드
	@RequestMapping("updatecampreview.do")
	 @ResponseBody
	public String updatecampreview(CampReview cr,HttpSession session) {
		    Member loginUser =(Member)session.getAttribute("loginUser");
		      /* String mId = loginUser.getmId();
		       myCampComment.setmId(mId);*/
		    String mId = loginUser.getmId();
		     
		     cr.setmId(mId);
			
		    int result = cService.updateReview(cr);
		    System.out.println("리뷰수정컨트롤러 성공");
		       if(result >0) {
		       	return "success";
		       }else {
		       	return "fail";
		       }
			}
	
	//리뷰 삭제하는 메소드
	@RequestMapping("deleteCampReview.do")
	@ResponseBody
	public String deleteReview(CampReview cr) {
		
		int result=cService.deleteReview(cr);
		
		if(result>0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	
	//지도로 찾기 누르면 페이지로 넘어감
	@RequestMapping("campingSearchMap.do")
	public String selectsearchpage() {
		return "camping/resultSearchMap";
	}
	
	//지도를 클릭하면 지도의 도이름이 컨트롤러로 넘어옴
	@RequestMapping("resultregion.do")
	public ModelAndView resultSearchMap(Camping camping,ModelAndView mv) {
		
		
		ArrayList<Camping> ca =cService.searchMapRegion(camping); //검색어 넘겨줌
		int count =cService.countsearchMap(camping);
		String str=camping.getClocal();
		
		System.out.println(str);
	//	System.out.println(ca);
		
		if(!ca.isEmpty()) {
			mv.addObject("camping",ca)
			.addObject("str", str)
			.addObject("count",count)
			.setViewName("camping/searchMap");
			
		}else {
			mv.addObject("msg","게시글 상세조회실패")
			.setViewName("common/errorPage");
		}
		
		
		return mv;
		
	}
	
	//지도로 검색한 결과 더보기 버튼 ajax
	@RequestMapping("addsearchMapresult.do")
	@ResponseBody
	public void  addresultSearchMap(HttpServletResponse response,Camping camping) throws JsonIOException, IOException{
		
		ArrayList<Camping> ca =cService.searchMapRegion(camping); //검색어 넘겨줌
		String str=camping.getClocal();
		System.out.println("ajax컨트롤러"+str);
		
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(ca, response.getWriter());
		
    }
	
	//일반 검색 메소드
	@RequestMapping("searchcamping.do")
	public ModelAndView searchCamping(ModelAndView mv,String cName,String cAddr,String content,@RequestParam(value="page",required=false)Integer page) {
		
		Camping camp = new Camping();
	
/*		System.out.println("currentpage:"+currentPage);
		System.out.println("currentpage:"+cName+cAddr+content);*/
		
	//	ArrayList<Camping> list=cService.selectCampingList(pi);
		
		
		
		if(cAddr == "") {//cname으로 검색했을때
			//caddr이 비어있다면 cName으로 검색한것임
			camp.setcName(content);	
			int currentPage= (page !=null) ? page:1;
			int listCount =cService.getListCountSearchName(camp);
			
			PageInfo pi= Pagination.getPageInfo(currentPage, listCount);  //listcount에 개시글 갯수 가져옴
			
			System.out.println("게시글갯수:"+listCount);
			
			ArrayList<Camping> ca =cService.campingSearchName(camp,pi);
			
			System.out.println("결과:"+ca);
			
				if(!ca.isEmpty()) {
					mv.addObject("list", ca);
					mv.addObject("pi", pi);
					mv.addObject("count", listCount);
					mv.addObject("content",content);
					mv.addObject("cName",cName);
					mv.addObject("cAddr",cAddr);
					mv.setViewName("camping/searchResultPage");
					
				}else {
					mv.addObject("content",content);
					mv.setViewName("camping/searchFail");
				}
				
		}else {//addr로 검색했을때
			
			int currentPage= (page !=null) ? page:1;
			
			camp.setcAddr(content);
			
			int listCount =cService.getListCountSearchAddr(camp);
			
			PageInfo po= Pagination.getPageInfo(currentPage, listCount);  //listcount에 개시글 갯수 가져옴
			
			ArrayList<Camping> ca =cService.campingSearchAddr(camp,po);
			System.out.println("게시글갯수:"+listCount);
			
			
			System.out.println("결과:"+ca);
			
				
				if(!ca.isEmpty()) {
					mv.addObject("list", ca);
					mv.addObject("pi", po);
					mv.addObject("count", listCount);
					mv.addObject("content",content);
					mv.addObject("cName",cName);
					mv.addObject("cAddr",cAddr);
					mv.setViewName("camping/searchResultPage");
					
				}else {
					mv.addObject("content",content);
					mv.setViewName("camping/searchFail");
				}
				
		}
		
		return mv;
	}
	

	//메인메뉴에서 좋아요 조회수 높은 3개 캠핑장 나오는 메소드
	@RequestMapping(value = "campingq.do")
	public ModelAndView showMenu(ModelAndView mv) {
		
		ArrayList<Camping> ca=cService.showMenu();
			
				if(!ca.isEmpty()) {
					mv.addObject("camping", ca)
						.setViewName("common/GoGreenMain");
					
				}else {
				
				}
		return mv;
	}
	
	
	
	

	
	
	
	
}
	
	
	
	