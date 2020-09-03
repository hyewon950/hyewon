<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<script>
var data = {
     serviceKey: 'UTF-8로 인코딩된 인증키',
     s_page: 0,
     s_list: 1,
     type: 'json'
     instt_nm: 'UTF-8로 인코딩된 value'
};

$.ajax({
     post: 'get',
     url: 'http://api.data.go.kr/openapi/tn_pubr_public_campg_api',
     data: data,
     dataType: 'jsonp',
     success: function(data){
          console.log(data);
     }
});

</script>


		<script>
		var xhr = new XMLHttpRequest();
		var url = 'http://api.data.go.kr/openapi/tn_pubr_public_campg_api'; /*URL*/
		var queryParams = '?' + encodeURIComponent('ServiceKey') + '='+'H%2B2tfmOKzyM6dMEUZQFvaj42sQJOoqlxSG5zlb00F%2BMReMmOJt9FUpnRbOuPR8Kn2kNvgr8Qhg%2F%2BepA9iSZNfg%3D%3D'; /*Service Key*/
		queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('0'); /**/
		queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('100'); /**/
		queryParams += '&' + encodeURIComponent('type') + '=' + encodeURIComponent('xml'); /**/
		queryParams += '&' + encodeURIComponent('adminNo') + '=' + encodeURIComponent(''); /**/
		queryParams += '&' + encodeURIComponent('perDate') + '=' + encodeURIComponent(''); /**/
		queryParams += '&' + encodeURIComponent('perCancleDate') + '=' + encodeURIComponent(''); /**/
		queryParams += '&' + encodeURIComponent('businessStCd') + '=' + encodeURIComponent(''); /**/
		queryParams += '&' + encodeURIComponent('closedDate') + '=' + encodeURIComponent(''); /**/
		queryParams += '&' + encodeURIComponent('tmpClosedDate') + '=' + encodeURIComponent(''); /**/
		queryParams += '&' + encodeURIComponent('reopeningDate') + '=' + encodeURIComponent(''); /**/
		queryParams += '&' + encodeURIComponent('campgNm') + '=' + encodeURIComponent(''); /**/
		queryParams += '&' + encodeURIComponent('campgSe') + '=' + encodeURIComponent(''); /**/
		queryParams += '&' + encodeURIComponent('latitude') + '=' + encodeURIComponent(''); /**/
		queryParams += '&' + encodeURIComponent('longitude') + '=' + encodeURIComponent(''); /**/
		queryParams += '&' + encodeURIComponent('rdnmadr') + '=' + encodeURIComponent(''); /**/
		queryParams += '&' + encodeURIComponent('lnmadr') + '=' + encodeURIComponent(''); /**/
		queryParams += '&' + encodeURIComponent('officePhoneNumber') + '=' + encodeURIComponent(''); /**/
		queryParams += '&' + encodeURIComponent('campgUnitSpce') + '=' + encodeURIComponent(''); /**/
		queryParams += '&' + encodeURIComponent('plotAr') + '=' + encodeURIComponent(''); /**/
		queryParams += '&' + encodeURIComponent('bildngTotar') + '=' + encodeURIComponent(''); /**/
		queryParams += '&' + encodeURIComponent('facilityAr') + '=' + encodeURIComponent(''); /**/
		queryParams += '&' + encodeURIComponent('culSpoNm') + '=' + encodeURIComponent(''); /**/
		queryParams += '&' + encodeURIComponent('culSeNm') + '=' + encodeURIComponent(''); /**/
		queryParams += '&' + encodeURIComponent('localSeNm') + '=' + encodeURIComponent(''); /**/
		queryParams += '&' + encodeURIComponent('totalFloor') + '=' + encodeURIComponent(''); /**/
		queryParams += '&' + encodeURIComponent('environmentNm') + '=' + encodeURIComponent(''); /**/
		queryParams += '&' + encodeURIComponent('insuAgNm') + '=' + encodeURIComponent(''); /**/
		queryParams += '&' + encodeURIComponent('bildngPurNm') + '=' + encodeURIComponent(''); /**/
		queryParams += '&' + encodeURIComponent('uperFloor') + '=' + encodeURIComponent(''); /**/
		queryParams += '&' + encodeURIComponent('underFloor') + '=' + encodeURIComponent(''); /**/
		queryParams += '&' + encodeURIComponent('totalRooms') + '=' + encodeURIComponent(''); /**/
		queryParams += '&' + encodeURIComponent('insuStDate') + '=' + encodeURIComponent(''); /**/
		queryParams += '&' + encodeURIComponent('insuEndDate') + '=' + encodeURIComponent(''); /**/
		queryParams += '&' + encodeURIComponent('dayAcmdCo') + '=' + encodeURIComponent(''); /**/
		queryParams += '&' + encodeURIComponent('prkplceCo') + '=' + encodeURIComponent(''); /**/
		queryParams += '&' + encodeURIComponent('cvntl') + '=' + encodeURIComponent(''); /**/
		queryParams += '&' + encodeURIComponent('safentl') + '=' + encodeURIComponent(''); /**/
		queryParams += '&' + encodeURIComponent('etcty') + '=' + encodeURIComponent(''); /**/
		queryParams += '&' + encodeURIComponent('useTime') + '=' + encodeURIComponent(''); /**/
		queryParams += '&' + encodeURIComponent('useCharge') + '=' + encodeURIComponent(''); /**/
		queryParams += '&' + encodeURIComponent('phoneNumber') + '=' + encodeURIComponent(''); /**/
		queryParams += '&' + encodeURIComponent('institutionNm') + '=' + encodeURIComponent(''); /**/
		queryParams += '&' + encodeURIComponent('referenceDate') + '=' + encodeURIComponent(''); /**/
		queryParams += '&' + encodeURIComponent('instt_code') + '=' + encodeURIComponent(''); /**/
		queryParams += '&' + encodeURIComponent('instt_nm') + '=' + encodeURIComponent(''); /**/
		xhr.open('GET', url + queryParams);
		
		xhr.onreadystatechange = function () {
		    if (this.readyState == 4) {
		        alert('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
		    }
		};
		
		xhr.send('');
		
		</script>

</body>
</html>