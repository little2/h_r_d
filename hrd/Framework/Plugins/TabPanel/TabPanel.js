/**
 * 选项卡类
 * Marker.King
 */
TabPanel = function(config){
  this.renderTo	= config.renderTo || $(document.body);//承载容器
  this.border =	config.border;//是否显示边框
  this.render =	typeof this.renderTo ==	'string' ? $('#'+this.renderTo)	: this.renderTo;//容器对象
  this.widthResizable =	config.widthResizable;//宽度是否可以改变
  this.heightResizable = config.heightResizable;//高度是否可以改变
  this.autoResizable = config.autoResizable	? true : false;//自动改变大小
  this.width = config.width	|| '100%';//宽度
  this.height =	config.height || '100%';//高度
  this.items = config.items;//选项卡
  this.active =	config.active || 0;//激活哪个
  this.activeTab = null;//被激活的选项卡
  this.tabs	= [];//选项卡数组
  this.scrolled	= false;//是否显示了滚动条
  this.tabMoveWidth	= 120;//移动距离
  this.fixNum =	2;//右边补丁2像素
  this.scrollFinish	= true;//是否滚动完毕
  this.maxLength = config.maxLength	|| -1;//最大选项卡数量
  this.maxzindex = 0;//层高
  this.intervalId;

  this.init();//初始化
};

