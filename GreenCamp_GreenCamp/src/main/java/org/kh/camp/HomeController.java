package org.kh.camp;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import org.kh.camp.camping.domain.Camping;
import org.kh.camp.camping.service.CampingService;
import org.kh.camp.mycamp.domain.MyCamp;
import org.kh.camp.mycamp.domain.MyCampFile;
import org.kh.camp.mycamp.service.MyCampService;
import org.kh.camp.used.domain.UsedBoard;
import org.kh.camp.used.service.UsedBoardService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private CampingService cService;
	
	@Autowired
	private MyCampService mycService;
	
	@Autowired
	private UsedBoardService uBoardService;
	/**
	 * Simply selects the home view to render by returning its name.
	 */

	//메인으로 가기
		@RequestMapping(value = "home.do", method = RequestMethod.GET)
		public ModelAndView home(ModelAndView mv) {
			// HomeController는 메인페이지로 돌아가는 기능
			// 개인적으로 테스트하고 싶은 것이 있을 경우 사용		
			System.out.println("gkflgkfl홈 컨트롤러");
			
			//캠핑지 
			ArrayList<Camping> ca=cService.showMenu();
			System.out.println("ca : "+ca.toString());
			
			//나만의 캠핑 top3 만들기
			   ArrayList<MyCampFile> fileList = mycService.selectAllMyCampFile();
			   System.out.println("fileList : "+fileList.toString());
			   ArrayList<MyCamp> topList = mycService.selectTopMyCamp();
			   System.out.println("topList : "+topList.toString());
			   
			 //중고top3
			   ArrayList<UsedBoard> uMList = uBoardService.selectUsedMainList();
			   
			   if ( !topList.isEmpty()) {
				   mv.addObject("uMList", uMList);
			    	  mv.addObject("camping", ca);
			    	  mv.addObject("topList", topList);
				      mv.addObject("fileList", fileList);
			         mv.setViewName("common/GoGreenMain");
			      }else if(!ca.isEmpty()) {
			    	  mv.addObject("uMList", uMList);
			    	  mv.addObject("camping", ca);
			    	  mv.addObject("topList", topList);
				      mv.addObject("fileList", fileList);
			    	  mv.setViewName("common/GoGreenMain");
			      }else if(!uMList.isEmpty()) {
			    	  mv.addObject("uMList", uMList);
			    	  mv.addObject("camping", ca);
			    	  mv.addObject("topList", topList);
				      mv.addObject("fileList", fileList);
			    	  mv.setViewName("common/GoGreenMain");
			      }
			
			return mv;
		}
		
		
}

			

