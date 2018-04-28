
var $unlikeBtn = $(".unlike_btn");
var likeNo; //like no
beLike($unlikeBtn);
	
    $unlikeBtn.click(function () {
    	//alert("hi");
    	var $this = $(this);
    	checkLike($this);
        
    });//click end
    
    
    
    ///like 상태
    function beLike($this) {
    	var type=$this.attr("data-type");
    	var typeNo=$this.attr("data-typeNo");
    	var userNo = $this.attr("data-userNo");
    	var LikeJson = {type:type, typeNo:typeNo, userNo: userNo};
    	$.ajax("/checkLike",{
    		data: LikeJson, 
    		dataType:"json",
    		type: "post",
    		error: function(xhr, error) {
			//	alert("checkLike");
			}, 
			success: function(json) {
				if(json.result){//like를 했을 경우 
				//	console.log($this);
				$this.addClass("like_btn");
				
				}else{//like를 안 했을 경우
					$this.removeClass("like_btn").addClass("unlike_btn");
				//	alert("라이크 유무"+json.result);
			
					
				}
			
			}
    	});//ajax end
		
	}//beLike() end 
    
    ///like 했는지 안했는 지 확인
    function checkLike($this) {
    	var type=$this.attr("data-type");
    	var typeNo=$this.attr("data-typeNo");
    	var userNo = $this.attr("data-userNo");
    	var LikeJson = {type:type, typeNo:typeNo, userNo: userNo};
    	
    	$.ajax("/checkLike",{
    		data: LikeJson, 
    		dataType:"json",
    		type: "post",
    		error: function(xhr, error) {
				alert("로그인 해주세요");
			}, 
			success: function(json) {
				if(!json.result){//like를 안했을 경우 
				//	console.log($this);
				$this.addClass("like_btn");
				doLike(type, typeNo, userNo);//like 함
				}else{//like를 했을 경우
					$this.removeClass("like_btn").addClass("unlike_btn");
				//	alert("라이크 유무"+json.result);
					getLikeNo(type, typeNo, userNo); // 라이크 번호
					
				}
			
			}
    	});//ajax end
		
	}//checkLike() end 
	
	
    
    //like 함
    function doLike(type, typeNo, userNo) {
    	var LikeJson = {type:type, typeNo:typeNo, userNo: userNo};
		$.ajax("/doLike",{
			data: LikeJson, 
			dataType:"json",
    		type: 'POST',
    		error: function(xhr, error) {
			//	alert("doLike error");
    			alert("doLike"+error);
			}, 
			success: function(data) {
				console.log(data);
				$(".like_num").text(data.likes);
			}
		});// ajax end
    	
	}//doLike() end
    
   
	
	function getLikeNo(type, typeNo, userNo) {
		var LikeJson = {type:type, typeNo:typeNo, userNo: userNo};
		$.ajax("/getLike",{
			data: LikeJson, 
    		dataType:"json",
    		type: "post",
    		error: function(xhr, error) {
				alert("getLike error");
			}, 
			success: function(data) {
				//alert("likeNo"+data.no);
				//alert("typeNo"+typeNo);
				
				cancelLike(data.no, LikeJson.typeNo);//라이크 취소
			}
			
		});//ajax end		
	}//getLikeNo end
    
	 //like 취소
    function cancelLike(no, typeNo) {
		$.ajax("/cancelLike",{
			data: {no:no, typeNo:typeNo}, 
    		dataType:"json",
    		type: "post",
    		error: function(xhr, error) {
				alert("cancelLike error");
			}, 
			success: function(data) {
				console.log(data);
				$(".like_num").text(data.likes);
			}
			
		});//ajax end
	}// cancelLike end