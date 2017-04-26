<?php
/**
 * 语系库
 *
 * 简体中文语系库
 * 命名规则:头字大写,不使用_
 *.
 * @author Ryan Chiu <[email]ryan@inetar.net[/email]>
 * @version 1.0
 * @date 2009-5-6 10:10:47
 */

$l="chinese_cn";
$lang_type[$l]='简体中文';
#从以下开始修改
$w=$lang[language];

// f_ 代表是有格式的讯息 format
// m_ 代表是讯息

# 通用辞语
$w['bhrsp']='台湾纬任数字科技股份有限公司';
$w['CopyRight']='版权所有';
$w['JustNow']='刚刚';
$w['f_MinuteAgo']='%s分钟前';
$w['f_HourAgo']='%s小时前';
$w['f_DayAgo']='%s天前';
$w['ExpireSoon']='即将到期';
$w['f_AfterMinute']='%s分钟后';
$w['f_AfterHour']='%s小时后';
$w['f_AfterDay']='%s天后';

$w['TradChinese']='正体中文';
$w['SimChinese']='简体中文';
$w['English']='English';

$w['Title']='主旨';

$w['Information']='信息';
$w['Count']='数量';

$w['Progress']='进度';

$w['Filter']='筛选';
$w['PickUp']='挑选';
$w['Save']='保存';

$w['Code']='代码';

$w['UpdateDate']='更新日期';
$w['DueDate']='截止日期';
$w['Maintainer']='维护者';

$w['Keyword']='关键词';
$w['Role']='角色';

$w['Active']='启用';
$w['Disabled']='失效';

$w['Modifiable']='有修改权限';

$w['View']='查阅';
$w['Export']='汇出';
$w['Validate']='验证';
#从以上开始修改


$save_path=getcwd().'/';
$target_file= "/lang/".$l.".php";
while(!file_exists($save_path.$target_file))
{
	$save_path.='../';
}

$parl="module_main_".$l;
$parl_len=strlen($parl);
$save_path.='lang/';
$dir=opendir($save_path);

while(($file=readdir($dir))!==false){
	if(!($file=='.'||$file=='..'))
	{
		if(substr($file,0,($parl_len))==$parl)
		{
			include_once($save_path.'/'.$file);

		}
	}
}

$lang[$l]=$w;
unset($w);

?>
