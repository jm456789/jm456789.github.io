$(document).ready(function () {
    
    /* datepicker */
    $(".datepicker").datepicker({
    	format: 'yy-mm-dd',
        language : "kr", // 언어(js 추가가 필요하다.)
        prevText: '이전 달',
        nextText: '다음 달',
        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        dayNames: ['일','월','화','수','목','금','토'],
        dayNamesShort: ['일','월','화','수','목','금','토'],
        dayNamesMin: ['일','월','화','수','목','금','토'],
        showMonthAfterYear: true,
        changeMonth: true,
        changeYear: true,
    });
    
    /* popup
	$( ".layer_wrap" ).draggable({ cancel: ".layer_cont" });
	$(".layer_popup").hide();
	$(document).on("click", ".layer_btn", function(){
		$('html, body').css({'overflow': 'hidden', 'height': '100%'});
		var el = $(this);
		var layer_name = $(this).data('layer_name')
		$("."+ layer_name +"").show();
		$(".layer_wrap").attr("tabindex", "0").focus().css('outline','0');
		el.attr('data-focus','on');
		var pop_height = $("."+ layer_name +" .layer_wrap").outerHeight();
		var pop_width = $("."+ layer_name +" .layer_wrap").outerWidth();
		$("."+ layer_name +" .layer_wrap").css('margin-top','-'+ pop_height/2 +'px').css('margin-left','-'+pop_width/2+'px');
		return false;
	});
	 */

    /* popup close
	$(document).on("click", ".layer_close", function(){
		var layer_count = $('.layer_popup:visible').length;
		if (layer_count >= 2){
			$(this).closest(".layer_popup").hide();
			$(this).closest(".layer_wrap ").removeAttr("style");
			$("a[data-focus~=on]").focus();
			$("button[data-focus~=on]").focus();
			window.setTimeout(function(){
				$("a[data-focus~=on]").removeAttr("data-focus");
				$("button[data-focus~=on]").removeAttr("data-focus");
			},500);
			return false;
		}
		$('html, body').css({'overflow': 'auto', 'height': 'auto'});
		$(".layer_overlay").hide();
		$(".layer_popup").hide();
		$(".layer_wrap ").removeAttr("style");
		$("a[data-focus~=on]").focus();
		$("button[data-focus~=on]").focus();
		window.setTimeout(function(){
			$("a[data-focus~=on]").removeAttr("data-focus");
			$("button[data-focus~=on]").removeAttr("data-focus");
		},500);
		return false;
	});
	 */
    
});

