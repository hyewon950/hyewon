package com.kh.spring.common.aop;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {

	@Autowired
	TestServiceImpl tService;
	
	@RequestMapping("test.kh")
	public String testMethod1() {
		boolean tf= tService.testMethod1();
		return"redirect:home.kh";
	}
	
}
