function include_once(src) {
  // hole alle vorhandenen Script-Elemente
  var scripts = document.getElementsByTagName('script');
  if(scripts) {
    for(var k=0; k<scripts.length; k++) {
      // script schon geladen, abbrechen
      if(scripts[k].src == src) {
        return;
      }
    }
  }
  // script noch nicht geladen, binde es ein
  var script = document.createElement('script');
  script.src = src;
  script.type = 'text/javascript';
  (document.getElementsByTagName('HEAD')[0] || document.body).appendChild(script);
}

function function_exists(func_name) {
	  // discuss at: http://phpjs.org/functions/function_exists/
	  // original by: Kevin van Zonneveld (http://kevin.vanzonneveld.net)
	  // improved by: Steve Clay
	  // improved by: Legaev Andrey
	  // improved by: Brett Zamir (http://brett-zamir.me)
	  // example 1: function_exists('isFinite');
	  // returns 1: true

	  if (typeof func_name === 'string') 
	  {
	  	func_name = this.window[func_name];
	  }
	  return typeof func_name === 'function';
}



function init_tab(container_id)
{	
	var container =$('#'+container_id);
	$(".lable",container).each(function() {
	
		$(this).click(function() {
			var divn = $(this).attr("dis");
			$(".lable",container).each(function() {
				$(this).css("background-color", "#F0F0F0");
			});
			$(".labDiv",container).each(function() {
				$(this).hide();
			});
			$(this).css("background-color", "yellow");
			$("#" + divn).show();
		});
	});

}

function mypost(o)
{
//	$.Dialog.close()

	$(this).message("Wait");
//	$.blockUI({ message: '<h2><img src="./images/busy.gif" /> 處理中, 請稍侯...</h2>' });        		
	var data = (o.data)?o.data:$("#formPost").serialize();	
	$.ajax({
		type : 'POST', //GET or POST
		url : o.url, 						//請求的頁面
		cache : false,									//防止抓到快取的回應
		data : data, //要傳送到頁面的參數
		success :  function(data) {
				//$.unblockUI();
				o.onSuccess(data)
			}, 			
		error : function(data) {
			//$.unblockUI();
			alert("Error");
		}, //當請求失敗後此事件會被呼叫
		statusCode : { //狀態碼處理
			404 : function() {
				//$.unblockUI();
				alert ("page not found");        				
			}
		}
	});	 
}

//-------------------------

function call_user_func(cb) {
	  //  discuss at: http://phpjs.org/functions/call_user_func/
	  // original by: Brett Zamir (http://brett-zamir.me)
	  // improved by: Diplom@t (http://difane.com/)
	  // improved by: Brett Zamir (http://brett-zamir.me)
	  //   example 1: call_user_func('isNaN', 'a');
	  //   returns 1: true

	  var func;

	  if (typeof cb === 'string') {
	    func = (typeof this[cb] === 'function') ? this[cb] : func = (new Function(null, 'return ' + cb))();
	  } else if (Object.prototype.toString.call(cb) === '[object Array]') {
	    func = (typeof cb[0] === 'string') ? eval(cb[0] + "['" + cb[1] + "']") : func = cb[0][cb[1]];
	  } else if (typeof cb === 'function') {
	    func = cb;
	  }

	  if (typeof func !== 'function') {
	    throw new Error(func + ' is not a valid function');
	  }

	  var parameters = Array.prototype.slice.call(arguments, 1);
	  return (typeof cb[0] === 'string') ? func.apply(eval(cb[0]), parameters) : (typeof cb[0] !== 'object') ? func.apply(
	    null, parameters) : func.apply(cb[0], parameters);
	}




function bind_click(obj,domain,spec)
{
	
	$(obj,domain).click(function(){
		if($(obj,domain).prop("checked"))
		   {
		     $("input[name='"+spec+"']",domain).each(function() {
		         $(this).prop("checked", true);
		     });
		   }
		   else
		   {
		     $("input[name='"+spec+"']",domain).each(function() {
		         $(this).prop("checked", false);
		     });           
		   }
	});
	
}