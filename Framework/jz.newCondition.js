(function($) {
	$.newCondition = function(t, p) {
		var p = $.extend({
			method : 'POST',
			url : '',
			caseNew : '',
			loadServer : '',
			delServer : '',
			param : '',
			dataType : 'json',
			autoload : true,
			isEdit : true,
			unit : '%',
			dataStr : 'usb2list'
		}, p);
		var ordobj = $("<input type=\"hidden\" id=\"lastorder\" class=\"notsubmit\" value=\"A\"/>");
		var html = $("<div class=\"divheader\"><div><div style=\"display: inline-block;\"><input type=\"hidden\" name=\"order\"/><input type=\"hidden\" name=\"key\"/>"
				+ "<select name=\"conditionType\"><option value=\"0\">態樣一</option><option value=\"1\">態樣二</option><option value=\"2\">態樣三</option><option value=\"3\">態樣四</option></select></div>"
				+ "<div style=\"display: inline-block;float: right;\"><div class=\"addRow\"></div><div class=\"delRow\"></div></div><div class=\"taiyang\"></div></div>");

		var div1 = "<div class=\"div1\"><input type=\"hidden\" name=\"condition1.key\"/><div class=\"divinline\">條件</div><div class=\"divinline\">"
				+ "<select name=\"condition1.conditionType\"><option value=\"0\">>=</option><option value=\"1\">></option><option value=\"2\">=</option><option value=\"3\"><=</option><option value=\"4\"><</option><select>"
				+ "</div><div class=\"divinline\"><input type=\"text\" name=\"condition1.completeRate\" /></div><div class=\"divinline\"><div class=\"unit\">" + p.unit + "</div></div></div>"
				+ "<div class=\"div2\"><div class=\"divinline\">得分</div><div class=\"divinline\"><input type=\"text\" name=\"condition1.score\" /></div></div>";

		var div2 = "<div class=\"div1\"><input type=\"hidden\" name=\"condition2.key\"/><div class=\"divtitle\">條件</div><div class=\"divinline\">遞增<input type=\"hidden\" name=\"condition2.conditonType\" value=\"0\"/></div></div><div class=\"div2\"><div class=\"divtitle\">得分</div></div>"
				+ "<div class=\"div2\"><div class=\"divtitle\">比較基準：</div><div class=\"divinline\"><input type=\"text\" class=\"contxt\" name=\"condition2.downLimit\"/>~<input type=\"text\" class=\"contxt\" name=\"condition2.topLimit\"/><div class=\"unit\">"
				+ p.unit
				+ "</div></div></div>"
				+ "<div class=\"div2\"><div class=\"divtitle\">分數基準：</div><div class=\"divinline\"><input type=\"text\" name=\"condition2.referenceScore\"/></div></div>"
				+ "<div class=\"div2\"><div class=\"divtitle\">每增加&nbsp;</div><div class=\"divinline\"><input type=\"text\" name=\"condition2.increaseOrDecreasePercent\"/><div class=\"unit\">"
				+ p.unit
				+ "</div></div></div>"
				+ "<div class=\"div2\"><div class=\"divtitle\"><select name=\"condition2.increasementOrDecrease\"><option value=\"0\">增加</option><option value=\"1\">減少</option></select></div><div class=\"divinline\"><input type=\"text\" name=\"condition2.score\"/>分</div></div>";

		var div3 = "<div class=\"div1\"><input type=\"hidden\" name=\"condition2.key\"/><div class=\"divtitle\">條件</div><div class=\"divinline\">遞減<input type=\"hidden\" name=\"condition2.conditonType\" value=\"1\"/></div></div><div class=\"div2\"><div class=\"divtitle\">得分</div></div>"
				+ "<div class=\"div2\"><div class=\"divtitle\">比較基準：</div><div class=\"divinline\"><input type=\"text\" class=\"contxt\" name=\"condition2.downLimit\"/>~<input type=\"text\" class=\"contxt\" name=\"condition2.topLimit\"/><div class=\"unit\">"
				+ p.unit
				+ "</div></div></div>"
				+ "<div class=\"div2\"><div class=\"divtitle\">分數基準：</div><div class=\"divinline\"><input type=\"text\" name=\"condition2.referenceScore\"/></div></div>"
				+ "<div class=\"div2\"><div class=\"divtitle\">每減少&nbsp;</div><div class=\"divinline\"><input type=\"text\" name=\"condition2.increaseOrDecreasePercent\"/>%</div></div>"
				+ "<div class=\"div2\"><div class=\"divtitle\"><select name=\"condition2.increasementOrDecrease\"><option value=\"0\">增加</option><option value=\"1\">減少</option></select></div><div class=\"divinline\"><input type=\"text\" name=\"condition2.score\"/>分</div></div>";

		var div4 = "<div class=\"div1\"><input type=\"hidden\" name=\"condition3.key\"/><div class=\"divinline\">條件</div><div class=\"divinline\">區間</div><div class=\"divinline\"><input type=\"text\" name=\"condition3.bottomLimit\"/>~<input type=\"text\" name=\"condition3.topLimit\"/><div class=\"unit\">"
				+ p.unit + "</div></div></div>" + "<div class=\"div2\"><div class=\"divinline\">得分</div><div class=\"divinline\"><input type=\"text\" name=\"condition3.score\"/></div></div>";
		$(t).append(ordobj);

		var g = {
			populate : function() {
				$.ajax({
					type : p.method,
					url : p.url + p.loadServer,
					data : p.param,
					dataType : p.dataType,
					success : function(data) {
						g.addData(data);
					},
					error : function(data) {
						try {
							if (p.onError)
								p.onError(data);
						} catch (e) {
						}
					}
				});
			},
			addData : function(data) { // parse data
				if (data[p.dataStr].length > 0) {
					$(t).html("");
					$.each(data[p.dataStr], function(x, y) {
						var order = $(ordobj).val() + "A";
						$(ordobj).val(order);
						var newHtml = $(html).clone(true);
						$(newHtml).find("input[name=order]").val(order);
						$(newHtml).find(".taiyang").html(div1);
						$(newHtml).find(".delRow").show();
						$(newHtml).find(".addRow").hide();
						$(newHtml).find("input[name='key']").val(y.key);
						$(newHtml).find("input[name='order']").val(y.order);
						$(newHtml).find("select[name='conditionType']").val(y.conditionType);
						switch (y.conditionType) {
						case 0: {
							$(newHtml).find("input[name='condition1.key']").val(y.condition1.key);
							$(newHtml).find("select[name='condition1.conditionType']").val(y.condition1.conditionType);
							$(newHtml).find("input[name='condition1.completeRate']").val(y.condition1.completeRate);
							$(newHtml).find("input[name='condition1.score']").val(y.condition1.score);
							break;
						}
						case 1: {
							$(newHtml).find(".taiyang").html(div2);
							$(newHtml).find("input[name='condition2.key']").val(y.condition2.key);
							$(newHtml).find("input[name='condition2.conditonType']").val(y.condition2.conditonType);
							$(newHtml).find("input[name='condition2.downLimit']").val(y.condition2.downLimit);
							$(newHtml).find("input[name='condition2.topLimit']").val(y.condition2.topLimit);
							$(newHtml).find("input[name='condition2.increaseOrDecreasePercent']").val(y.condition2.increaseOrDecreasePercent);
							$(newHtml).find("select[name='condition2.increasementOrDecrease']").val(y.condition2.increasementOrDecrease);
							$(newHtml).find("input[name='condition2.referenceScore']").val(y.condition2.referenceScore);
							$(newHtml).find("input[name='condition2.score']").val(y.condition2.score);
							break;
						}
						case 2: {
							$(newHtml).find(".taiyang").html(div3);
							$(newHtml).find("input[name='condition2.key']").val(y.condition2.key);
							$(newHtml).find("input[name='condition2.conditonType']").val(y.condition2.conditonType);
							$(newHtml).find("input[name='condition2.downLimit']").val(y.condition2.downLimit);
							$(newHtml).find("input[name='condition2.topLimit']").val(y.condition2.topLimit);
							$(newHtml).find("input[name='condition2.increaseOrDecreasePercent']").val(y.condition2.increaseOrDecreasePercent);
							$(newHtml).find("select[name='condition2.increasementOrDecrease']").val(y.condition2.increasementOrDecrease);
							$(newHtml).find("input[name='condition2.referenceScore']").val(y.condition2.referenceScore);
							$(newHtml).find("input[name='condition2.score']").val(y.condition2.score);
							break;
						}
						case 3: {
							$(newHtml).find(".taiyang").html(div4);
							$(newHtml).find("input[name='condition3.key']").val(y.condition3.key);
							$(newHtml).find("input[name='condition3.bottomLimit']").val(y.condition3.bottomLimit);
							$(newHtml).find("input[name='condition3.topLimit']").val(y.condition3.topLimit);
							$(newHtml).find("input[name='condition3.score']").val(y.condition3.score);
							break;
						}
						}
						if (p.isEdit) {
							g.initEvent(newHtml);
						} else {
							g.hideEdit(newHtml);
						}
						$(t).append(newHtml);
					});
					var last = $(t).find(".taiyang:last").parent();
					$(".delRow", last).hide();
					$(".addRow", last).show();
				} else {
					g.initData(html);
				}
			},
			delData : function(key) {
				var param = "&" + p.caseNew + '.key=' + key;
				$.ajax({
					type : p.method,
					url : p.url + p.delServer,
					data : param,
					dataType : p.dataType,
					success : function(data) {
						$().message("成功刪除"); // 提示資訊 ;
					},
					error : function(data) {
						try {
							if (p.onError)
								p.onError(data);
						} catch (e) {
						}
					}
				});
			},
			initData : function(obj) {
				$(obj).find(".taiyang").html(div1);
				$(obj).find(".delRow").hide();
				$(obj).find("input[name=order]").val($(ordobj).val());
				if (p.isEdit) {
					g.initEvent(obj);
				} else {
					g.hideEdit(obj);
				}
				$(t).append(obj);
			},
			initEvent : function(obj) {
				$(obj).find(".delRow").bind('click', function() {
					var key = $(obj).find("input[name='key']").val();
					if (key != '')
						g.delData(key);
					$(this).parent().parent().parent().remove();
				});

				$(obj).find(".addRow").click(function() {
					var order = $(ordobj).val() + "A";
					$(ordobj).val(order);
					var newHtml = $(this).parent().parent().parent().clone(true);
					$("input", newHtml).each(function() {
						$(this).val("");
					});
					$(newHtml).find("input[name=order]").val(order);
					$(newHtml).find(".taiyang").html(div1);
					$(t).append(newHtml);
					// $(newHtml).parent().find(".delRow").hide();
					$(this).parent().find(".delRow").show();
					$(this).hide();
				});
				$(obj).find("select").bind('change', function() {
					var n = $(this).val();
					switch (n) {
					case "0":
						$(this).parent().parent().find(".taiyang").html(div1);
						break;
					case "1":
						$(this).parent().parent().find(".taiyang").html(div2);
						break;
					case "2":
						$(this).parent().parent().find(".taiyang").html(div3);
						break;
					case "3":
						$(this).parent().parent().find(".taiyang").html(div4);
						break;
					}

				});

			},
			hideEdit : function(obj) {
				$(obj).find(".delRow,.addRow").each(function() {
					$(this).attr("class", "noEdit");
				});

				$(obj).find("select").each(function() {
					$(this).attr("disabled", "disabled");
				});
			}
		};
		if (p.url && p.autoload) {
			g.populate();
		} else {
			g.initData(html);
		}
	};

	$.fn.newCondition = function(p) {
		var t = this;
		$(document).ready(function() {
			$.newCondition(t, p);
		});
	};
})(jQuery);
