$(document).ready(function() {
		
	window.delete_alert = function(){
		alert("Are you sure want to delete!");
	}

	window.review_star = function(star_id){
		$("#stars_id").val(star_id)
		$("#review_star_1").css("color", "#f5bb1b");
			$("#review_star_2").css("color", "black");
			$("#review_star_3").css("color", "black");
			$("#review_star_4").css("color", "black");
			$("#review_star_5").css("color", "black");
		if(star_id == 1){
			$("#review_star_1").css("color", "#f5bb1b");
			$("#review_star_2").css("color", "black");
			$("#review_star_3").css("color", "black");
			$("#review_star_4").css("color", "black");
			$("#review_star_5").css("color", "black");
		}else if (star_id == 2){
			$("#review_star_1").css("color", "#f5bb1b");
			$("#review_star_2").css("color", "#f5bb1b");
			$("#review_star_3").css("color", "black");
			$("#review_star_4").css("color", "black");
			$("#review_star_5").css("color", "black");
		}else if(star_id == 3){
			$("#review_star_1").css("color", "#f5bb1b");
			$("#review_star_2").css("color", "#f5bb1b");
			$("#review_star_3").css("color", "#f5bb1b");
			$("#review_star_4").css("color", "black");
			$("#review_star_5").css("color", "black");
		}else if(star_id == 4)
		{
			$("#review_star_1").css("color", "#f5bb1b");
			$("#review_star_2").css("color", "#f5bb1b");
			$("#review_star_3").css("color", "#f5bb1b");
			$("#review_star_4").css("color", "#f5bb1b");
			$("#review_star_5").css("color", "black");

		}else if (star_id == 5){
			$("#review_star_1").css("color", "#f5bb1b");
			$("#review_star_2").css("color", "#f5bb1b");
			$("#review_star_3").css("color", "#f5bb1b");
			$("#review_star_4").css("color", "#f5bb1b");
			$("#review_star_5").css("color", "#f5bb1b");
		}
	}
	
});