<?php
/**
 * 語系庫
 *
 * 繁體中文語系庫
 * 命名規則:頭字大寫,不使用_
 *.
 * @author Ryan Chiu <[email]ryan@inetar.net[/email]>
 * @version 1.0
 * @date 2009-5-6 10:10:47
 */

$l="chinese_tw";
$lang_type[$l]='正體中文';
#從以下開始修改
$w=$lang[language];

// f_ 代表是有格式的訊息 format
// m_ 代表是訊息

# 通用辭語
$w['bhrsp']='台灣緯任數位科技股份有限公司';
$w['CopyRight']='版權所有';
$w['JustNow']='剛剛';
$w['f_MinuteAgo']='%s分鐘前';
$w['f_HourAgo']='%s小時前';
$w['f_DayAgo']='%s天前';
$w['ExpireSoon']='即將到期';
$w['f_AfterMinute']='%s分鐘後';
$w['f_AfterHour']='%s小時後';
$w['f_AfterDay']='%s天後';

$w['TradChinese']='正體中文';
$w['SimChinese']='简体中文';
$w['English']='English';

$w['Title']='主旨';

$w['Information']='資訊';
$w['Count']='數量';

$w['Progress']='進度';

$w['Filter']='篩選';
$w['PickUp']='挑選';
$w['Save']='保存';

$w['Code']='代碼';

$w['UpdateDate']='更新日期';
$w['DueDate']='截止日期';
$w['Maintainer']='維護者';

$w['Keyword']='關鍵字';
$w['Role']='角色';

$w['Active']='啟用';
$w['Disabled']='失效';

$w['Modifiable']='有修改權限';

$w['View']='查閱';
$w['Export']='匯出';
$w['Validate']='驗証';
#從以上開始修改


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
