<?php
//2 B P
include_once('config_common.php');

$template->set_filenames(array('report_body' => 'templates/'.tpl_style.'/report_normative_results.htm'));
$template->assign_vars(array(
    'TPL_STYLE'=>tpl_style,
    'title'=>"群體比較 / Normative Results"
));

include_once('report_header.php');

$behavior_list_rows=$db->select('competency',array("[>]behavior"=>"competency_id"),'*',array("competency_id"=>$report->competency_id_row));
foreach($behavior_list_rows as $index => $row)
{
    $competency_id_row[]=$row['competency_id'];
    $behavior_id_row[]=$row['behavior_id'];
    $behavior_list_row[$row['competency_id']][$row['behavior_id']]=$row;
}

$competency_sort=array();
if($profiles_competency=$db->select('profile_competency','*',array('competency_id'=>$competency_id_row,"ORDER"=>'arithmetic_avg DESC')))
{
    foreach($profiles_competency as $index=>$row)
    {
        $competency_sort[$row['competency_id']][]=$row['user_id'];
        if($row['user_id']==$appraisee_uid)
        {
            $competency_rank[$row['competency_id']]=count( $competency_sort[$row['competency_id']]);
        }
    }
   
}

$behavior_sort=array();
if($profiles_behavior=$db->select('profile_behavior','*',array('behavior_id'=>$behavior_id_row,'ORDER'=>'behavior_arithmetic_avg DESC')))
{   
    foreach($profiles_behavior as $index=>$row)
    {
        $behavior_sort[$row['behavior_id']][]=$row['user_id'];
        if($row['user_id']==$appraisee_uid)
        {           
            $behavior_rank[$row['behavior_id']]=count( $behavior_sort[$row['behavior_id']]);
        }
    }      
}


$datahandle->put_into_lang_row('term','competency_title',$competency_id_row);
$datahandle->put_into_lang_row('text','behavior_definition',$behavior_id_row);

foreach($behavior_list_row as $competency_id => $row)
{    
    $competency_val=100-(intval($competency_rank[$competency_id]*100 / count($competency_sort[$competency_id]))) ;
    $filename="./output/report/".$temp_title."/chart/rank_".$competency_id.".png";
    $template->assign_block_vars('COMPETENCY',array(
        'competency_title'=>$datahandle->fetch_lang('competency_title',$competency_id,'term'),
        'rank'=>$competency_val,
        'chart_url'=>$filename
    ));
    

   
    product_chart($competency_val,$filename);
    
    foreach($row as $behavior_id => $row1)
    {
       $_rank=(count($behavior_sort[$behavior_id])>0)?100-(intval($behavior_rank[$behavior_id]*100 / count($behavior_sort[$behavior_id]))):100;
       $filename2="output/report/".$temp_title."/chart/rank_".$competency_id."_".$behavior_id.".png";
        $template->assign_block_vars('COMPETENCY.BEHAVIOR',array(
            'behavior_definition'=>$datahandle->fetch_lang('behavior_definition',$behavior_id,'text'),
            'rank'=>$_rank,
            'chart_url'=>$filename2
        ));
        
        
        product_chart($_rank,$filename2);
        
    }
}

include_once('report_footer.php');







function product_chart($value,$filename)
{
    global $root_path;
    $base=$root_path.common_path."plugins/pChart";
    include_once($base.'/class/pData.class.php');
    include_once($base.'/class/pDraw.class.php');
    include_once($base.'/class/pImage.class.php');
    $MyData = new pData();
    /* Create and populate the pData object */
    //  $MyData = new pData();

    //各條的單位長度
    $MyData->addPoints(array($value),"%");

    /* The default axis will be named "Samples" */
    $MyData->setAxisUnit(0,"%");

    $margin_top=20;
    $margin_left=20;
    $chart_x=300;
    $chart_y=70;

    /* Create the pChart object */
    $myPicture = new pImage($chart_x,$chart_y,$MyData);
    $myPicture->setFontProperties(array("FontName"=>$base."/fonts/pf_arma_five.ttf","FontSize"=>8));

    /* Draw the chart scale 繪制圖表的區域 */
    $myPicture->setGraphArea($margin_top,$margin_left,($chart_x-20),($chart_y-20));

    /* Draw the scale 畫出刻度，刻度會由資料的大小自動決定 */
    $AxisBoundaries = array(0=>array("Min"=>0,"Max"=>100));
    $ScaleSettings  = array(
        "Mode"=>SCALE_MODE_MANUAL,
        "ManualScale"=>$AxisBoundaries,
        "DrawSubTicks"=>FALSE,
        "DrawArrows"=>FALSE,
        "Pos"=>SCALE_POS_TOPBOTTOM,
        "AutoAxisLabels"=>FALSE,
    );
    $myPicture->drawScale($ScaleSettings);

    $Config = array(
        "DisplayPos"=>LABEL_POS_INSIDE,
        "DisplayValues"=>TRUE,          //You can specify if the values must be written on the chart setting DisplayValues to TRUE or FALSE.
        "Rounded"=>TRUE,
    );
    $myPicture->drawBarChart($Config);

    $myPicture->render($filename)    ;
    unset($MyData);
}

?>