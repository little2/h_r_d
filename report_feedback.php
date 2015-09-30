<?php
include_once('config_common.php');

$template->set_filenames(array('report_body' => 'templates/'.tpl_style.'/report_feedback.htm'));
$template->assign_vars(array(
    'TPL_STYLE'=>tpl_style,
    'title'=>"全體回饋明細"
));

include_once('report_header.php');

//basis_evaluation_table_id 

if($basis_evaluation_evaluator_rows=$db->select('basis_evaluation_appraisee',
    array(
        '[>]basis_evaluation_evaluator'=>'basis_evaluation_appraisee_id',
        '[>]basis_evaluation_evaluator_detail'=>'basis_evaluation_evaluator_id'
    ),'*',
    array('AND'=>array(
        'basis_evaluation_table_id'=>$report->report_config['basis_evaluation_table_id'],
        'appraisee_uid'=>$report->report_config['user_id']
    ))))
{
    foreach($basis_evaluation_evaluator_rows as $row)
    {
        $behavior_id=$row['behavior_id'];
        $relation_id=$row['basis_evaluation_evaluator_relation'];
        $report->behavior_id_row[$behavior_id]=$behavior_id;
        //basis_evaluation_evaluator_uid
        $evaluator_uid=$row['basis_evaluation_evaluator_uid'];
        $evaluator_uid_row[$evaluator_uid]=$evaluator_uid;
        $evaluator_relation_uid_row[$relation_id][$evaluator_uid]=$evaluator_uid;
        $behavior_grade_detail[$behavior_id][$evaluator_uid]['evaluation_scale_item_grade']=$row['evaluation_scale_item_grade']; 
    }
    ksort($evaluator_relation_uid_row);
    $datahandle->put_into_lang_row('text','behavior_definition',$report->behavior_id_row);
    
    //使用者資料
    if($user_info_rows=$db->select('user_profile','*',array('user_id'=>$evaluator_uid_row)))
    {
        foreach($user_info_rows as $row)
        {
            $report->user_profile[$row['user_id']]=$row;            
        }
    }
    
    foreach($evaluator_relation_uid_row as $relation_id =>$evaluator_uid_row)
    {
        foreach($evaluator_uid_row as $user_id=>$user_row)
        {
            $template->assign_block_vars('USER_TITLE',array('NAME'=>$report->user_profile[$user_id]['fullName'].$relation_id));
        }
    }
    

    //列出評鑑資料
    if($behavior_grade_detail)
    {
        foreach($behavior_grade_detail as $behavior_id=>$row)
        {
            $template->assign_block_vars('BEHAVIOR',array(
                'behavior_definition'=>++$no.'.'.$datahandle->fetch_lang('behavior_definition',$behavior_id,'text'),
            ));
            foreach($evaluator_relation_uid_row as $relation_id =>$evaluator_uid_row)
            {            
                foreach($evaluator_uid_row as $user_id=>$user_row)
                {
                    $template->assign_block_vars('BEHAVIOR.USERGRADE',array(
                        'evaluation_scale_item_grade'=>$row[$user_id]['evaluation_scale_item_grade']
                    ));
                }
            }             
        }
    }
}



$template->assign_vars(array(
	'user_cols'=>count($report->user_profile)+1
));



include_once('report_footer.php');



?>