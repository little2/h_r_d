<?php

#module_main_competency
$w['Ability']='能力';
$w['AbilityIndex']=$w['Ability'].'指標';
$w['AbilityIndexID']='序號';
$w['AbilityNumber']='指標編號';
$w['AbilityTitle']=$w['Ability'].'分級備註';
$w['AbilityDesc']='級別要求/行為描述';
$w['AbilityIndexList']=$w['AbilityIndex'].'列表';

$w['Competency']='職能';
$w['CompetencyDictionary']=$w['Competency'].'字典';
$w['CompetencyStandard']=$w['Competency'].'標準';
$w['CompetencyStandardOverview']='職能分級匯總表';
$w['CompetencyStandardSetting']=$w['CompetencyStandard'].'設定';



$w['CompetencyItem']=$w['Competency'].'項目';
$w['CompetencyEvaluation']=$w['Competency'].'評鑑';


$w['CompetencyClass']=$w['Competency'].'分級';
$w['CompetencyClassDefinition']=$w['CompetencyClass'].'定義';
$w['CompetencyClassMemo']=$w['CompetencyClass'].'備註';

$w['CompetencyGradingScale']='職能分級表';

$w['CompetencySituation']=$w['Competency'].'狀況';
$w['CompetencyTitle']=$w['Competency'].'項目名稱';
$w['CompetencyLevel']=$w['Competency'].'級數';
$w['CompetencyLevelNumber']=$w['CompetencyLevel'];
$w['CompetencyLevelTitle']=$w['CompetencyLevel'].'名稱';

$w['CompetencyCount']=$w['Competency'].'數量';
$w['CompetencyList']=$w['Competency'].'列表';
$w['CompetencyType']=$w['Competency'].'類型';
$w['CompetenceAssessment']=$w['Competency'].'評估';
$w['CompetencyInventory']=$w['Competency'].'盤點';
$w['CompetencyPassGrade']=$w['Competency'].'及格分數';
$w['CompetencyStandard']=$w['Competency'].'標準';

$w['CompetencyID']='序號';
$w['CompetencyDefinition']='職能意涵';

$w['CompetencyCourse']=$w['Competency'].'課程';


$w['CoreCompetency']='核心'.$w['Competency'];
$w['ManageCompetency']='管理'.$w['Competency'];
$w['ProfessionalCompetency']='專業'.$w['Competency'];
$w['GeneralCompetency']='通用'.$w['Competency'];

$w['CoreCompetencyDictionary']='核心'.$w['CompetencyDictionary'];
$w['ManageCompetencyDictionary']='管理'.$w['CompetencyDictionary'];
$w['ProfessionalCompetencyDictionary']='專業'.$w['CompetencyDictionary'];
$w['GeneralCompetencyDictionary']='通用'.$w['CompetencyDictionary'];

$w['CoreCompetencyStandard']='核心'.$w['CompetencyStandard'];
$w['ManageCompetencyStandard']='管理'.$w['CompetencyStandard'];
$w['ProfessionalCompetencyStandard']='專業'.$w['CompetencyStandard'];
$w['GeneralCompetencyStandard']='通用'.$w['CompetencyStandard'];



$w['Basis']='基準';
$w['Class']='分級';

$w['Model']='模型';
$w['CompetencyModel']=$w['Competency'].'模型';
$w['CompetencyModelTitle']=$w['CompetencyModel'].'名稱';
$w['CompetencyModelDefinition']=$w['CompetencyModel'].'定義';
$w['CompetencyModelTree']=$w['CompetencyModel'].'樹';

$w['m_NoAvailableCompetency']='所有的'.$w['Competency'].'已被分派,已無可分派的'.$w['Competency'];
$w['Level']='等級';
$w['CompetencyAbilityID']='序號';
$w['Height']='權重';
$w['Weight']='權重';
$w['AddingOfCourse']='加選課程';
$w['PassingRate']='符合度';




$w['Behavior']='行為';

$w['BehaviorTitle']=$w['Behavior'].'名稱';
$w['BehaviorDesc']=$w['Behavior'].'描述';
$w['BehaviorDefinition']='關鍵'.$w['Behavior'].'描述';

$w['CriticalBehavioralIndicator']='關鍵行為指標';
$w['BehaviorIndicator']='行為指標';
$w['BehaviorIndicatorNumber']=$w['BehaviorIndicator'].'編號';
$w['BehaviorIndicatorDefinition']=$w['BehaviorIndicator'].'定義';

$w['FullMarks']='滿分';
$w['PassGrade']='及格分數';

$w['m_CompetencyWeightNotMatch']=$w['Competency'].$w['Weight'].'的總合不為100,請調整';

