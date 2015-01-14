var tw = 0;
var th = 0;

$(document).ready(function() {
	tw = getWidth(1);
	th = getHeight(1);
	initFrame();
	// 读取大模块菜单
	initTopMenu();
	// 读取子菜单
	initLeftMenu(null);
	initTabPanel();
	$.ajaxSetup({
		cache : false
	});

});

$(window).resize(function() {

});

function initFrame() {
	$('.thr_rig_lis2').css("height", th - 220);
	$('.goLeft').click(function() {
		if ($('.Main_left').is(":hidden")) {
			$('.Main_left').show();
			$('.goLeft').css("background-image", "url(/hrd/Framework/Themes/images/frame/arrow_goLeft.gif)");
			$("#tabPanel").resizetabpanel(tw - 195, th - 140);
			$("#tabPanel").refreshitem();
		} else {
			$('.Main_left').hide();
			$('.goLeft').css("background-image", "url(/hrd/Framework/Themes/images/frame/arrow_goRight.gif)");
			$("#tabPanel").resizetabpanel(tw - 21, th - 140);
			$("#tabPanel").refreshitem();
		}
	});
}

function initTabPanel() {
	var items = [ {
		id : "index",
		text : "首頁",
		closeable : false,
		isactive : true,
		iframe : true,
		url : "/hrd/home/page/edit.html"
	} ];
	$("#tabPanel").tabpanel({
		items : items,
		width : tw - 195,
		height : th - 140
	});
}

function openUrl(id, name, lUrl) {
	$("#tabPanel").opentabitem({
		id : id,
		text : name,
		isactive : true,
		closeable : true,
		iframe : true,
		url : lUrl
	}, true);
}

/**
 * 控制子菜单的展开与关闭，
 * 致杨哥哥：此处我改了，因为如果不使用ID即时取页面元素，那么已经展开的节点，在大模块菜单切换后再切回来，会有取那个节点元素不正确的问题，导致那个节点无法再次展开（好像是老节点对象没从js引擎中清掉，我用html()和empty()都试过，不行，也不知道怎么才算真正的清掉），你看到这段注释后就删了这段话吧
 * 
 * @param sname
 * @param mname
 */
function menu(sname, mname) {
	var sObj = $("#" + sname);
	var mObj = $("#" + mname);
	if (sObj.css("display") == "none") {
		sObj.css("display", "");
		sObj.css("background", "#f7f7f7");
		mObj.attr("src", "/hrd/Framework/Themes/images/frame/mopen.png");
	} else {
		sObj.css("display", "none");
		mObj.attr("src", "/hrd/Framework/Themes/images/frame/mclose.png");
	}
}

function show_hot(type) {
	[ "month", "all" ].each(function(t) {
		$('pdf_hot_' + t).hide();
		$('pdf_hot_tab_' + t).removeClassName("selected");
	});
	$('pdf_hot_' + type).show();
	$('pdf_hot_tab_' + type).addClassName("selected");
}

/**
 * 读取大模块菜单
 */
function initTopMenu() {
	var menuBox = $(".Header_navBarleft");
	menuBox.html("");
	sendPostJQueryAjax("/hrd/parentMenu.html", null, function(obj) {
	//sendPostJQueryAjax("/hrd/portalMenu.php", null, function(obj) {		
		var parentMenu = obj.parentMenu;
		// 遍历菜单并输出
		var j = 0;
		for ( var i in parentMenu) {
			// 构建菜单父节点，并调用方法加载对应的子菜单
			var className = "topmenuco";
			if (j == 0) {// 第一个默认选中
				className = "topmenuse";
			}
			var menu = $("<a href=\"#\" title=\"" + parentMenu[i].menuCode + "\" class=\"" + className + "\">" + parentMenu[i].menuName + "</a>");
			// 绑定修改样式和重新加载子菜单的行为
			menu.click(function() {
				// 如果本身就是选中的，则什么都不做
				if ("topmenuse" == $(this).attr("class")) {
					return;
				}
				changeTopMenuClass($(this));
				initLeftMenu($(this).attr("title"));
			});
			menuBox.append(menu);
			j++;
		}
		initTopMenuCss();
	});
}

/**
 * 修改大模块菜单按钮样式，点击大模块菜单按钮后触发
 * 
 * @param obj
 */
function changeTopMenuClass(obj) {
	// 将所有大模块菜单按钮样式还原
	var parentNode = obj.parent();
	parentNode.children().attr("class", "topmenuco");
	// 设置选中样式
	obj.attr("class", "topmenuse");
}

/**
 * 初始化菜单样式，在initTopMenu中调用
 */
function initTopMenuCss() {
	$('#qtebie').bind('mouseover', function() {
		$("#two_rig_top").removeClass("ort_2");
		$("#two_rig_top").addClass("ort_1");
		$("#qtebie").removeClass("lanmub");
		$("#qtebie").addClass("lanmu");
		$("#qrenwu").removeClass("lanmu");
		$("#qrenwu").addClass("lanmub");
		$("#qtebiebox").show();
		$("#qrenwubox").hide();
	});
	$('#qrenwu').bind('mouseover', function() {
		$("#two_rig_top").removeClass("ort_1");
		$("#two_rig_top").addClass("ort_2");
		$("#qtebie").removeClass("lanmu");
		$("#qtebie").addClass("lanmub");
		$("#qrenwu").removeClass("lanmub");
		$("#qrenwu").addClass("lanmu");
		$("#qtebiebox").hide();
		$("#qrenwubox").show();
	});
}

