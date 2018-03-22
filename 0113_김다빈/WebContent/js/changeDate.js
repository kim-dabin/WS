//alert(lastDate);//test 김다빈
//해당하는 월의 date 생성 
	function changeDate() {
		var $date = $("#date");
		var year= $("#year").val();//유저가 선택한 생일 년
		var month=$("#month").val();//유저가 선택한 생일 월 
		var date = $date.val();//입력된 date
		var lastDate = moment(new Date(year,month,0)).date();//선택한 년,월일의 마지막 날짜
		var txt="<option value="+i+">"+i+"</option>";
		//마지막 날짜에 맞춰서 date 생성
		//alert(date);
		$date.empty();//date 지우기
		for(var i=1; i<=lastDate; i++){
			//if(date==i){
			//	 txt="<option selected value="+i+">"+i+"</option>";
			//}
			$date.append("<option value="+i+">"+i+"</option>");//date
			console.log(lastDate);
		}	
	}

	//년,월 이벤트 발생
	$("#year,#month").change(function() {
		changeDate();//date 생성
		$date.empty();//date 지우기
	});