//--職能群組
$w['CompetencyGroup']=$w['Competency'].'群組';
$w['CompetencyGroupID']=$w['CompetencyGroup'].'編號';
$w['CompetencyGroupTitle']=$w['CompetencyGroup'].'名稱';
$w['CompetencyGroupDefinition']=$w['CompetencyGroup'].'定義';
//--

$w['Assessment']='考核';
$w['Unrated']='未考核';
$w['Pass']='合格';
$w['Failed']='不通過';
$w['Comment']='評論';
$w['m_TotalLessThenItem']=$w['CompetencyPassGrade'].'小於'.$w['CriticalBehavioralIndicator'].'各項'.$w['PassGrade'].'的總和,系統將自動調高'.$w['CompetencyPassGrade'];

$w['Beginners']='新手級';
$w['Basic']='半熟手級';
$w['Intermediate']='熟手級';
$w['Superior']='教練級';
$w['Master']='講師級';



#SurveyList
$w['Survey']='問卷';
$w['SurveyList']=$w['Survey'].'列表';
$w['SurveyTitle']=$w['Survey'].'名稱';
$w['SurveyStatus']=$w['Survey'].'狀態';
$w['SubmitSurvey']='交卷';
$w['OpenComment']='開放建議';
$w['OpenCommentSubject']=$w['OpenComment'].'題目';

#EvaluationMethod
$w['Evaluation']='評鑑';
$w['EvaluationLevel']=$w['Evaluation'].'級數';
$w['CurrentEvaluationLevel']='本次'.$w['EvaluationLevel'];
$w['EvaluationDesc']=$w['Evaluation'].'說明';
$w['Evaluator']='評鑑人';
$w['EvaluationScale']=$w['Evaluation'].'量表';
$w['EvaluationScaleTitle']=$w['EvaluationScale'].'名稱';
$w['EvaluationScaleDesc']=$w['EvaluationScale'].'說明';
$w['EvaluationRelation']=$w['Evaluation'].'關係';
$w['EvaluationRelationCode']=$w['EvaluationRelation'].'代碼';
$w['EvaluationRelationTitle']=$w['EvaluationRelation'].'名稱';
$w['EvaluationTable']=$w['Evaluation'].'表';
$w['EvaluationTableItem']=$w['EvaluationTable'].'選項';
$w['EvaluationTableInfo']=$w['EvaluationTable'].'信息';
$w['EvaluationTableTitle']=$w['EvaluationTable'].'名稱';
$w['EvaluationTableDesc']=$w['EvaluationTable'].'描述';

$w['EvaluationProgress']=$w['Evaluation'].'進度';
$w['EvaluationTableStatus']=$w['EvaluationTable'].'狀態';
$w['EvaluationResult']=$w['Evaluation'].'結果';

$w['ReviewEvaluationTable']=$w['EvaluationTable'].'審核';
$w['PublishEvaluationTable']=$w['EvaluationTable'].'發佈';
$w['ManageEvaluationProgress']=$w['EvaluationProgress'].'管理';
$w['AdjustEvaluationResult']=$w['EvaluationResult'].'調整';
$w['Adjust']='調整';

$w['Score']='分數';

$w['OriginalScore']='原始'.$w['Score'];
$w['OriginalWeight']='原始'.$w['Weight'];;
$w['EvaluationScore']='評鑑'.$w['Score'];
$w['OriginalTotalWeight']='原始評鑑總級數';


$w['AdjustedScore']='調整後'.$w['Score'];
$w['AdjustedWeight']='調整後'.$w['Weight'];
$w['AdjustedEvaluationScore']='調整後'.$w['EvaluationScore'];
$w['AdjustedTotalWeight']='調整後評鑑總級數';



$w['DueDate']='完成期限';

$w['Publish']='發佈';
$w['Edit']='編輯';
$w['Review']='審核';
$w['ReviewStatus']=$w['Review'].'狀態';

$w['EvaluationContent']=$w['Evaluation'].'內容';
$w['EvaluationMethod']=$w['Evaluation'].'方法';

$w['Item']='選項';
$w['ItemTitle']=$w['Item'].'名稱';
$w['ItemDesc']=$w['Item'].'描述';
$w['Grade']='分數';
$w['HideSelfEvaluate']='自評不顯示';        


$w['BasisEvaluationTable']='基準制評鑑表';

###
$w['Appraisee']='受評人';
$w['Class']='分級制';
$w['ClassEvaluation']=$w['Class'].'評鑑表';
$w['ClassEvaluationAppraisee']=$w['ClassEvaluation'].'受評人';
$w['EvaluationAttachment']='評鑑表附件';


//REPORT
$w['Report']='報表';
$w['ReportKind']=$w['Report'].'種類';
$w['ReportTitle']=$w['Report'].'名稱';

$w['PersonalReport']='個人'.$w['Report'];
$w['GroupReport']='團體別'.$w['Report'];
$w['CompanyReport']='公司別'.$w['Report'];
?>