/**
 * 根据大模块菜单编号获取菜单
 * 
 * @param parentMenuCode
 */
function initLeftMenu(parentMenuCode) {
	var params = null;
	// 如果传入大模块菜单编号，则设置参数
	if (parentMenuCode != null) {
		params = [ {
			"name" : "menuCode",
			"value" : parentMenuCode
		} ];
	}
	var menuBox = $("#qtebiebox");
	// 加载菊花
	menuBox.empty();
	menuBox.append("<img style=\"height:15px;\" src=\"/hrd/Framework/Themes/images/common/loading.gif\"/>");
	sendPostJQueryAjax("/hrd/subMenu.html", params, function(obj) {
		var subMenu = obj.subMenu;
		// 移除菊花
		menuBox.empty();
		// 遍历菜单并输出
		for ( var i in subMenu) {
			// 构建菜单父节点
			var menu = null;
			// 构建每一集子菜单容器
			var nodeBox = null;
			// 设置打开链接的行为代码
			var openUrlScript = "";
			switch (subMenu[i].menuType) {
			case "3":
				openUrlScript = "openUrl('" + subMenu[i].menuCode + "','" + subMenu[i].menuName + "','/hrdReport/" + addLinkMark(subMenu[i].menuUrl) + "menuCode=" + subMenu[i].menuCode + "');";
				break;
			default:
				openUrlScript = "openUrl('" + subMenu[i].menuCode + "','" + subMenu[i].menuName + "','/hrd/" + addLinkMark(subMenu[i].menuUrl) + "menuCode=" + subMenu[i].menuCode + "');";
				break;
			}

			if (subMenu[i].menuUrl == null || subMenu[i].menuUrl == "") {// 如果父节点没有路径的话，将行为代码置空
				openUrlScript = "";
			}
			// 设置展开菜单的行为代码
			var menuScript = "menu('t" + i + "','tt" + i + "');";
			// 设置加号图片
			var imgPath = "/hrd/Framework/Themes/images/frame/mclose.png";
			if (subMenu[i].list == null || subMenu[i].list.length == 0) {// 如果没有下层菜单，将展开菜单的行为置空
				menuScript = "";
				// 改为减号图片
				imgPath = "/hrd/Framework/Themes/images/frame/mopen.png";
			}
			menu = $("<div class=\"menuhead\" onClick=\"" + openUrlScript + menuScript + "\" onmouseover=\"this.style.color='#FF6A00'\" onmouseout=\"this.style.color='#333399'\" title=\""
					+ subMenu[i].menuName + "\"></div>");
			// 添加加号图片
			menu.append("<img id=\"tt" + i + "\" src=\"" + imgPath + "\" width=\"22\" height=\"22\" align=\"absmiddle\" />" + cut10Length(subMenu[i].menuName));
			menuBox.append(menu);
			if (subMenu[i].list != null && subMenu[i].list.length > 0) {// 如果有下层菜单
				nodeBox = $("<div id=\"t" + i + "\" class=\"menubody\" style=\"display:none\"></div>");
				// 插入每一个菜单节点
				for ( var j in subMenu[i].list) {
					var nodeObj = subMenu[i].list[j];
					var node;
					switch (nodeObj.menuType) {
					case "3":
						node = $("<a title=\"" + nodeObj.menuName + "\" href=\"javascript:openUrl('" + nodeObj.menuCode + "','" + nodeObj.menuName + "','/hrdReport/" + addLinkMark(nodeObj.menuUrl)
								+ "menuCode=" + nodeObj.menuCode + "');\" class=\"basica\">" + cut10Length(nodeObj.menuName) + "</a><br>");
						break;
					default:
						node = $("<a title=\"" + nodeObj.menuName + "\" href=\"javascript:openUrl('" + nodeObj.menuCode + "','" + nodeObj.menuName + "','/hrd/" + addLinkMark(nodeObj.menuUrl)
								+ "menuCode=" + nodeObj.menuCode + "');\" class=\"basica\">" + cut10Length(nodeObj.menuName) + "</a><br>");
						break;
					}
					if (node) {
						nodeBox.append(node);
					}
				}
				menuBox.append(nodeBox);
			}
		}
		initLeftMenuCss();
	});
}

/**
 * 初始化子菜单样式，在initLeftMenu中调用
 */
function initLeftMenuCss() {
	var icons = {
		header : "ui-icon-circle-arrow-e",
		headerSelected : "ui-icon-circle-arrow-s"
	};
	$("#accordion").accordion({
		icons : icons,
		header : "h3",
		fillSpace : true
	});
}

/**
 * 长度超过10就切掉
 * 
 * @param obj
 * @returns
 */
function cut10Length(obj) {
	// 长度超过10就切掉
	if (obj.length > 10) {
		obj = obj.substring(0, 10) + "...";
	}
	return obj;
}

/**
 * 添加属性连接符(?或者&)
 * 
 * @param url
 * @param name
 * @param value
 */
function addLinkMark(url) {
	if (url != null && url != "") {
		if (url.indexOf("?") > -1) {
			url += "&";
		} else {
			url += "?";
		}
	}
	return url;
}
