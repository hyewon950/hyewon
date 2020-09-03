<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>카트확인 메세지 페이지</title>
</head>
<body>
 	<script>
 	
/*  		alert("${msg}");
		location.href="${loc}"; */
	

	

				var result = confirm("${msg}");
		 		if(result){
		 			location.replace("/orderListSelect");
		 		}else{
		 			
		 		}
	
/* 				if(result){
					return true;
				}else{
					return false;
				}
			} */

	
	
	
	</script>
 	
 
 
</body>
</html>