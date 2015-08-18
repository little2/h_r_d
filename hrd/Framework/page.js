String.prototype.hexColor = function() {

	if (this.indexOf("#") >= -1) {
		return this;
	} // 如果是一个hex值则直接返回
	var pattern = new RegExp("2[0-4]//d|25[0-5]|[01]?//d//d?", "ig"); // 这个正则是取
																		// 0 ~
																		// 255的数字
	var va = this.match(pattern);
	//alert(va);
	if (va.length != 3)
		return "NaN"; // 取出的数组长度一定得为3
	var result = "#";
	for ( var i = 0; i < 3; i++) {
		var num = parseInt(va[i]);
		result += num < 16 ? "0" + num.toString(16) : num.toString(16); // 如果小于F在前面补0
	}
	return result;
}

/* 时间 */
function ShowTime() {
	now = new Date();
	hour = now.getHours();
	minute = now.getMinutes();
	second = now.getSeconds();
	var day = [ "日", "一", "二", "三", "四", "五", "六", ];
	time_str = (hour < 10) ? ("0" + hour) : hour;
	time_str += ":";
	time_str += (minute < 10) ? ("0" + minute) : minute;
	time_str += ":";
	time_str += (second < 10) ? ("0" + second) : second;
	$$("TimeSpan").innerHTML = "" + (now.getFullYear()) + "年"
			+ (now.getMonth() + 1) + "月" + (now.getDate() + 0) + "日 "
			+ time_str + " 星期" + day[new Date().getDay()];
	setTimeout('ShowTime()', 1000);
}
/* 时间 */

/* 目录 */

function $$(id) {
	return document.getElementById(id);
}

function pp(id) {
	$("#d1").attr("class", "width1");
	$("#d2").attr("class", "width1");
	$("#d3").attr("class", "width1");
	$("#d4").attr("class", "width1");
	$("#d5").attr("class", "width1");
	$("#d6").attr("class", "width1");
	$(id).attr("class", "select");
}
/* 目录 */

/* 表格 */
function mOver(obj) {
	var c = obj.style.backgroundColor.toLocaleLowerCase();
	c = c.hexColor();
	if (c != "#fbec88") {
		obj.style.backgroundColor = "#efefef";
	}
}
function mOut(obj) {
	var b = obj.style.backgroundColor.toLocaleLowerCase();
	b = b.hexColor();
	if (b == "#efefef") {
		obj.style.backgroundColor = "#ffffff";
	}
}
function mclick(obj) {
	var a = obj.style.backgroundColor.toLocaleLowerCase()
	a = a.hexColor();
	if (a == "#fbec88") {
		obj.style.backgroundColor = "#ffffff";
	} else {
		obj.style.backgroundColor = "#FBEC88";
	}
}
function showwindow(url, width, height) {
	window.showModalDialog(url, "", "dialogWidth=" + width + ";dialogHeight="
			+ height + "");

}

/* 表格 */