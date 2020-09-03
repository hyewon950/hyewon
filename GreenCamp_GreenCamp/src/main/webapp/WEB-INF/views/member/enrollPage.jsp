<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>회원가입</title>

    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrapcss">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="http://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>

    <!--    input날짜선택    -->
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

    <link rel="stylesheet" href="../../../resources/css/member/enrollPageCss.css" />
</head>

<body>

<!--  네비바들어가는 부분-->
 <jsp:include page="../common/menuBar.jsp"></jsp:include>
<!-- 네비 끝 -->


     <div class="wrapper fadeInDown">
        <div id="formContent">
            <!-- Tabs Titles -->
            <b>회원가입</b>
            <hr>
            <!-- Login Form -->
            <!-- <form action="mInsert.do" method="post" id="form"> -->
            <form action="emailEnroll.do" method="post" id="form">
            
                <label for="mId">아이디 </label>
                <input type="text" id="mId" class="fadeIn first" name="mId" placeholder="아이디는 소문자, 숫자만 가능하고 4~12글자 입력바랍니다." data-toggle="tooltip" data-placement="bottom" title="아이디는 소문자, 숫자만 가능하고 4~12글자 입력바랍니다.">
                <br><label id="idChcekArea"></label><!-- 중복체크 --> <br>

                <label for="mPwd">비밀번호 </label>
                <input type="password" id="mPwd" class="fadeIn second" name="mPwd" placeholder="비밀번호는 소문자,대문자,숫자 중 4글자이상으로 입력 바랍니다." data-toggle="tooltip" data-placement="bottom" title="비밀번호는 소문자,대문자,숫자 중 4글자이상으로 입력 바랍니다.">
                <br><br>

                <label for="mPwdre">비밀번호 확인 </label>
                <input type="password" id="mPwdre" class="fadeIn third" name="mPwdre" placeholder="비밀번호 확인" data-toggle="tooltip" data-placement="bottom" title="비밀번호는 소문자,대문자,숫자 중 4글자이상으로 입력 바랍니다.">
                <br><br>

                <label for="mName">이름 </label>
                <input type="text" id="mName" class="fadeIn fourth" name="mName" placeholder="이름은 한글(최소1글자)만 가능합니다." data-toggle="tooltip" data-placement="bottom" title="이름은 한글(최소1글자)만 가능합니다.">
                <br><br>

                <label for="startDate">생년월일 </label>
                <input type="text" id="startDate" class="fadeIn fifth" name="mBirthday" placeholder="생년월일을 선택해주세요." data-toggle="tooltip" data-placement="bottom" title="클릭해주세요">


                <br><br>
                <label for="mEmail">이메일 </label>
                <input type="email" id="mEmail" class="fadeIn sixth" name="mEmail" placeholder="이메일를 입력해주세요(ex.user@naver.com)" data-toggle="tooltip" data-placement="bottom" title="이메일를 입력해주세요(ex.user@naver.com)">
                <br><br>

                <br><br>
                <label for="mPhone">전화번호 </label>
                <input type="text" id="mPhone" class="fadeIn seventh" name="mPhone" placeholder="폰번호를 입력해주세요(ex.010-1234-5678)" data-toggle="tooltip" data-placement="bottom" title="폰번호를 입력해주세요(ex.010-1234-5678)" maxlength="13">
                <br><br>
                <!-- <br><a style="color: red"><label id="pHoneChcekArea"></label></a>중복체크 -->

                <input type="button" class="fadeIn eight" value="회원가입" onclick="check();" name="submitBtn">
                <input type="reset" class="fadeIn eight" value="취소">
            </form>

            <!-- Remind Passowrd -->
            <div id="formFooter">
                <a class="underlineHover" href="findID.jsp">ID를 잊으셨나요?</a>
            </div>

        </div>
    </div>

    <script>
    //유효성검사
		$('.btn.danger').button('toggle').addClass('fat')
		function check() {
			if (!(/^[a-z][a-z0-9_-]{3,11}$/.test($("#mId").val()))) {
				alert("아이디는 소문자, 숫자만 가능하고 4~12글자 입력바랍니다.");

			} else if (!(/^[a-zA-Z0-9]{4,}$/.test($("#mPwd").val()))) {
				alert("비밀번호는 소문자,대문자,숫자 중 4글자이상으로 입력 바랍니다.");

			} else if (!($("#mPwd").val() == $("#mPwdre").val())) {
				alert("비밀번호와 비밀번호 확인 값은 같아야 합니다.");

			} else if (!(/[가-힣]+$/.test($("#mName").val()))) {
				alert("이름은 한글(최소1글자)만 가능합니다.");

			}  else if (!(/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/.test($("#mEmail").val()))) {
				alert("이메일을 입력해주세요");

			} else if (!(/^010-[0-9]{3,4}-[0-9]{4}$/.test($("#mPhone").val()))) {
				alert("폰번호를 재확인 해주세요");
	
			} else {
				var result = confirm("가입하시겠습니까");
				if (result == true) {
					$("#form").submit();
				} else {
					alert("가입을 취소하셨습니다.");
				}

			}
		}
	</script>

	<script>
		
		// 아이디 중복 검사(ajax)
		$("#mId").keyup(function() {
			
			var mId = $(this).val().trim();
			
		$.ajax({
			url : "dupid.do",
			data : {mId : mId},
			success:function(result){
				if(result == "true"){
					$("#idChcekArea").text("사용 가능한 아이디 입니다.");
					$("#idChcekArea").css("color","green");
				}else{
					$("#idChcekArea").text("이미 있는 아이디입니다.");
					$("#idChcekArea").css("color","red");
				}
				
			}
		});
		
		});
		

		/*달력생성*/
		$(function() {
			$("#startDate").datepicker(
					{

						//버튼생성
						/*showOn: "both",
						buttonText: "달력",*/
						//월선택
						changeMonth : true,
						dayNames : [ '일요일', '월요일', '화요일', '수요일', '목요일', '금요일',
								'토요일' ],
						dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
						monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
								'7월', '8월', '9월', '10월', '11월', '12월' ],
						monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월',
								'7월', '8월', '9월', '10월', '11월', '12월' ],

						//년선택
						changeYear : true,
						yearRange : "100",
						//<,>으로 이전 다음 달로 넘어가기
						nextText : '다음 달',
						prevText : '이전 달',

						//최소,최대날짜 선택 범위 D(날짜), M(달),Y(년)
						minDate : "-100Y",
						maxDate : "-1D",
						//표시할 날짜 형식 바꿈
						dateFormat : "yy.mm.dd",
						closeText : "닫기"
					});
		});
	</script>

</body>

</html>
