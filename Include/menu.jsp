<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<div class=Main_leftTop>
	<INPUT type ="text" maxLength=10 name="menuName" id="menuName" value="">
		<INPUT type="image" id="menuQuery" src="Framework/Themes/images/frame/search_left.png">
</div>
<div class=Main_leftBody>
	<div id="two_rig_top" class="ort_1">
		<span id="qtebie" class="lanmu">程式列表</span> 
		<!-- <span id="qrenwu" class="lanmub" style="margin: 0 0 0 25px; cursor:pointer">我的收藏</span> -->
	</div>
	<div class="thr_rig_lis2" id="qtebiebox">
	<div  class="menuhead" onClick="menu(t1,tt1);" onmouseover="this.style.color='#FF6A00'" onmouseout="this.style.color='#333399'" >
		<img id='tt1' src="/hrd/Framework/Themes/images/frame/mclose.png" width="22" height="22" align="absmiddle">班級管理
	</div>
	<div id='t1' class="menubody" style="display:none">
		<a href="javascript:openUrl('L05','L05班級管理作業','/hrd/training/trClasses/list.html');" class="basica">L05班級管理作業</a><br>
		<a href="javascript:openUrl('L11','L11報告情況跟蹤','/hrd/training/reportTrack/list.html');" class="basica">L11報告情況跟蹤</a><br>
		<a href="javascript:openUrl('L12','L12報告查詢','/hrd/training/reportTrack/list.html');" class="basica">L12報告查詢</a><br>
		<a href="javascript:openUrl('L13','L13成績管理','/hrd/training/trAchievementManage/list.html');" class="basica">L13成績管理</a><br>
		<a href="javascript:openUrl('L18','L18結案管理','/hrd/training/trClassesClose/list.html');" class="basica">L18結案管理</a><br>
		<a href="javascript:openUrl('L19','L19訓練費用維護','/hrd/training/trTrainingCost/list.html');" class="basica">L19訓練費用維護</a><br>
	</div>
	
	<div  class="menuhead" onClick="menu(t2,tt2);" onmouseover="this.style.color='#FF6A00'" onmouseout="this.style.color='#333399'" >
		<img id='tt2' src="/hrd/Framework/Themes/images/frame/mclose.png" width="22" height="22" align="absmiddle">個人/主管專區
	</div>
	<div id='t2' class="menubody" style="display:none">
		<a href="javascript:openUrl('L06','L06內訓報名作業','/hrd/training/trTraineeSelectedCourses/list.html');" class="basica">L06內訓報名作業</a><br>
		<a href="javascript:openUrl('L07','L07內訓報名作業-代申請','/hrd/training/trTraineeSelectedCoursesAgent/list.html');" class="basica">L07內訓報名作業-代申請</a><br>
		<a href="javascript:openUrl('L08','L08訓練請假申請','/hrd/training/trTraineeLeaveAction/list.html');" class="basica">L08訓練請假申請</a><br>
		<a href="javascript:openUrl('L09','L09訓練請假申請-代申請','/hrd/training/trTraineeLeaveActionAgent/list.html');" class="basica">L09訓練請假申請-代申請</a><br>
		<a href="javascript:openUrl('L10','L10個人課後報告','/hrd/training/trTraineeAfterschoolReport/list.html');" class="basica">L10個人課後報告</a><br>
		<a href="javascript:openUrl('L14','L14外訓申請','/hrd/training/trOutsideTrain/list.html');" class="basica">L14外訓申請</a><br>	
		<a href="javascript:openUrl('L15','L15外訓申請-代申請','/hrd/training/trOutsideTrainAgent/list.html');" class="basica">L15外訓申請-代申請</a><br>
		<a href="javascript:openUrl('L16','L16外訓費用報銷及結案','/hrd/training/trOutsideTrainExpense/list.html');" class="basica">L16外訓費用報銷及結案</a><br>
		<a href="javascript:openUrl('L17','L17外訓費用報銷及結案代申請','/hrd/training/trOutsideTrainExpenseAgent/list.html');" class="basica">L17外訓費用報銷及結案代申請</a><br>
		<a href="javascript:openUrl('L23','L23待審批信息','L23.html');" class="basica">L23待審批信息</a><br>
		<a href="javascript:openUrl('L25','L25學習記錄','/hrd/training/trPersonTrainingQuery/list.html');" class="basica">L25學習記錄</a><br>
		<a href="javascript:openUrl('L26','L26證書記錄','/hrd/training/trPersonCertificateQuery/list.html');" class="basica">L26證書記錄</a><br>
		<a href="javascript:openUrl('L27','L27部門訓練查詢','/hrd/training/trDepartTrainingQuery/list.html');" class="basica">L27部門訓練查詢</a><br>
		<a href="javascript:openUrl('X09','X09部門年度訓練需求','/hrd/training/trDepartAnnualTraining/list.html');" class="basica">X09部門年度訓練需求</a><br>
		<a href="index.html" class="basica">X13自定首頁</a><br>
		<a href="javascript:openUrl('X14','X14個人學習地圖維護','/hrd/training/trPersonTrainingMap/list.html');" class="basica">X14個人學習地圖維護</a><br>
		<a href="javascript:openUrl('X15','X15個人學習檢討','/hrd/training/trPersonMapQuery/list.html');" class="basica">X15個人學習檢討</a><br>
	</div>
	
	<div  class="menuhead" onClick="menu(t3,tt3);" onmouseover="this.style.color='#FF6A00'" onmouseout="this.style.color='#333399'" >
		<img id='tt3' src="/hrd/Framework/Themes/images/frame/mclose.png" width="22" height="22" align="absmiddle">考試管理
	</div>
	<div id='t3' class="menubody" style="display:none">
		<a href="javascript:openUrl('K05','K05知識點管理','/hrd/training/trKnowledgePointsC/list.html');" class="basica">K05知識點管理</a><br>
		<a href="javascript:openUrl('K06','K06考試題庫管理','/hrd/training/trQuestions/list.html');" class="basica">K06考試題庫管理</a><br>
		<a href="javascript:openUrl('K07','K07考試卷管理','/hrd/training/trExaminPapersC/list.html');" class="basica">K07考試卷管理</a><br>
		<a href="javascript:openUrl('K08','K08考試安排','/hrd/training/trExaminationArrangements/list.html');" class="basica">K08考試安排</a><br>
		<a href="javascript:openUrl('K09','K09在線考試','/hrd/training/trTestOnline/list.html');" class="basica">K09在線考試</a><br>
		<a href="javascript:openUrl('K10','K10考試監控','/hrd/training/trExaminationArrangements/monitor.html');" class="basica">K10考試監控</a><br>
		<a href="javascript:openUrl('K11','K11成績管理','/hrd/training/trAchievementManage/list.html');" class="basica">K11成績管理</a><br>
		<a href="javascript:openUrl('K12','K12閱卷管理','/hrd/training/trOnlineChecking/list.html');" class="basica">K12閱卷管理</a><br>
		<a href="javascript:openUrl('K13','K13考試結果導入','/hrd/training/trExamSorceImport/list.html');" class="basica">K13考試結果導入</a><br>
	</div>	
	<div  class="menuhead" onClick="menu(t4,tt4);" onmouseover="this.style.color='#FF6A00'" onmouseout="this.style.color='#333399'" >
		<img id='tt4' src="/hrd/Framework/Themes/images/frame/mclose.png" width="22" height="22" align="absmiddle">快速作業
	</div>
	<div id='t4' class="menubody" style="display:none">	
		<a href="javascript:openUrl('L21','L21快速訓練資料錄入','L21.html');" class="basica">L21快速訓練資料錄入</a><br>
		<a href="javascript:openUrl('L22','L22快速訓練資料錄入曆史查詢','L22.html');" class="basica">L22快速訓練資料錄入曆史查詢</a><br>
	</div>
	<div  class="menuhead" onClick="menu(t5,tt5);" onmouseover="this.style.color='#FF6A00'" onmouseout="this.style.color='#333399'" >
		<img id='tt5' src="/hrd/Framework/Themes/images/frame/mclose.png" width="22" height="22" align="absmiddle">曆史補登
	</div>
	<div id='t5' class="menubody" style="display:none">	
		<a href="javascript:openUrl('L20','L20教務員-曆史訓練補登','L20.html');" class="basica">L20教務員-曆史訓練補登</a><br>
	</div>
	<div  class="menuhead" onClick="menu(t6,tt6);" onmouseover="this.style.color='#FF6A00'" onmouseout="this.style.color='#333399'" >
		<img id='tt6' src="/hrd/Framework/Themes/images/frame/mclose.png" width="22" height="22" align="absmiddle">滿意度管理
	</div>
	<div id='t6' class="menubody" style="display:none">	
		<a href="javascript:openUrl('K01','K01衡量方式設計','/hrd/training/trTrainningMeasureC/list.html');" class="basica">K01衡量方式設計</a><br>
		<!-- <a href="javascript:openUrl('K02','K02滿意度問卷設計','/hrd/training/trSatisfactionQuesC/list.html');" class="basica">K02滿意度問卷設計</a><br> -->
		<a href="javascript:openUrl('K02','K02滿意度問卷設計','/hrd/training/trSatisfactionPaper/list.html');" class="basica">K02滿意度問卷設計</a><br>
		<a href="javascript:openUrl('K03','K03課後滿意度填寫','/hrd/training/trSatisfactionFill/list.html');" class="basica">K03課後滿意度填寫</a><br>
		<a href="javascript:openUrl('K04','K04課後滿意度結果導入','/hrd/training/trSatisfactionImport/list.html');" class="basica">K04課後滿意度結果導入</a><br>
	</div>
	<div  class="menuhead" onClick="menu(t7,tt7);" onmouseover="this.style.color='#FF6A00'" onmouseout="this.style.color='#333399'" >
		<img id='tt7' src="/hrd/Framework/Themes/images/frame/mclose.png" width="22" height="22" align="absmiddle">年度計劃
	</div>
	<div id='t7' class="menubody" style="display:none">	
		<a href="javascript:openUrl('X11','X11年度訓練計劃','/hrd/training/trAnnualTrainingPlan/list.html');" class="basica">X11年度訓練計劃</a><br>
		<a href="javascript:openUrl('X12','X12訓練計劃執行','/hrd/training/trTrainingPlanExecution/list.html');" class="basica">X12訓練計劃執行</a><br>
	</div>
	<div  class="menuhead" onClick="menu(t8,tt8);" onmouseover="this.style.color='#FF6A00'" onmouseout="this.style.color='#333399'" >
		<img id='tt8' src="/hrd/Framework/Themes/images/frame/mclose.png" width="22" height="22" align="absmiddle">系統管理
	</div>
	<div id='t8' class="menubody" style="display:none">	
		<a href="javascript:openUrl('L24','L24簽核流程設定','L24.html');" class="basica">L24簽核流程設定</a><br>
		<a href="javascript:openUrl('L35','L35外訓申請','L35.html');" class="basica">L35外訓申請</a><br>
		<a href="javascript:openUrl('X16','X16基礎數據接口','X16.html');" class="basica">X16基礎數據接口</a><br>
	</div>	
	<div  class="menuhead" onClick="menu(t9,tt9);" onmouseover="this.style.color='#FF6A00'" onmouseout="this.style.color='#333399'" >
		<img id='tt9' src="/hrd/Framework/Themes/images/frame/mclose.png" width="22" height="22" align="absmiddle">訓練分析
	</div>
	<div id='t9' class="menubody" style="display:none">	
		<a href="javascript:openUrl('X07','X07年度訓練指標','/hrd/training/trAnnualTrainingQuota/list.html');" class="basica">X07年度訓練指標</a><br>
		<a href="javascript:openUrl('X08','X08訓練指標KPI','/hrd/training/trainingKPI/list.html');" class="basica">X08訓練指標KPI</a><br>
	</div>
	<div  class="menuhead" onClick="menu(t10,tt10);" onmouseover="this.style.color='#FF6A00'" onmouseout="this.style.color='#333399'" >
		<img id='tt10' src="/hrd/Framework/Themes/images/frame/mclose.png" width="22" height="22" align="absmiddle">訓練設定
	</div>
	<div id='t10' class="menubody" style="display:none">	
		<a href="javascript:openUrl('L01','L01訓練方式設計','/hrd/training/trTrainingMethodsC/list.html');" class="basica">L01訓練方式設計</a><br>
		<a href="javascript:openUrl('L02','L02管理員課程分類','/hrd/training/trCourseTypeC/list.html');" class="basica">L02管理員課程分類</a><br>
		<a href="javascript:openUrl('L03','L03訓練費用分類','/hrd/training/trCostTypesC/list.html');" class="basica">L03訓練費用分類</a><br>
		<a href="javascript:openUrl('L04','L04標准課程設計','/hrd/training/trTypicalCourses/list.html');" class="basica">L04標准課程設計</a><br>
	</div>
	<div  class="menuhead" onClick="menu(t11,tt11);" onmouseover="this.style.color='#FF6A00'" onmouseout="this.style.color='#333399'" >
		<img id='tt11' src="/hrd/Framework/Themes/images/frame/mclose.png" width="22" height="22" align="absmiddle" >訓練需求
	</div>
	<div id='t11' class="menubody" style="display:none">	
		<a href="javascript:openUrl('X01','X01專業職能別設定','/hrd/training/trProfessionalFunctionsCs/list.html');" class="basica">X01專業職能別設定</a><br>
		<a href="javascript:openUrl('X02','X02職能設定','/hrd/training/trFunctionsC/list.html');" class="basica">X02職能設定</a><br>
		<a href="javascript:openUrl('X03','X03訓練地圖設定','/hrd/training/trTrainingMap/list.html');" class="basica">X03訓練地圖設定</a><br>
		<a href="javascript:openUrl('X04','X04訓練檢視','/hrd/training/trTrainingMapQuery/list.html');" class="basica">X04訓練檢視</a><br>
		<a href="javascript:openUrl('X10','X10部門年度訓練需求彙總','/hrd/training/trDepartAnnualTrainingQuery/list.html');" class="basica">X10部門年度訓練需求彙總</a><br>
	</div>	
	<div  class="menuhead" onClick="menu(t12,tt12);" onmouseover="this.style.color='#FF6A00'" onmouseout="this.style.color='#333399'" >
		<img id='tt12' src="/hrd/Framework/Themes/images/frame/mclose.png" width="22" height="22" align="absmiddle">證書管理
	</div>
	<div id='t12' class="menubody" style="display:none">	
		<a href="javascript:openUrl('L34','L34證書設定','/hrd/training/trTraineeCertificateC/list.html');" class="basica">L34證書設定</a><br>
		<a href="javascript:openUrl('ZSGL_TEST','證書管理','/hrd/training/trTraineeCertificateManager/list.html');" class="basica">證書管理</a><br>
	</div>
	<div  class="menuhead" onClick="menu(t13,tt13);" onmouseover="this.style.color='#FF6A00'" onmouseout="this.style.color='#333399'" >
		<img id='tt13' src="/hrd/Framework/Themes/images/frame/mclose.png" width="22" height="22" align="absmiddle">資源管理
	</div>
	<div id='t13' class="menubody" style="display:none">	
		<a href="javascript:openUrl('L28','L28訓練場地管理','/hrd/training/trTrainingSiteC/list.html');" class="basica">L28訓練場地管理</a><br>
		<a href="javascript:openUrl('L29','L29&L31講師管理','/hrd/training/trLecturer/list.html');" class="basica">L29&L31講師管理</a><br>
		<a href="javascript:openUrl('L30','L30訓練機構管理','/hrd/training/trTrainingOrganizationC/list.html');" class="basica">L30訓練機構管理</a><br>
		<a href="javascript:openUrl('L32','L32教材設備管理','/hrd/training/trEquipmentList/list.html');" class="basica">L32教材設備管理</a><br>
		<a href="javascript:openUrl('L33','L33教材設備申請','/hrd/training/trEquipmentBorrow/list.html');" class="basica">L33教材設備申請</a><br>
	</div>
	<div  class="menuhead" onClick="menu(t14,tt14);" onmouseover="this.style.color='#FF6A00'" onmouseout="this.style.color='#333399'" >
		<img id='tt14' src="/hrd/Framework/Themes/images/frame/mclose.png" width="22" height="22" align="absmiddle">組織管理
	</div>
	<div id='t14' class="menubody" style="display:none">	
		<a href="javascript:openUrl('o1','地區設定','/hrd/org/orgAreaC/list.html');" class="basica">地區設定</a><br>
		<a href="javascript:openUrl('o2','成本中心設定','/hrd/org/orgCostCenterC/list.html');" class="basica">成本中心設定</a><br>
		<a href="javascript:openUrl('o3','組織部門','/hrd/org/orgDepart/list.html');" class="basica">組織部門</a><br>
		<a href="javascript:openUrl('o4','部門主管','/hrd/org/orgDepartHead/list.html');" class="basica">部門主管</a><br>
	</div>
	<div  class="menuhead" onClick="menu(t15,tt15);" onmouseover="this.style.color='#FF6A00'" onmouseout="this.style.color='#333399'" >
		<img id='tt15' src="/hrd/Framework/Themes/images/frame/mclose.png" width="22" height="22" align="absmiddle">人事管理
	</div>
	<div id='t15' class="menubody" style="display:none">
		<a href="javascript:openUrl('h1','職位設定','/hrd/hr/hrPostC/list.html');" class="basica">職位設定</a><br>
		<a href="javascript:openUrl('h2','職等設定','/hrd/hr/hrDutyGradeC/list.html');" class="basica">職等設定</a><br>
		<a href="javascript:openUrl('h3','員工分類設定','/hrd/hr/hrEmpTypeC/list.html');" class="basica">員工分類設定</a><br>
		<a href="javascript:openUrl('h4','員工基本資料','/hrd/hr/hrEmployee/list.html');" class="basica">員工基本資料</a><br>
	</div>
	<div  class="menuhead" onClick="menu(t16,tt16);" onmouseover="this.style.color='#FF6A00'" onmouseout="this.style.color='#333399'" >
		<img id='tt16' src="/hrd/Framework/Themes/images/frame/mclose.png" width="22" height="22" align="absmiddle">系統管理
	</div>
	<div id='t16' class="menubody" style="display:none">
		<a href="javascript:openUrl('b1','國際化標簽設定','/hrd/sys/sysI18nC/list.html?init=y&tcode=I18NC&menuCode=i18n');" class="basica">國際化標簽設定</a><br>
		<a href="javascript:openUrl('b2','國際化下拉選項標簽設定','/hrd/sys/sysI18nSelectC/list.html?init=y&tcode=I18NSELECTC');" class="basica">國際化下拉選項標簽設定</a><br>
		<a href="javascript:openUrl('b3','通用查詢設定','/hrd/sys/sysQueryC/list.html?init=y&tcode=QUERYC');" class="basica">通用查詢設定</a><br>
		<a href="javascript:openUrl('b4','tcode設定','/hrd/sys/sysTcodeC/list.html?init=y&tcode=TCODEC');" class="basica">tcode設定</a><br>
		<a href="javascript:openUrl('b5','菜單設定','/hrd/sys/sysMenuC/list.html');" class="basica">菜單設定</a><br>
		<a href="javascript:openUrl('b6','用戶角色設定','/hrd/sys/sysRole/list.html');" class="basica">用戶角色設定</a><br>
		<a href="javascript:openUrl('b7','數據權限表設定','/hrd/sys/sysDataAuthTableC/list.html');" class="basica">數據權限表設定</a><br>
		<a href="javascript:openUrl('b8','數據權限設定','/hrd/sys/sysDataAuthC/list.html');" class="basica">數據權限設定</a><br>
		<a href="javascript:openUrl('b9','數據權限和角色/用戶關系設定','/hrd/sys/sysDataAuthRoleC/list.html');" class="basica">數據權限和角色/用戶關系設定</a><br>
		<a href="javascript:openUrl('b10','數據權限優先級調整','/hrd/sys/sysDataAuthCSort/list.html');" class="basica">數據權限優先級調整</a><br>
		<a href="javascript:openUrl('b11','LOV配置','/hrd/sys/sysLovMainC/list.html');" class="basica">LOV配置</a><br>
	</div>					
	</div>
	<div class="thr_rig_lis2" id="qrenwubox" style="display:none;">
	    <a href="javascript:openUrl('K01','K01衡量方式設計','/hrd/training/trTrainningMeasureC/list.html');" class="leftmenuf">K01衡量方式設計</a><br>
		<a href="javascript:openUrl('K02','K02滿意度問卷設計','/hrd/training/trSatisfactionQuesC/list.html');" class="leftmenuf">K02滿意度問卷設計</a><br>
		<a href="javascript:openUrl('K03','K03課後滿意度填寫','/hrd/training/trSatisfactionFill/list.html');" class="leftmenuf">K03課後滿意度填寫</a><br>
		<a href="javascript:openUrl('K04','K04課後滿意度結果導入','/hrd/training/trSatisfactionImport/list.html');" class="leftmenuf">K04課後滿意度結果導入</a><br>
		<a href="javascript:openUrl('K05','K05知識點管理','/hrd/training/trKnowledgePointsC/list.html');" class="leftmenuf">K05知識點管理</a><br>
		<a href="javascript:openUrl('K06','K06考試題庫管理','/hrd/training/trQuestions/list.html');" class="leftmenuf">K06考試題庫管理</a><br>
		<a href="javascript:openUrl('K07','K07考試卷管理','/hrd/training/trExaminPapersC/list.html');" class="leftmenuf">K07考試卷管理</a><br>
		<a href="javascript:openUrl('K08','K08考試安排','/hrd/training/trExaminationArrangements/list.html');" class="leftmenuf">K08考試安排</a><br>
		<a href="javascript:openUrl('K09','K09在線考試','K09.html');" class="leftmenuf">K09在線考試</a><br>
		<a href="javascript:openUrl('K10','K10考試監控','/hrd/training/trExaminationArrangements/monitor.html');" class="leftmenuf">K10考試監控</a><br>
		<a href="javascript:openUrl('K11','K11成績管理','/hrd/training/trExaminationArrangements/sorce.html');" class="leftmenuf">K11成績管理</a><br>
		<a href="javascript:openUrl('K12','K12閱卷管理','/hrd/training/trEquipmentList/list.html');" class="leftmenuf">K12閱卷管理</a><br>
		<a href="javascript:openUrl('K13','K13考試結果導入','/hrd/training/trExamSorceImport/list.html');" class="leftmenuf">K13考試結果導入</a><br>
		<a href="javascript:openUrl('L01','L01訓練方式設計','/hrd/training/trTrainingMethodsC/list.html');" class="leftmenuf">L01訓練方式設計</a><br>
		<a href="javascript:openUrl('L02','L02管理員課程分類','/hrd/training/trCourseTypeC/list.html');" class="leftmenuf">L02管理員課程分類</a><br>
		<a href="javascript:openUrl('L03','L03訓練費用分類','/hrd/training/trCostTypesC/list.html');" class="leftmenuf">L03訓練費用分類</a><br>
		<a href="javascript:openUrl('L04','L04標准課程設計','/hrd/training/trTypicalCourses/list.html');" class="leftmenuf">L04標准課程設計</a><br>
		<a href="javascript:openUrl('L05','L05班級管理作業','/hrd/training/trClasses/list.html');" class="leftmenuf">L05班級管理作業</a><br>
		<a href="javascript:openUrl('L06','L06內訓報名作業','L06.html');" class="leftmenuf">L06內訓報名作業</a><br>
		<a href="javascript:openUrl('L07','L07內訓報名作業-代申請','L07.html');" class="leftmenuf">L07內訓報名作業-代申請</a><br>
		<a href="javascript:openUrl('L08','L08訓練請假申請','L08.html');" class="leftmenuf">L08訓練請假申請</a><br>
		<a href="javascript:openUrl('L09','L09訓練請假申請-代申請','L09.html');" class="leftmenuf">L09訓練請假申請-代申請</a><br>
		<a href="javascript:openUrl('L10','L10個人課後報告','/hrd/training/trTraineeAfterschoolReport/list.html');" class="leftmenuf">L10個人課後報告</a><br>
		<a href="javascript:openUrl('L11','L11報告情況跟蹤','L11.html');" class="leftmenuf">L11報告情況跟蹤</a><br>
		<a href="javascript:openUrl('L12','L12報告查詢','L12.html');" class="leftmenuf">L12報告查詢</a><br>
		<a href="javascript:openUrl('L13','L13成績管理','L13.html');" class="leftmenuf">L13成績管理</a><br>
		<a href="javascript:openUrl('L14','L14外訓申請','/hrd/training/trOutsideTrain/list.html');" class="leftmenuf">L14外訓申請</a><br>	
		<a href="javascript:openUrl('L15','L15外訓申請-代申請','/hrd/training/trOutsideTrainAgent/list.html');" class="leftmenuf">L15外訓申請-代申請</a><br>
		<a href="javascript:openUrl('L16','L16外訓費用報銷及結案','/hrd/training/trOutsideTrainCost/list.html');" class="leftmenuf">L16外訓費用報銷及結案</a><br>
		<a href="javascript:openUrl('L17','L17外訓費用報銷及結案代申請','/hrd/training/trOutsideTrainAgentCost/list.html');" class="leftmenuf">L17外訓費用報銷及結案代申請</a><br>
		<a href="javascript:openUrl('L18','L18結案管理','L18.html');" class="leftmenuf">L18結案管理</a><br>
		<a href="javascript:openUrl('L19','L19訓練費用維護','/hrd/training/trTrainingCost/list.html');" class="leftmenuf">L19訓練費用維護</a><br>
		<a href="javascript:openUrl('L20','L20曆史訓練補登','L20.html');" class="leftmenuf">L20曆史訓練補登</a><br>
		<a href="javascript:openUrl('L21','L21快速訓練資料錄入','L21.html');" class="leftmenuf">L21快速訓練資料錄入</a><br>
		<a href="javascript:openUrl('L22','L22快速訓練資料錄入曆史查','L22.html');" class="leftmenuf">L22快速訓練資料錄入曆史查詢</a><br>
		<a href="javascript:openUrl('L23','L23待審批信息','L23.html');" class="leftmenuf">L23待審批信息</a><br>
		<a href="javascript:openUrl('L24','L24簽核流程設定','L24.html');" class="leftmenuf">L24簽核流程設定</a><br>
		<a href="javascript:openUrl('L25','L25學習記錄','/hrd/training/trPersonTrainingQuery/list.html');" class="leftmenuf">L25學習記錄</a><br>
		<a href="javascript:openUrl('L26','L26證書記錄','/hrd/training/trPersonCertificateQuery/list.html');" class="leftmenuf">L26證書記錄</a><br>
		<a href="javascript:openUrl('L27','L27部門訓練查詢','/hrd/training/trDepartTrainingQuery/list.html');" class="leftmenuf">L27部門訓練查詢</a><br>
		<a href="javascript:openUrl('L28','L28訓練場地管理','/hrd/training/trTrainingSiteC/list.html');" class="leftmenuf">L28訓練場地管理</a><br>
		<a href="javascript:openUrl('L29&L31','L29&L31講師管理','/hrd/training/trLecturer/list.html');" class="leftmenuf">L29&L31講師管理</a><br>
		<a href="javascript:openUrl('L30','L30訓練機構管理','/hrd/training/trTrainingOrganizationC/list.html');" class="leftmenuf">L30訓練機構管理</a><br>
		<a href="javascript:openUrl('L32','L32教材設備管理','/hrd/training/trEquipmentList/list.html');" class="leftmenuf">L32教材設備管理</a><br>
		<a href="javascript:openUrl('L33','L33教材設備申請','/hrd/training/trEquipmentBorrow/list.html');" class="leftmenuf">L33教材設備申請</a><br>
		<a href="javascript:openUrl('L34','L34證書設定','/hrd/training/trTraineeCertificateC/list.html');" class="leftmenuf">L34證書設定</a><br>
		<a href="javascript:openUrl('L35','L35外訓申請','L35.html');" class="leftmenuf">L35外訓申請</a><br>
		<a href="javascript:openUrl('X01','X01專業職能別設定','/hrd/training/trProfessionalFunctionsCs/list.html');" class="leftmenuf">X01專業職能別設定</a><br>
		<a href="javascript:openUrl('X02','X02職能設定','/hrd/training/trFunctionsC/list.html');" class="leftmenuf">X02職能設定</a><br>
		<a href="javascript:openUrl('X03','X03訓練地圖設定','/hrd/training/trTrainingMap/list.html');" class="leftmenuf">X03訓練地圖設定</a><br>
		<a href="javascript:openUrl('X04','X04訓練檢視','/hrd/training/trTrainingMapQuery/list.html');" class="leftmenuf">X04訓練檢視</a><br>
		<a href="javascript:openUrl('X07','X07年度訓練指標','X07.html');" class="leftmenuf">X07年度訓練指標</a><br>
		<a href="javascript:openUrl('X08','X08訓練指標KPI','X08.html');" class="leftmenuf">X08訓練指標KPI</a><br>
		<a href="javascript:openUrl('X09','X09部門年度訓練需求','/hrd/training/trDepartAnnualTraining/list.html');" class="leftmenuf">X09部門年度訓練需求</a><br>		
		<a href="javascript:openUrl('X10','X10年度訓練需求彙總','/hrd/training/trDepartAnnualTrainingQuery/list.html');" class="leftmenuf">X10年度訓練需求彙總</a><br>
		<a href="javascript:openUrl('X11','X11年度訓練計劃','/hrd/training/trAnnualTrainingPlan/list.html');" class="leftmenuf">X11年度訓練計劃</a><br>
		<a href="javascript:openUrl('X12','X12訓練計劃執行','/hrd/training/trTrainingPlanExecution/list.html');" class="leftmenuf">X12訓練計劃執行</a><br>
		<a href="index.html" class="leftmenuf">X13自定首頁</a><br>
		<a href="javascript:openUrl('X14','X14個人學習地圖維護','/hrd/training/trPersonTrainingMap/list.html');" class="leftmenuf">X14個人學習地圖維護</a><br>
		<a href="javascript:openUrl('X15','X15個人學習檢討','/hrd/training/trPersonMapQuery/list.html');" class="leftmenuf">X15個人學習檢討</a><br>
		<a href="javascript:openUrl('X16','X16基礎數據接口','X16.html');" class="leftmenuf">X16基礎數據接口</a><br>
		<a href="javascript:openUrl('X17','X17訓練分析','X17.html');" class="leftmenuf">X17訓練分析</a><br>
	</div>
</div>