TabPanel.prototype = {
  //初次加载渲染界面
  init : function(){
	
	var	tabEntity =	this;
	
	if(this.autoResizable){
	  this.widthResizable =	this.heightResizable = true;
	  this.render.css('overflow', 'hidden');
	  $(window).resize(function(){
		window.setTimeout(function(){
		  tabEntity.resize();
		}, 200);
	  });
	}
  
	this.render.width(this.width);
	this.render.height(this.height);

	var	hwFix =	this.border!='none'?2:0;

	this.tabpanel =	$('<DIV>');
	this.tabpanel.addClass('tabpanel');
	this.tabpanel.width(this.render.width()-hwFix);
	this.tabpanel.height(this.render.height()-hwFix);
	this.render.append(this.tabpanel);
	
	//实例化选项卡承载层
	this.tabpanel_tab_content =	$('<DIV>');
	this.tabpanel_tab_content.addClass('tabpanel_tab_content').appendTo(this.tabpanel);
	
	//实例化左滚动
	this.tabpanel_left_scroll =	$('<DIV>');
	this.tabpanel_left_scroll.mousedown(function(){
	  tabEntity.moveLeft();
	  tabEntity.itervalId =	window.setInterval(function(){tabEntity.moveLeft();}, 300);
	  $(document).mouseup(function(){
		window.clearInterval(tabEntity.itervalId);
		$(document).unbind('mouseup');
	  });
	});
	this.tabpanel_left_scroll.addClass('tabpanel_left_scroll').addClass('display_none');
	this.tabpanel_left_scroll.hover(function(){
		$(this).addClass('tabpanel_scroll_over');
	  },function(){
		$(this).removeClass('tabpanel_scroll_over');
	  }
	);
	this.tabpanel_left_scroll.appendTo(this.tabpanel_tab_content);
	
	//实例化右移动
	this.tabpanel_right_scroll = $('<DIV>');
	this.tabpanel_right_scroll.mousedown(function(){
	  tabEntity.moveRight();
	  tabEntity.itervalId =	window.setInterval(function(){tabEntity.moveRight();}, 300);
	  $(document).mouseup(function(){
		window.clearInterval(tabEntity.itervalId);
		$(document).unbind('mouseup');
	  });
	});
	this.tabpanel_right_scroll.addClass('tabpanel_right_scroll').addClass('display_none');
	this.tabpanel_right_scroll.hover(function(){
		$(this).addClass('tabpanel_scroll_over');
	  },function(){
		$(this).removeClass('tabpanel_scroll_over');
	  }
	);
	this.tabpanel_right_scroll.appendTo(this.tabpanel_tab_content);
	
	//实例化移动承载层
	this.tabpanel_move_content = $('<DIV>');
	this.tabpanel_move_content.addClass('tabpanel_move_content');
	this.tabpanel_move_content.appendTo(this.tabpanel_tab_content);
	
	//实例化卡片承载容器
	this.tabpanel_mover	= $('<UL></UL>');
	this.tabpanel_mover.addClass('tabpanel_mover');
	this.tabpanel_mover.appendTo(this.tabpanel_move_content);
	
	//实例化分隔条
	this.tabpanel_tab_spacer = $('<DIV>');
	this.tabpanel_tab_spacer.addClass('tabpanel_tab_spacer');
	this.tabpanel_tab_spacer.appendTo(this.tabpanel_tab_content);
	
	//实例化内容层
	this.tabpanel_content =	$('<DIV>');
	this.tabpanel_content.addClass('tabpanel_content');
	this.tabpanel_content.appendTo(this.tabpanel);
	
	var	t_w	= this.tabpanel.width();
	var	t_h	= this.tabpanel.height();

	if(this.border=='none')	{
	  this.tabpanel.css('border','none');
	}

	//计算选项卡承载层和内容层宽度(重点是要去除边框的宽度)
	this.tabpanel_tab_content.width(t_w);
	this.tabpanel_content.width(t_w);
	this.tabpanel_content.height(t_h-this.tabpanel_tab_content.get(0).offsetHeight);
	
	this.update();
	
	if(this.items) {
	  for(var i=0; i<this.items.length;	i++) {
		this.items[i].inexecutionMoveSee = true;
		this.addTab(this.items[i]);
	  }
	  //激活规定的选项卡
	  if(this.active>=0) {
		this.show(this.active, false);
	  }
	}
  },
  //向左移动
  moveLeft : function(){
	if(this.scrollFinish) {
	  this.disableScroll();
	  this.scrollFinish	= false;
	  Fader.apply(this,	[{
		element:this.tabpanel_mover,
		style:'marginLeft',
		num:this.tabMoveWidth,
		maxMove:this.maxMove,
		onFinish : this.useableScroll
	  }]);
	  this.run();
	}
  },
  //向右移动
  moveRight	: function(){
	if(this.scrollFinish) {
	  this.disableScroll();
	  this.scrollFinish	= false;
	  Fader.apply(this,	[{
		element:this.tabpanel_mover,
		style:'marginLeft',
		num:this.tabMoveWidth*-1,
		maxMove:this.maxMove,
		onFinish : this.useableScroll
	  }]);
	  this.run();
	}
  },
  //向左移动到头
  moveToLeft : function(){
	//未显示滚动条
	if(this.scrolled &&	this.scrollFinish) {
	  this.disableScroll();
	  this.scrollFinish	= false;
	  var marginLeft = parseInt(this.tabpanel_mover.css('marginLeft'))*-1;
	  Fader.apply(this,	[{
		element	: this.tabpanel_mover,
		style :	'marginLeft',
		num	: marginLeft, 
		maxMove	: this.maxMove,
		interval : 20,
		step : (marginLeft/10)<10?10:marginLeft/10,
		onFinish : this.useableScroll
	  }]);
	  this.run();
	}
  },
  //向右移动到头
  moveToRight :	function(){
	//显示了滚动条
	if(this.scrolled &&	this.scrollFinish) {
	  this.disableScroll();
	  this.scrollFinish	= false;
	  //向左移动了多少像素
	  var marginLeft = parseInt(this.tabpanel_mover.css('marginLeft'))*-1;
	  //目前总选项卡宽度
	  var liWidth =	this.tabs[this.tabs.length-1].where;
	  //选项卡移动容器宽度
	  var cWidth = this.tabpanel_move_content.width();
	  //需要移动多少
	  var num =	(liWidth - cWidth -	marginLeft + this.fixNum)*-1;
	  Fader.apply(this,	[{
		element:this.tabpanel_mover,
		style:'marginLeft',
		num:num,
		maxMove:this.maxMove,
		step:(num/10)<10?10:num/10,
		onFinish : this.useableScroll
	  }]);
	  this.run();
	}
  },
  //移动到可见位置/////////////////////////////////////////////////////////
  moveToSee	: function(position){
	//是否显示了滚动条
	if(this.scrolled) {
	  //得到选项卡容器去除左右按钮的宽度
	  var contentWidth = this.tabpanel_move_content.width();
	  //得到选项卡位置
	  var liWhere =	this.tabs[position].where -	this.tabs[position].tabWidth - 4;
	  //得到当前LI容器所在位置
	  var ulWhere =	parseInt(this.tabpanel_mover.css('marginLeft'));
	  //移动距离
	  var moveNum;
	  //如果LI左边在显示范围外
	  if((liWhere +	ulWhere) < 0) {
		//移动位置 = (LI容器位置 + LI位置)转换成正值
		moveNum	= (ulWhere + liWhere)*-1;
		//如果加上移动位置后,最后一个选项卡还未达到右边要求则移动至最右边
		if((this.tabs[this.tabs.length-1].where	+ ulWhere +	6 +	moveNum) < contentWidth) {
		  this.moveToRight();
		} else {
		  this.disableScroll();
		  this.scrollFinish	= false;
		  Fader.apply(this,	[{
			element:this.tabpanel_mover,
			style:'marginLeft',
			num:moveNum,
			maxMove:this.maxMove,
			step:(moveNum/10)<10?10:moveNum/10,
			onFinish : this.useableScroll
		  }]);
		  this.run();
		}
	  }
	  //如果LI右边超过显示范围
	  else if((liWhere + ulWhere + this.tabs[position].tabWidth	+ 6) > contentWidth) {
		//移动位置 = (LI容器当前位置 + 容器位置	+ 选项卡宽度 + 2像素补丁) -	选项卡容器宽度
		moveNum	= (liWhere + ulWhere + this.tabs[position].tabWidth	+ 6) - contentWidth;
		this.disableScroll();
		this.scrollFinish =	false;
		Fader.apply(this, [{
		  element:this.tabpanel_mover,
		  style:'marginLeft',
		  num:-moveNum,
		  maxMove:this.maxMove,
		  onFinish : this.useableScroll
		}]);
		this.run();
	  }	else if((this.tabs[this.tabs.length-1].where + ulWhere + 6)	< contentWidth)	{
		this.moveToRight();
	  }
	}
  },
  //左右滚动都禁用
  disableScroll	: function(){
	this.tabpanel_left_scroll.addClass('tabpanel_left_scroll_disabled').removeClass('tabpanel_scroll_over');
	this.tabpanel_left_scroll.attr('disabled',true);
	this.tabpanel_right_scroll.addClass('tabpanel_right_scroll_disabled').removeClass('tabpanel_scroll_over');
	this.tabpanel_right_scroll.attr('disabled',	true);
  },
  //判断是否移动到了极限
  useableScroll	: function(){
	var	tabEntity =	this;
	//如果有滚动条
	if(this.scrolled) {
	  //如果在最左边
	  if(parseInt(tabEntity.tabpanel_mover.css('marginLeft')) == 0)	{
		//左滚动不能用
		tabEntity.tabpanel_left_scroll.addClass('tabpanel_left_scroll_disabled');
		tabEntity.tabpanel_left_scroll.attr('disabled',true).removeClass('tabpanel_scroll_over');
		//右滚动可以用
		tabEntity.tabpanel_right_scroll.removeClass('tabpanel_right_scroll_disabled');
		tabEntity.tabpanel_right_scroll.removeAttr('disabled');
	  }
	  //如果在最右边
	  else if(parseInt(tabEntity.tabpanel_mover.css('marginLeft'))*-1 == tabEntity.maxMove)	{
		//左滚动可以用
		tabEntity.tabpanel_left_scroll.removeClass('tabpanel_left_scroll_disabled');
		tabEntity.tabpanel_left_scroll.removeAttr('disabled',true).removeClass('tabpanel_scroll_over');
		//右滚动不能用
		tabEntity.tabpanel_right_scroll.addClass('tabpanel_right_scroll_disabled');
		tabEntity.tabpanel_right_scroll.attr('disabled');
	  }
	  //全部能用
	  else {
		tabEntity.tabpanel_left_scroll.removeClass('tabpanel_left_scroll_disabled');
		tabEntity.tabpanel_left_scroll.removeAttr('disabled',true).removeClass('tabpanel_scroll_over');
		tabEntity.tabpanel_right_scroll.removeClass('tabpanel_right_scroll_disabled');
		tabEntity.tabpanel_right_scroll.removeAttr('disabled');
	  }
	}
	
	tabEntity.scrollFinish = true;
  },
  //更新样式
  update : function(){
	var	tabEntity =	this;
	var	cWidth = this.tabpanel_tab_content.width();
	//如果有滚动条,则减去滚动条的宽度
	if(this.scrolled) {
	  cWidth -=	(this.tabpanel_left_scroll.width()+this.tabpanel_right_scroll.width());
	}
	//设置选项卡移动承载容器宽度
	this.tabpanel_move_content.width(cWidth);
	//计算最大移动量
	this.maxMove = 0;
	this.tabpanel_mover.children('LI').each(function(i){
	  tabEntity.maxMove	+= $(this).width() + 4;
	  tabEntity.tabs[i].where =	tabEntity.maxMove;
	});
	this.maxMove = this.maxMove	- cWidth + this.fixNum;
	//this.maxMove = (this.tabpanel_mover.children('LI').length*this.tabMoveWidth) - cWidth	+ this.fixNum;
  },
  //判断选项卡总长度是否超过了选项卡容器总长度,如果超过了则显示左右移动按钮
  showScroll : function(){
	//计算LI总宽度
	var	liWidth	= this.tabs[this.tabs.length-1].where;
	//计算选项卡容器总宽度
	var	tabContentWidth	= this.tabpanel_tab_content.width();
	
	//如果LI总宽度大于选项卡容器总宽度,并且未显示选项卡滚动条
	if(liWidth > tabContentWidth &&	!this.scrolled)	{
	  //左右margin出18px
	  this.tabpanel_move_content.addClass('tabpanel_move_content_scroll');
	  //显示滚动条
	  this.tabpanel_left_scroll.removeClass('display_none');
	  this.tabpanel_right_scroll.removeClass('display_none');
	  //滚动条已显示
	  this.scrolled	= true;
	}
	//如果LI总宽度小于选项卡容器总宽度,并且已显示选项卡滚动条
	else if(liWidth	< tabContentWidth && this.scrolled)	{
	  //向左移动到头
	  this.moveToLeft();
	  //清除左右margin
	  this.tabpanel_move_content.removeClass('tabpanel_move_content_scroll');
	  //隐藏滚动条
	  this.tabpanel_left_scroll.addClass('display_none');
	  this.tabpanel_right_scroll.addClass('display_none');
	  //滚动条已隐藏
	  this.scrolled	= false;
	  //设置为已滚动完毕,如果第一个选项卡不在最左边,需要向左移动到头,show方法有判断是否滚动结束(未结束则不执行),因此要设置为true
	  this.scrollFinish	= true;
	}
  },
  //创建标签页的标题
  //@item :	标签页对象(id,title,html,closable,disabled,icon)
  //@index : 标签页的索引
  addTab : function(tabitem){
	
	if(this.maxLength!=-1 && this.maxLength<=this.tabs.length) {
	  alert('您只能打开'+this.maxLength+'个选项卡，请关闭不用的选项卡。');
	  return false;
	}

	tabitem.id = tabitem.id;//tabitem.id	|| Math.uuid();
	
	//如果已经存在相同ID的选项卡,则直接显示
	if($('#'+tabitem.id).length>0) {
	  var p	= this.getTabPosision(tabitem.id);
	  this.show(tabitem.id,	false);
	  if(this.tabs[p].html.toLowerCase() !=	tabitem.html.toLowerCase())	{
		this.tabs[p].html =	tabitem.html;
		this.tabs[p].content.html(tabitem.html);
	  }
	}
	//当没有选项卡时,如果已经滚动结束,则添加选项卡
	else if(this.scrollFinish) {
	  if(typeof	tabitem.closable === "undefined") {
		tabitem.closable = true;
	  }
	  var tabEntity	= this;
  
	  //添加选项卡LI元素
	  var tab =	$('<LI></LI>');
	  tab.attr('id', tabitem.id);
	  tab.appendTo(this.tabpanel_mover);
  
	  //添加title元素
	  var title	= $('<DIV>');
	  title.text(tabitem.title);
	  title.appendTo(tab);
	  title.bind('selectstart',	function(){return false;});

	  var wFix = tabitem.closable ?	3 :	-5;
	  
	  if(tabitem.icon) {
		title.addClass('icon_title');
		title.css('background-image', 'url("'+tabitem.icon+'")');
		if(title.width()>(tabitem.tabWidth-35-wFix)) {
		  title.width((tabitem.tabWidth-50-wFix));
		  tab.attr('title',	tabitem.title);
		  tab.append('<DIV>...</DIV>');
		}
	  }	else {
		title.addClass('title');
		if(title.width()>(tabitem.tabWidth-20-wFix)) {
		  title.width((tabitem.tabWidth-30-wFix));
		  tab.attr('title',	tabitem.title);
		  tab.append('<DIV>...</DIV>');
		}
	  }

	  //如果设置了选项卡的宽度
	  if(tabitem.tabWidth) {
		tab.width(tabitem.tabWidth);
	  }	else {//没设置则根据内容多少自动设定大小

		var	fixWidth = tabitem.closable	? 18 : 4;
		tabitem.tabWidth = tab.width() + fixWidth;
		tab.width(tabitem.tabWidth);
	  }
	  
	  //添加closer元素
	  var closer = $('<DIV>');
	  closer.addClass('closer');
	  closer.attr('title', '关闭');
	  closer.appendTo(tab);
	  
	  //添加content元素
	  var content =	$('<DIV>');
	  content.addClass('html_content');
	  content.appendTo(this.tabpanel_content);

	  var child_frame =	content.find('iframe');
	  /*强制加上ID和NAME
	  if(child_frame.length==1)
	  {
		child_frame.attr('id', tabitem.id+'Frame');
		child_frame.attr('name', tabitem.id+'Frame');
	  }*/
	  
	  //得到当前被激活的选项卡的下标
	  var activedTabIndex =	this.tabpanel_mover.children().index(this.tabpanel_mover.find('.active')[0]);
	  
	  //有可能没有被激活的选项卡,返回的是-1
	  if(activedTabIndex < 0)
		activedTabIndex	= 0;
	  //将新添加的选项卡的父级ID设置为当前激活的选项卡ID
	  if(this.tabs.length >	activedTabIndex) {
		tabitem.preTabId = this.tabs[activedTabIndex].id
	  }	else {
		tabitem.preTabId = '';
	  }
	  
	  tabitem.tab =	tab;//LI对象
	  tabitem.title	= title;//标题
	  tabitem.closer = closer;//关闭按钮
	  tabitem.content =	content;//内容
	  tabitem.disable =	tabitem.disable==undefined ? false : tabitem.disable;//是否可用
	  tabitem.closable = tabitem.closable==undefined ? true	: tabitem.closable;//可否关闭
	  
	  //是否可以关闭
	  if(tabitem.closable==false)
		closer.addClass('display_none');
	  
	  //是否可用
	  if(tabitem.disabled==true) {
		tab.attr('disabled', true);
		title.addClass('.disabled');
	  }
  
	  //将选项卡对象放入数组中
	  this.tabs.push(tabitem);
	  
	  //绑定激活事件
	  tab.click(function(position){
		return function(){
		  tabEntity.show(position, false);
		};
	  }(this.tabs.length-1));
	  
	  //绑定关闭事件
	  closer.click(function(position){
		return function(){
		  tabEntity.kill(position);
		};
	  }(this.tabs.length-1));
	  
	  //绑定双击关闭事件
	  if(tabitem.closable) {
		tab.dblclick(function(position){
		  return function(){
			tabEntity.kill(position);
		  };
		}(this.tabs.length-1));
	  }
	  
	  //是否直接显示刚添加的选项卡
	  if(!tabitem.lazyload)	{
		this.show(this.tabs.length-1, tabitem.inexecutionMoveSee);
	  }
	  
	  //更新宽度
	  this.update();
	  //判断显示滚动条
	  this.showScroll();
	  //更新宽度
	  this.update();

	  //向左移动到头
	  if(!tabitem.lazyload && !tabitem.inexecutionMoveSee) {
		this.moveToRight();
	  }
	}
  },
  //如果位置是字符串,则根据ID得到选项卡下标
  getTabPosision : function(tabId){
	if(typeof tabId	== 'string') {
	  for(var i=0; i<this.tabs.length; i++)	{
		if(tabId ==	this.tabs[i].id) {
		  tabId	= i;
		  break;
		}
	  }
	}
	return tabId;
  },
  //重新加载content
  flush	: function(position)
  {
	//得到下标
	position = this.getTabPosision(position);
	//如果没有该选项卡,则不执行刷新
	if(typeof position == 'string')	{
	  return false;
	} else {
	  //如果有IFRAME,则执行递归刷新
	  var iframes =	this.tabs[position].content.find('iframe');
	  if(iframes.length>0) {
		var	frameId	= this.tabs[position].id+'Frame';
		this.iterateFlush(window.frames[frameId]);
	  }
	}
  },
  //递归刷新
  iterateFlush : function(iframeObj) {
	/**必须使用frames才能得到相应对象*/
	
	//如果当前frame中有多个frame,则再次递归刷新
	if(iframeObj.window.frames.length>0) {
	  for(var i=0; i<iframeObj.window.frames.length; i++) {
		this.iterateFlush(iframeObj.window.frames[i]);
	  }
	} else {
	  //将frame中的所有form提交
	  if(iframeObj.document.forms.length>0)	{
		for(var	i=0; i<iframeObj.document.forms.length;	i++) {
		  //form提交时遇到异常,则将该页面刷新
		  try {
			iframeObj.document.forms[i].submit();
		  }
		  catch(e) {
			iframeObj.location.reload();
		  }
		}
	  }
	  //没有form,直接刷新
	  else {
		iframeObj.location.reload();
	  }
	}
  },
  //显示选项卡
  show : function(position,	inexecutionMoveSee){
	//如果没有选项卡则停止方法执行
	if(this.tabs.length<1) {
	  return false;
	}
	//得到下标
	position = this.getTabPosision(position);
	if(typeof position == 'string')	{
	  position = 0;
	}
	  
	this.active	= position;
	this.activeTab = this.tabs[position];

	//是否滚动结束
	if(this.scrollFinish) {
	  //目标下标如果大,则激活0
	  if(position >= this.tabs.length) {
		position = 0;
	  }
	  //将目标面板显示
	  this.tabs[position].content.css('z-index', ++this.maxzindex);
	  //如果选项卡没有打开
	  if(this.tabs[position].tab.hasClass('active')) {
		//选项卡移动到可见位置
		if(!inexecutionMoveSee) {
		  this.moveToSee(position);
		}
	  }	else {
		//如果选项卡没有加载过页面则加载
		if(this.tabs[position].content.html()=='') {
		  this.tabs[position].content.html(this.tabs[position].html);
		}
		//清除掉已经打开的选项卡激活样式
		this.tabpanel_mover.find('LI.active').removeClass('active');
		//将目标选项卡样式设置为激活
		this.tabs[position].tab.addClass('active');
		//选项卡移动到可见位置
		if(!inexecutionMoveSee) {
		  this.moveToSee(position);
		}
	  }
	}
  },
  //关闭选项卡
  kill : function(position){
  
	var	tabEntity =	this;
	//得到下标
	position = this.getTabPosision(position);
	
	var	preTabId = this.tabs[position].preTabId;
	
	//按照DOM顺序移除
	this.tabs[position].closer.remove();
	this.tabs[position].title.remove();
	this.tabs[position].tab.remove();
	this.tabs[position].content.remove();
	//将数组中的元素删除
	this.tabs.splice(position,1);
	
	//因下标改变,重新为选项卡绑定事件
	for(var	i=0	; i<this.tabs.length; i++) {
	  this.tabs[i].tab.unbind('click');
	  this.tabs[i].tab.click(function(i){
		return function(){
		  tabEntity.show(i,	false);
		};
	  }(i));
	  this.tabs[i].closer.unbind('click');
	  this.tabs[i].closer.click(function(i){
		return function(){
		  tabEntity.kill(i);
		};
	  }(i));
	  if(this.tabs[i].closable)	{
		this.tabs[i].tab.unbind('dblclick');
		this.tabs[i].tab.dblclick(function(i){
		  return function(){
			tabEntity.kill(i);
		  };
		}(i));
	  }
	}
	//防止关闭最后一个时报错
	if(this.tabs.length>0) {
	  //更新宽度
	  this.update();
	  //更新滚动条
	  this.showScroll();
	  //更新宽度
	  this.update();
	  //显示上次打开的选项卡
	  this.show(preTabId,	false);
	}
  },
  
  //获取标签的数量
  getTabsCount : function(){
	return this.tabs.length;
  },

  //设置标签的标题（title属性）
  setTitle : function(position,title){
	position = this.getTabPosision(position);
	if(position	< this.tabs.length)	{
	  this.tabs[position].title.text(title);
	}
  },

  //获取标签的标题（title属性）
  getTitle : function(position){
	position = this.getTabPosision(position);
	return this.tabs[position].title.text();
  },

  //设置标签的内容（html属性）
  setContent : function(position,content){
	position = this.getTabPosision(position);
	if(position	< this.tabs.length)	{
	  this.tabs[position].content.html(content);
	}
  },

  //获取标签的内容（html属性）
  getContent : function(position){
	position = this.getTabPosision(position);
	return this.tabs[position].content.html();
  },

  //设置标签是否可以使用（disable属性）
  setDisable : function(position,disable){
	position = this.getTabPosision(position);
	if(position	< this.tabs.length){
	  this.tabs[position].disable =	disable;
	  if(disable) {
		this.tabs[position].tab.attr('disabled',true);
		this.tabs[position].title.addClass('.disabled');
	  }	else {
		this.tabs[position].tab.removeAttr('disabled');
		this.tabs[position].title.removeClass('.disabled');
	  }
	}
  },

  //获取标签使用的状态（disable属性）
  getDisable : function(position){
	position = this.getTabPosision(position);
	return this.tabs[position].disable;
  },

  //设置标签是否可以关闭（closable属性）
  setClosable :	function(position,closable){
	position = this.getTabPosision(position);
	if(position	< this.tabs.length){
	  this.tabs[position].closable = closable;
	  if(closable) {
		this.tabs[position].closer.addClass('display_none');
	  }	else {
		this.tabs[position].closer.addClass('closer');
		this.tabs[position].closer.removeClass('display_none');
	  }
	}
  },

  //获取标签关闭的状态（closable属性）
  getClosable :	function(position){
	position = this.getTabPosision(position);
	return this.tabs[position].closable;
  },
	
	getActiveIndex : function(){
		return this.active;
	},
  
  getActiveTab : function(){
	return this.activeTab;
  },
  resize : function(){

	//计算选项卡承载层和内容层宽度(重点是要去除边框的宽度)
	var	hwFix =	this.border	== 'none' ?	0 :	2;

	if(this.widthResizable)	{
	  this.width = this.render.width();
	  this.tabpanel.width(this.width-hwFix);
	  this.tabpanel_tab_content.width(this.width-hwFix);
	  this.tabpanel_content.width(this.width-hwFix);
	}
	if(this.heightResizable) {
	  this.height =	this.render.height();
	  this.tabpanel.height(this.height-hwFix);
	  this.tabpanel_content.height(this.height-this.tabpanel_tab_content.get(0).offsetHeight-hwFix);
	}

	this.showScroll();
	this.useableScroll();
	this.update();
	
	var	entity = this;
	window.setTimeout(function(){entity.moveToSee(entity.getActiveIndex());}, 200);
  },
  //设置容器高度
  setRenderWH :	function(wh) {
	if(wh) {
	  if(wh.width!=undefined) {
		this.render.width(wh.width);
	  }
	  if(wh.height!=undefined) {
		this.render.height(wh.height);
	  }
	  this.resize();
	}
  }
};