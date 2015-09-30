<?php
/**
 * Class contact
 *
 * 有關於使用者的所有函式
 *.
 * @author Ryan Chiu <[email]ryan@inetar.net[/email]>
 * @version 1.0
 * @date 2009/4/29 7:43:26
 */


class competency 
{

    public $behavior_id_row=array();
    public $competency_id_row=array();
    public $basis_evaluation_evaluator_id_row=array();
    
    public $appraisee_profile=array();
    public $behavior_profile=array();
    public $evaluator_row=array();
    public $competency_structure=array();    
    
    public $profile_behavior_detail=array();
    public $profile_behavior=array();
    public $profile_competency_detail=array();
    public $profile_competency =array();
    
    
	function __construct(&$db)
	{
		$this->db=$db;
	}

	//更新受評人的評鑑表進度
	function update_table_process($basis_evaluation_evaluator_id)
	{
	    //**更新該受評人所屬的評鑑表的總體進度 (*Tabel -> Appraisee -> Evalutor )
	    $basis_evaluation_table_process = $this->db->avg("basis_evaluation_appraisee", "basis_evaluation_progress", array(
	        "basis_evaluation_table_id" =>$basis_evaluation_table_id
	    ));
	    
	    //echo '<br>更新評鑑表:'.$basis_evaluation_table_id.'進度<br>';
	    $this->db->update('basis_evaluation_table',
	        array('basis_evaluation_table_process'=>$basis_evaluation_table_process),
	        array('basis_evaluation_table_id'=>$basis_evaluation_table_id)
	    );
	}	
	
	//更新受評人進度
	function update_appraisee_process($basis_evaluation_appraisee_id)
	{
	    $average = $this->db->avg("basis_evaluation_evaluator", "basis_evaluation_evaluator_progress", 
	        array('basis_evaluation_appraisee_id'=>$basis_evaluation_appraisee_id));
	    
	    $this->db->update('basis_evaluation_appraisee',array('basis_evaluation_progress'=>$average),array('basis_evaluation_appraisee_id'=>$basis_evaluation_appraisee_id));	    
	}

	//更新受評人下的評鑑人進度
	function update_evaluator_process($basis_evaluation_table_id)
	{
	     
	}	
	
    /**
     * @param unknown $option /basis_evaluation_appraisee_id / basis_evaluation_table_id
     */
    function update_progress($option)
    {
        $basis_evaluation_appraisee_id=$option['basis_evaluation_appraisee_id'];
        $basis_evaluation_table_id=$option['basis_evaluation_table_id'];
        
        $this->update_appraisee_process($basis_evaluation_appraisee_id);
                
        
        if(!$basis_evaluation_table_id)
        {
            $rows=$this->db->select('basis_evaluation_evaluator','*',array('basis_evaluation_appraisee_id'=>$option['basis_evaluation_appraisee_id']));
            $basis_evaluation_table_id=$rows[0]['basis_evaluation_table_id'];
        }
        
        $this->update_table_process($basis_evaluation_evaluator_id);
    }
    
    function avg($row)
    {
        $sum=array_sum($row);      //此關係群，所有行為的分數
        $count=count($row);
        return $avg=($count>0)?($sum/$count):0;
    }
       
    /** 
     * 更新 basis_evaluation_evaluator_detail 及 basis_evaluation_evaluator_competeny
     * @param unknown $basis_evaluation_evaluator_id
     * @param unknown $basis_evaluation_appraisee_id
     */
    function update_basis_evaluation_evaluator_competeny($basis_evaluation_evaluator_id,$basis_evaluation_appraisee_id)
    {
        #找出這個 評鑑表之受評人 需要哪些 behavior_id (整理職能/行為)
        if(!$this->behavior_id_row)
        {
            $rows=$this->db->select('basis_evaluation_appraisee',array(
                "[>]basis_evaluation_table"=>"basis_evaluation_table_id",
                "[>]competency"=>"competency_model_id",
                "[>]behavior"=>"competency_id"
            ),'*',array('basis_evaluation_appraisee_id'=>$basis_evaluation_appraisee_id));        
             
            //整理
            if($rows)
            {
                foreach($rows as $row)
                {
                    $appraisee_uid=$row['appraisee_uid'];
                    
                    $this->competency_id_row[$row['competency_id']]=$row['competency_id'];
                    $this->behavior_id_row[$row['behavior_id']]=$row['behavior_id'];
                    $this->behavior_profile[$row['behavior_id']]=$row;
                    $this->competency_structure[$row['competency_id']][$row['behavior_id']]=$row['behavior_id'];                      
                }
            }
        }     
        
        #再找出這個評鑑人的評鑑資料及關係
        /*
        $rows = $this->db->get('basis_evaluation_evaluator', '*', array(
            'basis_evaluation_evaluator_id' => $basis_evaluation_evaluator_id
        ));
        $basis_evaluation_evaluator_relation=$rows['basis_evaluation_evaluator_relation'];
        */
        
        #整理評鑑的資料
        if($_rows = $this->db->select('basis_evaluation_evaluator_detail', '*', array(
            'basis_evaluation_evaluator_id' => $basis_evaluation_evaluator_id
        )))
        {
            foreach($_rows as $row)
            {
                $_behavior=$row['behavior_id'];
                $_competency_id= $this->behavior_profile[$_behavior]['competency_id'];
                $_weight= $this->behavior_profile[$_behavior]['weight'];
                
                $basis_ec_row[$_competency_id]['grade'][$_behavior]=$row['evaluation_scale_item_grade'];
                $basis_ec_row[$_competency_id]['weight'][$_behavior]=$_weight;
                $basis_ec_row[$_competency_id]['weight_grade'][$_behavior]=$_weight*$row['evaluation_scale_item_grade'];;
            }
        }
        
        #讀出資料庫內的評鑑資料
        if($rows=$db->select('basis_evaluation_evaluator_competeny','*',array('AND'=>array(
            'competency_id'=>$this->competency_id_row,
            'basis_evaluation_evaluator_id'=>$basis_evaluation_evaluator_id
        ))))
        {
            foreach($rows as $row)
            {
                $db_basis_ec_row[$row['competency_id']]=$row;
            }
        }
        
        foreach($this->competency_id_row as $competency_id)
        {
            $count=array_sum($basis_ec_row[$competency_id]['weight']);
            
            $sum=array_sum($basis_ec_row[$competency_id]['weight_grade']);
            
            $basis_ec_row[$competency_id]['evaluation_competency_grade']=
                ($count>0)?($sum/$count):'0';
            
            if(isset($db_basis_ec_row[$competency_id]))
            {
                //若存在則更新
                $this->db->update('basis_evaluation_evaluator_competeny',array(
                	'evaluation_competency_grade'=>$basis_ec_row[$competency_id]['evaluation_competency_grade']
                ),array(
                	'basis_evaluation_evaluator_competency_id'=>$db_basis_ec_row[$competency_id]['basis_evaluation_evaluator_competency_id']
                ));
            }
            else 
            {
                //不存在則新增
                $this->db->insert('basis_evaluation_evaluator_competeny',array(
                    'evaluation_competency_grade'=>$basis_ec_row[$competency_id]['evaluation_competency_grade'],
                    'basis_evaluation_evaluator_id'=>$basis_evaluation_evaluator_id,
                    'competency_id'=>$competency_id                    
                ));                
            }
        }
    }
    
    /**
     * 整理此評鑑表(評鑑人)的profiles
     * 會產出 profile_behavior profile_behavior_detail profile_competency profile_competency_detail
     */
    function calculate_appraisee_profile($basis_evaluation_appraisee_id)
    {        
        #找出這個 評鑑表之受評人 有哪些評鑑人及關係        
        if($rows = $this->db->select('basis_evaluation_evaluator', '*', array(
            'basis_evaluation_appraisee_id' => $basis_evaluation_appraisee_id
        )))
        {
            foreach ($rows as $row) {
                $this->basis_evaluation_evaluator_id_row[$basis_evaluation_appraisee_id][$row['basis_evaluation_evaluator_id']] = $row['basis_evaluation_evaluator_id'];
                $this->evaluator_profile[$row['basis_evaluation_evaluator_id']] = $row;
        
                //有幾種關係
                $relation_id_row[$row['basis_evaluation_evaluator_relation']] = $row['basis_evaluation_evaluator_relation'];
            }
        }
        

        
        #找出這個 評鑑表之受評人 需要哪些 behavior_id (整理職能/行為)
        if(!$this->behavior_id_row)
        {
            $rows=$this->db->select('basis_evaluation_appraisee',array(
                "[>]basis_evaluation_table"=>"basis_evaluation_table_id",
                "[>]competency"=>"competency_model_id",
                "[>]behavior"=>"competency_id"
            ),'*',array('basis_evaluation_appraisee_id'=>$basis_evaluation_appraisee_id));        
             
            //整理
            if($rows)
            {
                foreach($rows as $row)
                {
                    $appraisee_uid=$row['appraisee_uid'];
                    $this->appraisee_profile[$row['basis_evaluation_appraisee_id']]=array(
                    	'basis_evaluation_appraisee_id'=>$row['basis_evaluation_appraisee_id'],
                        'appraisee_uid'=>$row['appraisee_uid']
                    );                    
                  
                    $this->competency_id_row[$row['competency_id']]=$row['competency_id'];
                    $this->behavior_id_row[$row['behavior_id']]=$row['behavior_id'];
                    $this->behavior_profile[$row['behavior_id']]=$row;
                    $this->competency_structure[$row['competency_id']][$row['behavior_id']]=$row['behavior_id'];                      
                }
            }
        }
        else 
        {
            $row=$this->db->get('basis_evaluation_appraisee','*',array('basis_evaluation_appraisee_id'=>$basis_evaluation_appraisee_id));
            $this->appraisee_profile[$row['basis_evaluation_appraisee_id']]=$row; 
            $appraisee_uid=$row['appraisee_uid'];
           
        }

        
        #評鑑分數整理
        if ($rows = $this->db->select('basis_evaluation_evaluator_detail', '*',
            array('basis_evaluation_evaluator_id'=>$this->basis_evaluation_evaluator_id_row[$basis_evaluation_appraisee_id]))) {
            foreach ($rows as $row) {
    
                // 簡易參數
                $behavior_id = $row['behavior_id'];
                $grade = $row['evaluation_scale_item_grade'];
                $basis_evaluation_evaluator_id=$row['basis_evaluation_evaluator_id'];    
                $basis_evaluation_evaluator_uid=$this->evaluator_profile[$basis_evaluation_evaluator_id]['basis_evaluation_evaluator_uid'];                
                $relation_id = $this->evaluator_profile[$basis_evaluation_evaluator_id]['basis_evaluation_evaluator_relation'];                
                $competency_id=$this->behavior_profile[$row['behavior_id']]['competency_id'];    
                try {
                    /*
                    echo '<br>$appraisee_uid'.$appraisee_uid;
                    echo '<br>$$competency_id'.$competency_id;
                    echo '<br>$$behavior_id'.$behavior_id;
                    echo '<br>$$relation_id'.$relation_id;
                    echo '<br>$$basis_evaluation_evaluator_id'.$basis_evaluation_evaluator_id;
                    */
                    $profile_behavior_row[$appraisee_uid][$competency_id][$behavior_id][$relation_id][$basis_evaluation_evaluator_uid]=$grade;
                    
                }
                catch (Exception $e)
                {
                    echo 'Caught exception: ',  $e->getMessage(), "\n";
                }         
             }   


             
            //計算出 算術平均 和 幾何平均
            foreach($profile_behavior_row[$appraisee_uid] as $competency_id => $row)
            {                
                foreach($row as $behavior_id=>$row2)
                {
                    unset($total_sum);
                    unset($total_count);
                    
                    foreach($row2 as $relation_id => $row3)
                    {          
                        //收集每一評鑑者評鑑出的分數
                        //(處理basis_evaluation_evaluator_competeny)
                        foreach($row3 as $basis_evaluation_evaluator_uid => $grade)
                        {
  
                            
                            $profile_competency_row[$appraisee_uid][$competency_id][$relation_id][$basis_evaluation_evaluator_uid]['grade'][$behavior_id]=$grade;
                            $profile_competency_row[$appraisee_uid][$competency_id][$relation_id][$basis_evaluation_evaluator_uid]['weight'][$behavior_id]=$this->behavior_profile[$behavior_id]['weight'];
                            $profile_competency_row[$appraisee_uid][$competency_id][$relation_id][$basis_evaluation_evaluator_uid]['weighted_grade'][$behavior_id]=$grade * $this->behavior_profile[$behavior_id]['weight'];
                            unset($_row);
                        }
                        
                        
                        //去除自評
                        if($relation_id==1) continue;
                        
                        //算出此關係的算術平均                              
                        $profile_behavior_detail[$appraisee_uid][$behavior_id]['behavior_arithmetic_avg'][$relation_id]=
                            $this->avg($row3);

                        $total_sum+=array_sum($row3);
                        $total_count+=count($row3);
                    }    
                    

                                    
                    /**
                    結算‧行為 (算術平均 和 幾何平均)
                    */
                    $behavior_arithmetic_avg=($total_count>0)?($total_sum/$total_count):0;                
                    $profile_behavior[$appraisee_uid][$behavior_id ]['behavior_arithmetic_avg']=$behavior_arithmetic_avg;                       

                    $profile_behavior[$appraisee_uid][$behavior_id ]['behavior_geometric_avg']=
                        $this->avg($profile_behavior_detail[$appraisee_uid][$behavior_id]['behavior_arithmetic_avg']);                    
                }   //$behavior_id 

         

                
                #當此職能下的行為指標，數據都收集完成後，才可以做處理
                //(處理basis_evaluation_evaluator_competeny)
                foreach($profile_competency_row[$appraisee_uid][$competency_id] as $relation_id =>$crow1)
                {
                    //算出每個評鑑者 為 受評人 的 職能分數
                    //$_row['grade'][$behavior_id]
                    foreach($crow1 as $basis_evaluation_evaluator_uid => $crow2)
                    {                            
                        $_sum=array_sum($crow2['weighted_grade']);
                        $_count=array_sum($crow2['weight']);
                        $_avg=($_count>0)?($_sum/$_count):0;
                        
                       // echo '$_sum/$_count =>'.$_sum.'/'.$_count.'= avg:'.$_avg.'<br>';
                        
                        $basis_evaluation_evaluator_competency[$competency_id][$relation_id][$basis_evaluation_evaluator_uid]=$_avg;
                        
                        if($relation_id!='1')
                        {
                            $basis_evaluation_evaluator_competency[$competency_id]["ALL"][$basis_evaluation_evaluator_uid]=$_avg;
                        }                        
                    }
                }
                


                
                //算出受評人每個職能 在 某關係的 算術平均術
                foreach($basis_evaluation_evaluator_competency[$competency_id] as $relation_id =>$crow1)
                {                                
                   // $basis_evaluation_evaluator_competency[$competency_id][$relation_id];
                   
                    if($relation_id!="ALL")
                    { 
                        //依關係算出值
                        $_avg=$this->avg($basis_evaluation_evaluator_competency[$competency_id][$relation_id]);
                        $profile_competency_detail[$appraisee_uid][$competency_id]['arithmetic_avg'][$relation_id]=$_avg;
                    }
                    else 
                    {                        
                        $_avg=$this->avg($basis_evaluation_evaluator_competency[$competency_id]["ALL"]);
                        $profile_competency[$appraisee_uid][$competency_id]['arithmetic_avg']=$_avg;
                    }
                }              
                
                //職能的幾何平均數                
                $tmp_profile_competency_detail[$appraisee_uid][$competency_id]['arithmetic_avg']=$profile_competency_detail[$appraisee_uid][$competency_id]['arithmetic_avg'];
                //扣掉自評
                unset($tmp_profile_competency_detail[$appraisee_uid][$competency_id]['arithmetic_avg'][1]);                
                $_profile_competency_geometric_avg=$this->avg($tmp_profile_competency_detail[$appraisee_uid][$competency_id]['arithmetic_avg']);
                $profile_competency[$appraisee_uid][$competency_id]['geometric_avg']=$_profile_competency_geometric_avg;               
            }//$competency_id            
            #結算‧職能            
        } 
        
        $this->profile_competency=$profile_competency;
        $this->profile_competency_detail=$profile_competency_detail;
        $this->profile_behavior=$profile_behavior;
        $this->profile_behavior_detail=$profile_behavior_detail;        
    }//function
    
    function update_appraisee_profile($basis_evaluation_appraisee_id)
    {
        $appraisee_uid=$this->appraisee_profile[$basis_evaluation_appraisee_id]['appraisee_uid'];
                
        /** 
         * 開始處理   $profile_behavior
         */
        $profile_behavior=$this->profile_behavior[$appraisee_uid];

        $db_profile_behavior=$this->db->select('profile_behavior','*',array(
            'AND'=>array('behavior_id'=>$this->behavior_id_row,'user_id'=>$appraisee_uid)));

        foreach($db_profile_behavior as $row)
        {
            $behavior_id=$row['behavior_id'];
            if(isset($profile_behavior[$behavior_id]))
            {
                //若存在，則更新
                $this->db->update('profile_behavior',array(
                	'behavior_arithmetic_avg'=>$profile_behavior[$behavior_id]['behavior_arithmetic_avg'],
                    'behavior_geometric_avg'=>$profile_behavior[$behavior_id]['behavior_geometric_avg']                    
                ),array(
                    'profile_behavior_id'=>$row['profile_behavior_id']                	
                ));
                unset($profile_behavior[$behavior_id]);
            }            
        }
        
        
        if($profile_behavior)
        {
            foreach($profile_behavior as $behavior_id=>$row)
            {
                $this->db->insert('profile_behavior',array(
                    'behavior_id'=>$behavior_id,
                    'user_id'=>$appraisee_uid,
                    'behavior_arithmetic_avg'=>$profile_behavior[$behavior_id]['behavior_arithmetic_avg'],
                    'behavior_geometric_avg'=>$profile_behavior[$behavior_id]['behavior_geometric_avg']                	
                ));                
            }
        }

        /**
         * 開始處理   $profile_behavior_detail
         */      
        $profile_behavior_detail=$this->profile_behavior_detail[$appraisee_uid];
        $db_profile_behavior_detail=$this->db->select('profile_behavior_detail','*',array(
            'AND'=>array('behavior_id'=>$this->behavior_id_row,'user_id'=>$appraisee_uid)));

        foreach($db_profile_behavior_detail as $row)
        {
            $behavior_id=$row['behavior_id'];
            $evaluation_relation_id=$row['evaluation_relation_id'];
            
            if(isset($profile_behavior_detail[$behavior_id]['behavior_arithmetic_avg'][$evaluation_relation_id]))
            {
                //若存在，則更新
                $this->db->update('profile_behavior_detail',array(
                    'behavior_arithmetic_avg'=>$profile_behavior_detail[$behavior_id]['behavior_arithmetic_avg'][$evaluation_relation_id]                   
                ),array(
                    'profile_behavior_id'=>$row['profile_behavior_id']
                ));
            
                unset($profile_behavior_detail[$behavior_id]['behavior_arithmetic_avg'][$evaluation_relation_id]);
            }
        }
                
        if($profile_behavior_detail)
        {
            foreach($profile_behavior_detail as $behavior_id=>$row)
            {
                foreach($row['behavior_arithmetic_avg'] as $evaluation_relation_id=>$behavior_arithmetic_avg)
                {
                    $this->db->insert('profile_behavior_detail',array(
                        'behavior_id'=>$behavior_id,
                        'evaluation_relation_id'=>$evaluation_relation_id,
                        'user_id'=>$appraisee_uid,
                        'behavior_arithmetic_avg'=>$behavior_arithmetic_avg                 
                    ));                 
                }
            }
        }

        
        /**
         * 開始處理   $profile_competency
         */
         $profile_competency=$this->profile_competency[$appraisee_uid];
        $db_profile_competency=$this->db->select('profile_competency','*',array(
            'AND'=>array('competency_id'=>$this->competency_id_row,'user_id'=>$appraisee_uid)));

        foreach($db_profile_competency as $row)
        {
            $competency_id=$row['competency_id'];
            if(isset($profile_competency[$competency_id]))
            {
                //若存在，則更新
                $this->db->update('profile_competency',array(
                    'arithmetic_avg'=>$profile_competency[$competency_id]['arithmetic_avg'],
                    'geometric_avg'=>$profile_competency[$competency_id]['geometric_avg']
                ),array(
                    'profile_competency_id'=>$row['profile_competency_id']
                ));
              
                unset($profile_competency[$competency_id]);
            }
        }
        
        
        if($profile_competency)
        {
            foreach($profile_competency as $competency_id=>$row)
            {
                $this->db->insert('profile_competency',array(
                    'competency_id'=>$competency_id,
                    'user_id'=>$appraisee_uid,
                    'arithmetic_avg'=>$profile_competency[$competency_id]['arithmetic_avg'],
                    'geometric_avg'=>$profile_competency[$competency_id]['geometric_avg']
                ));
         
            }
        }       
    
         
        /**
         * 開始處理   $profile_competency_detail
         */
        $profile_competency_detail=$this->profile_competency_detail[$appraisee_uid];
        $db_profile_competency_detail=$this->db->select('profile_competency_detail','*',array(
            'AND'=>array('competency_id'=>$this->competency_id_row,'user_id'=>$appraisee_uid)));

        foreach($db_profile_competency_detail as $row)
        {
            $competency_id=$row['competency_id'];
            $evaluation_relation_id=$row['evaluation_relation_id'];
        
            if(isset($profile_competency_detail[$competency_id]['arithmetic_avg'][$evaluation_relation_id]))
            {
                //若存在，則更新
                $this->db->update('profile_competency_detail',array(
                    'arithmetic_avg'=>$profile_competency_detail[$competency_id]['arithmetic_avg'][$evaluation_relation_id]
                ),array(
                    'profile_competency_detail_id'=>$row['profile_competency_detail_id']
                ));                
                
                unset($profile_competency_detail[$competency_id]['arithmetic_avg'][$evaluation_relation_id]);
            }
        }
        
        if($profile_competency_detail)
        {
            foreach($profile_competency_detail as $competency_id=>$row)
            {
                foreach($row['arithmetic_avg'] as $evaluation_relation_id=>$arithmetic_avg)
                {
                    $this->db->insert('profile_competency_detail',array(
                        'competency_id'=>$competency_id,
                        'evaluation_relation_id'=>$evaluation_relation_id,
                        'user_id'=>$appraisee_uid,
                        'arithmetic_avg'=>$arithmetic_avg
                    ));
                   
                }
            }
        }                        
    }

    function release_appraisee_profile($basis_evaluation_appraisee_id)
    {
        $appraisee_uid=$this->appraisee_profile[$basis_evaluation_appraisee_id]['appraisee_uid'];
        unset($this->profile_behavior[$appraisee_uid]);
        unset($this->profile_behavior_detail[$appraisee_uid]);
        unset($this->profile_competencyr[$appraisee_uid]);
        unset($this->profile_competency_detail[$appraisee_uid]);
    }
    
    
    function calculate_competency($option)
    {
        //A.針對此行為, 關係分類         的平均分數 （沒有算數及幾何的問題 不考量權重, 此關係群中 所有針對 此行為 的分數 加總平均）
        //B.針對此行為（不分關係類）的算數分數 (不考量權重,  所有分數 加總平均)
        //C.針對此行為（不分關係類）的幾何分數 (不考量權重,  四個A成績 加總 / 4)
    
        // $option['basis_evaluation_appraisee_id']
    
        // --> 找出這個 受評人 需要哪些 behavior_id
        if(!$option['behavior_id_row'])
        {
            $rows=$this->db->select('basis_evaluation_appraisee',array(
                "[>]basis_evaluation_table"=>"basis_evaluation_table_id",
                "[>]competency"=>"competency_model_id",
                "[>]behavior"=>"competency_id"
            ),'*',array('basis_evaluation_appraisee_id'=>$option['basis_evaluation_appraisee_id']));
    
             
            //整理
            if($rows)
            {
                foreach($rows as $row)
                {
                    $option['behavior_id_row'][$row['behavior_id']]=$row['behavior_id'];
                    $option['behavior'][$row['behavior_id']]=$row;
    
                    $_hash_competency[$row['behavior_id']]=$row['competency_id'];
                }
            }
        }
    
    
    
        // -->  找出這個 受評人 有哪些評鑑人及關係
        $rows=$this->db->select('basis_evaluation_evaluator','*',array('basis_evaluation_appraisee_id'=>$option['basis_evaluation_appraisee_id']));
    
        foreach($rows as $row)
        {
            $basis_evaluation_evaluator_id_row[]=$row['basis_evaluation_evaluator_id'];
            $evaluator_row[$row['basis_evaluation_evaluator_id']]=$row;
            $relation_id_row[$row['basis_evaluation_evaluator_relation']]=$row['basis_evaluation_evaluator_relation'];
        }
    
        if($rows=$this->db->select('basis_evaluation_evaluator_detail','*'))
        {
            foreach($rows as $row)
            {
                //behavior_geometric_avg
    
                #簡易參數
                $behavior_id=$row['behavior_id'];
                    $relation_id=$evaluator_row[$row['basis_evaluation_evaluator_id']]['basis_evaluation_evaluator_relation'];
                        $grade=$row['evaluation_scale_item_grade'];
    
                            #分類整理
                            $behavior_grade[$behavior_id][0]['total_grade']+=$grade;
                            $behavior_grade[$behavior_id][0]['count']++;
                             
                            $behavior_grade[$behavior_id][$relation_id]['total_grade']+=$grade;
                            $behavior_grade[$behavior_id][$relation_id]['count']++;
    
                            #陣列處理
                            $_behavior_id_row[$behavior_id]=$behavior_id;
                            $_competency_id_row[$competency_id]=$competency_id;
            }
    
            //開始計算每個行為的數值
            foreach($_behavior_id_row as $behavior_id)
            {
            $competency_id=$_hash_competency[$behavior_id];
            $behavior_weight=$option['behavior'][$behavior_id]['weight'];
                $competency_grade[$competency_id][0]['total_weight']+=$behavior_weight;
    
                    foreach($relation_id_row as $relation_id)
                    {
                    //行為的算術平均數, 分關係的行為分數 (behavior_arithmetic_avg=behavior_geometric_avg)
                IF($behavior_grade[$behavior_id][$relation_id]['count'])
                    {
                    $_behavior_arithmetic_avg=
                    $behavior_grade[$behavior_id][$relation_id]['total_grade']/$behavior_grade[$behavior_id][$relation_id]['count'];
                }
                $behavior_grade[$behavior_id][$relation_id]['behavior_arithmetic_avg']=$_behavior_arithmetic_avg;
                    $behavior_grade[$behavior_id][$relation_id]['behavior_geometric_avg']=$_behavior_arithmetic_avg;
    
                        $behavior_grade[$behavior_id][0]['total_relation_grade']+=$_behavior_arithmetic_avg;
                        $behavior_grade[$behavior_id][0]['total_relation_count']++;
    
                    $_total_weighted_grade=$behavior_grade[$behavior_id][$relation_id]['total_grade']*$behavior_weight;
                    $competency_grade[$competency_id][$relation_id]['total_weighted_grade']+=$_total_weighted_grade;
                    $competency_grade[$competency_id][0]['total_weighted_grade']+=$_total_weighted_grade;
    
                    $competency_grade[$competency_id][$relation_id]['count']=$behavior_grade[$behavior_id][$relation_id]['count'];
    
                    $competency_grade[$competency_id][$relation_id]['behavior_row'][$behavior_id]=
                    'total_grade:'.$behavior_grade[$behavior_id][$relation_id]['total_grade'].'/count:'.$behavior_grade[$behavior_id][$relation_id]['count'];
                     
            }
    
            //此行為的算數平均數
            if($behavior_grade[$behavior_id][0]['count'])
            {
            $behavior_grade[$behavior_id][0]['behavior_arithmetic_avg']=
            $behavior_grade[$behavior_id][0]['total_grade']/$behavior_grade[$behavior_id][0]['count'];
            }
    
                //此行為的幾何平均數
                if($behavior_grade[$behavior_id][0]['total_relation_count'])
                {
                $behavior_grade[$behavior_id][0]['behavior_geometric_avg']=
                $behavior_grade[$behavior_id][0]['total_relation_grade']/$behavior_grade[$behavior_id][0]['total_relation_count'];
                }
                }
    
                //D.針對此職能, 關係分類         的算數分數（該關係群中 每一(B類成績x行為權重) 的 加總除權平均）
                //E.針對此職能, 關係分類         的幾何分數 （該關係群中 每一(C類成績x行為權重) 的 加總除權平均）
    
                    //F.針對此職能（全部關係）的算數分數（屬於該職能的  SUM（行為成績x行為權重） /權重總和 /筆數 ）
                    //G.針對此職能（全部關係）的幾何分數（依關係分類，算出四大關係個別的平均分數 [SUM（行為成績x行為權重） /權重總和 /筆數 ]，再除於四）
    
                    foreach($competency_grade as $competency_id => $row)
                    {
    
                        //職能的算術平均數
                        $competency_grade[$competency_id][0]['arithmetic_avg']=
                        $competency_grade[$competency_id][0]['total_weighted_grade']/$competency_grade[$competency_id][0]['total_weight'];
                             
                            foreach($row as $relation_id => $row1)
                            {
                            if($relation_id>0)
                            {
                            $competency_grade[$competency_id][0]['count']+=
                            $competency_grade[$competency_id][$relation_id]['count'];
                             
    
                            if(($competency_grade[$competency_id][0]['total_weight'])>0 && $competency_grade[$competency_id][$relation_id]['count']>0)
                            {
                            //各別關係的算術平術數
                            $competency_grade[$competency_id][$relation_id]['arithmetic_avg']=
                            $competency_grade[$competency_id][$relation_id]['total_weighted_grade']/($competency_grade[$competency_id][0]['total_weight'])/$competency_grade[$competency_id][$relation_id]['count'];
                            }
                                 
                            $competency_grade[$competency_id][0]['geometric_total']+=
                                $competency_grade[$competency_id][$relation_id]['arithmetic_avg'];
                            }
                            }
                             
                            $competency_grade[$competency_id][0]['geometric_avg']=
                            $competency_grade[$competency_id][0]['geometric_total']/(count($row)-1);
                             
                            $competency_grade[$competency_id][0]['arithmetic_avg']=
                            $competency_grade[$competency_id][0]['total_weighted_grade']/($competency_grade[$competency_id][0]['total_weight'])/$competency_grade[$competency_id][0]['count'];
                        }
                        }
                            return array($competency_grade,$behavior_grade);
        }
    
    
    
    /**
     * @param unknown $option   //basis_evaluation_appraisee_id
     * @return Ambigous <multitype:, number>
     */
    function get_basis_evaluation_appraisee_grade($option)
    {
        $return=array();
    
        // 找出這個受評人採用哪個 table > 得知採用哪一個 competency_model_id
    
        // --> 找出這個 受評人 需要哪些 behavior_id
        if(!$option['behavior_id_row'])
        {
            $rows=$this->db->select('basis_evaluation_appraisee',array(
                "[>]basis_evaluation_table"=>"basis_evaluation_table_id",
                "[>]competency"=>"competency_model_id",
                "[>]behavior"=>"competency_id"
            ),'*',array('basis_evaluation_appraisee_id'=>$option['basis_evaluation_appraisee_id']));
    
             
            //整理
            if($rows)
            {
                foreach($rows as $row)
                {
                    $option['behavior_id_row'][$row['behavior_id']]=$row['behavior_id'];
                    $option['behavior'][$row['behavior_id']]=$row;
                }
            }
        }
    
        // -->  找出這個 受評人 有哪些評鑑人及關係
        $rows=$this->db->select('basis_evaluation_evaluator','*',array('basis_evaluation_appraisee_id'=>$option['basis_evaluation_appraisee_id']));
        foreach($rows as $row)
        {
            $basis_evaluation_evaluator_id_row[]=$row['basis_evaluation_evaluator_id'];
            $evaluator_row[$row['basis_evaluation_evaluator_id']]=$row;
        }
    
    
        // --> （若無）找出behavior的屬性
        if(!$option['behavior'])
        {
            if($rows=$this->db->select('behavior','*',array(
                    'behavior_id'=>$option['behavior_id_row']
            )))
            {
                foreach($rows as $row)
                {
                    $option['behavior'][$row['behavior_id']]=$row;
                }
            }
        }
         
    
    
        // -->  找出此次計算評鑑資料
        if($evaluator_detail_rows=$this->db->select('basis_evaluation_evaluator_detail','*',
            array(
                'behavior_id'=>$option['behavior_id_row'],
                'basis_evaluation_evaluator_id'=>$basis_evaluation_evaluator_id_row
            )
        ))
        {
        //此受評人的所有評鑑明細
        foreach($evaluator_detail_rows as $row)
        {
            //引用
            $relation=$evaluator_row[$row['basis_evaluation_evaluator_id']]['basis_evaluation_evaluator_relation'];
            $competency_id= $option['behavior'][$row['behavior_id']]['competency_id'];
            $weight= $option['behavior'][$row['behavior_id']]['weight'];
            $behavior_id=$row['behavior_id'];
             
            $evaluation_scale_item_grade=$row['evaluation_scale_item_grade'];
            $basis_evaluation_evaluator_id=$row['basis_evaluation_evaluator_id'];
    
     
            $geometric_grade[$competency_id][$relation][$basis_evaluation_evaluator_id]['weighted_grade']+=($evaluation_scale_item_grade*$weight);
            $geometric_grade[$competency_id][$relation][$basis_evaluation_evaluator_id]['weight']+=($weight);
    
            $arithmetic_grade[$competency_id]['weighted_grade']+=($evaluation_scale_item_grade*$weight);
            $arithmetic_grade[$competency_id]['weight']+=($weight);
    
            $geometric_behavior_grade[$competency_id][$behavior_id][$relation][$basis_evaluation_evaluator_id]['grade']+=($evaluation_scale_item_grade);
            $geometric_behavior_grade[$competency_id][$behavior_id][$relation][$basis_evaluation_evaluator_id]['weighted_grade']+=($evaluation_scale_item_grade*$weight);
            $geometric_behavior_grade[$competency_id][$behavior_id][$relation][$basis_evaluation_evaluator_id]['weight']+=($weight);
    
            $arithmetic_behavior_grade[$competency_id][$behavior_id]['weighted_grade']+=($evaluation_scale_item_grade*$weight);
            $arithmetic_behavior_grade[$competency_id][$behavior_id]['weight']+=($weight);

        }
        }
        return array($geometric_grade,$arithmetic_grade,$geometric_behavior_grade,$arithmetic_behavior_grade);
    
    }
        


    /*
     * 分級制
    */
    function update_class_evaluator_grade($option)
    {
         
        $this->db->update('class_evaluation_evaluator',array(
            'evalutor_score'=>$option['evalutor_score']
        ),array(
            'class_evaluation_evaluator_id'=>$option['class_evaluation_evaluator_id']
        ));
    
        if(!$option['class_evaluation_competency_id'])
        {
            $row=$this->db->get('class_evaluation_evaluator','*',array('class_evaluation_evaluator_id'=>$option['class_evaluation_evaluator_id']));
            $option['class_evaluation_competency_id']=$row['class_evaluation_competency_id'];
        }
         
        //算出各評鑑人針對此職能的平均,並更新此人的此職能平均
        if($rows=$this->db->select('class_evaluation_evaluator','*',array(
            'class_evaluation_competency_id'=>$option['class_evaluation_competency_id']
        )))
        {
            foreach($rows as $row)
            {
                $total_evalutor_score+=$row['evalutor_score']*$row['weight'];
            }
            $competency_score=$total_evalutor_score/100;
            $this->db->update('class_evaluation_competency',
                array('competency_score'=>$competency_score,
                    'competency_grade_date'=>date("Y-m-d H:i:s")
                ),array('class_evaluation_competency_id'=>$option['class_evaluation_competency_id']));
        }
         
        //  $competency_score=
         
    }
      
    function get_competency_type($s)
    {
        global $base;
        $langrow['competency_type']['C']=$base->message('CoreCompetency');
        $langrow['competency_type']['M']=$base->message('ManageCompetency');
        $langrow['competency_type']['G']=$base->message('GeneralCompetency');
        $langrow['competency_type']['P']=$base->message('ProfessionalCompetency');
        return $langrow['competency_type'][$s];
    }
    
    
    
    
    
    
    
    
    
    /**
     * 舊程式碼 2015/7/9
     * @param unknown $option   //basis_evaluation_appraisee_id
     * @return Ambigous <multitype:, number>
     */
    function count_basis_evaluation_appraisee($option)
    {
        $return=array();   

        $grade_competency=array();
        $grade_behavior=array();
        
        
        // 找出這個受評人採用哪個 table > 得知採用哪一個 competency_model_id        
        list($geometric_grade,$arithmetic_grade,$geometric_behavior_grade,$arithmetic_behavior_grade) = $this->get_basis_evaluation_appraisee_grade($option);                            
        //算術平均數（Arithmetic mean）： 所有屬於該職能下的行為之評分 的 平均
        //幾何平均數（Geometric mean）： 先依關係分做N類，每類中求個別平均（C1,C2,C3)，之後再求平均(SUM(C)/N)       
        

        
        if($geometric_behavior_grade)
        {           
            foreach($geometric_behavior_grade as $competency_id => $row)
            {
                $competency_id_row[]=$competency_id;    //職能代碼陣列
                foreach($row as $behavior_id=>$row1 )
                {
                    $behavior_id_row[]=$behavior_id;            //行為代碼陣列
            
                    foreach($row1 as $relation =>$row2)
                    {
                        //屬於此關係群組的評鑑成績
                        foreach($row2 as $basis_evaluation_evaluator_id=>$row3)
                        {
                            $_behavior_grade=$row3['weighted_grade']/$row3['weight'];     //此人  此行為 的除權成績
                            $grade_behavior[$competency_id][$behavior_id][$relation]['grade']+=$_behavior_grade;  //此行為目標的累積成績
                            unset($_behavior_grade);
                        }
                        //取得 此關係 此行為 的 平均除權成績
                        $grade_behavior[$competency_id][$behavior_id][$relation]['avg_grade']=$grade_behavior[$competency_id][$behavior_id][$relation]['grade']/count($row2);
            
                        //此關係 此職能 的 累積除權成績
                        $grade_competency[$competency_id][$relation]['grade']+= $grade_behavior[$competency_id][$behavior_id][$relation]['avg_grade'];
                    }
            
                    //求此 行為的平均
                    $grade_behavior[$competency_id][$behavior_id]['behavior_geometric_avg']=
                    ($grade_behavior[$competency_id][$behavior_id][2]['avg_grade']+
                        $grade_behavior[$competency_id][$behavior_id][3]['avg_grade']+
                        $grade_behavior[$competency_id][$behavior_id][4]['avg_grade'])/3;
                    
                    $grade_behavior[$competency_id][$behavior_id]['behavior_arithmetic_avg']=
                        $arithmetic_behavior_grade[$competency_id][$behavior_id]['weighted_grade']/
                        $arithmetic_behavior_grade[$competency_id][$behavior_id]['weight'];
                }
                 
            }
            
            
            foreach($geometric_behavior_grade as $competency_id => $row)
            {
                for($r=1;$r<=4;$r++)
                {
                    // 依序求出此職能 各關係 的平均除權成績  (累積除權成績/行為個數)
                    $grade_competency[$competency_id][$r]['avg_grade']=
                    $grade_competency[$competency_id][$r]['grade']/count($row);
                }
            
                //求出此職能的 所有關係的 平均除權成績
                $grade_competency[$competency_id]['avg_geometric_avg']=
                ($grade_competency[$competency_id][2]['avg_grade']+
                    $grade_competency[$competency_id][3]['avg_grade']+
                    $grade_competency[$competency_id][4]['avg_grade'])/3;
                        
                /* Output
                    $grade_competency[$competency_id]['avg_geometric_avg']
                    $grade_competency[$competency_id]['avg_arithmetic_avg']
                    $grade_competency[$competency_id][1]['avg_grade']
                    $grade_competency[$competency_id][2]['avg_grade']
                    $grade_competency[$competency_id][3]['avg_grade']
                    $grade_competency[$competency_id][4]['avg_grade']
                  
                    $grade_behavior[$competency_id][$behavior_id]['behavior_geometric_avg']
                    $grade_behavior[$competency_id][$behavior_id]['behavior_arithmetic_avg']
                    $grade_behavior[$competency_id][$behavior_id][1]['avg_grade']
                    $grade_behavior[$competency_id][$behavior_id][2]['avg_grade']
                    $grade_behavior[$competency_id][$behavior_id][3]['avg_grade']
                    $grade_behavior[$competency_id][$behavior_id][4]['avg_grade']                  
                 */
            
            }     
        }
        
        if($arithmetic_grade)
        foreach($arithmetic_grade as $competency_id=>$row )
        {
            $grade_competency[$competency_id]['avg_arithmetic_avg']=
                $arithmetic_grade[$competency_id]['weighted_grade']/$arithmetic_grade[$competency_id]['weight'];
        }
        
        
        return array($grade_behavior,$grade_competency);
        
        
//         //arithmetic_avg
        
//         if($arithmetic_grade)
//         {
//             foreach($arithmetic_grade as $competency_id=>$row)
//             {
//                 $return[$competency_id]['arithmetic_avg']=$row['grade']/$row['weight'];
                
//                 //算出每個關係類 的 平均
//                 foreach($geometric_grade[$competency_id] as $relation => $row1)
//                 {
//                     //依關依，算平均
//                     if(count($row1))
//                     {    
//                         foreach($row1 as $basis_evaluation_evaluator_id=>$row2)
//                         {
//                             $_relation_grade[$relation]+=$row2['grade']/$row2['weight'];
//                         }
//                         $_relation_avg[$relation]=$_relation_grade[$relation]/count($row1);
                        
//                         $_geometric_grade_total[$competency_id]+=$_relation_avg[$relation];
                        
//                         unset($_relation_grade);
//                     }
//                 }
//                 $return[$competency_id]['geometric_avg']=$_geometric_grade_total[$competency_id]/count($geometric_grade[$competency_id]);            
//             }
//         }
//         return $return;
    }
        
    //舊程式碼 2015/7/9
    function update_basis_evaluation_appraisee($option,$grade_row)
    {   
        $appraisee_uid=$option['appraisee_uid'];
        list($grade_competency,$grade_behavior)=$grade_row;

        /* Output
         $grade_competency[$competency_id]['avg_geometric_avg']
        $grade_competency[$competency_id][1]['avg_grade']
        $grade_competency[$competency_id][2]['avg_grade']
        $grade_competency[$competency_id][3]['avg_grade']
        $grade_competency[$competency_id][4]['avg_grade']
        
        $grade_behavior[$competency_id][$behavior_id]['avg_grade']
        $grade_behavior[$competency_id][$behavior_id][1]['avg_grade']
        $grade_behavior[$competency_id][$behavior_id][2]['avg_grade']
        $grade_behavior[$competency_id][$behavior_id][3]['avg_grade']
        $grade_behavior[$competency_id][$behavior_id][4]['avg_grade']
        */
                        
        //**找出評鑑表 所屬的 職能模型 / 職能 / 行為
        if($rows=$this->db->select('profile_competency','*',array('user_id'=>$appraisee_uid)))
        {
            foreach($rows as $row)
            {
                $profile_competency[$row['competency_id']]=$row;                
            }
        }          

        //**找出評鑑表 所屬的 職能模型 / 職能 / 行為
        if($rows=$this->db->select('profile_behavior','*',array('user_id'=>$appraisee_uid)))
        {
            foreach($rows as $row)
            {
                $profile_behavior[$row['behavior_id']]=$row;
            }
        }
                
        //**找出[以關係區分]的職能評鑑資訊
        if($rows=$this->db->select('profile_competency_detail','*',array('user_id'=>$appraisee_uid)))
        {
            foreach($rows as $row)
            {
                $profile_competency_detail[$row['competency_id']][$row['evaluation_relation_id']]=$row;
            }
        }    
        
        //**找出[以關係區分]的行為評鑑資訊
        if($rows=$this->db->select('profile_behavior_detail','*',array('user_id'=>$appraisee_uid)))
        {
            foreach($rows as $row)
            {
                $profile_behavior_detail[$row['behavior_id']][$row['evaluation_relation_id']]=$row;
            }
        }

        if(!$option['competency_model_id'])
        {
            if($option['basis_evaluation_table_id'])
            {
                $_r=$this->db->get('basis_evaluation_table','*',array('basis_evaluation_table_id'=>$option['basis_evaluation_table_id']));
                $option['competency_model_id']=$_r['competency_model_id'];
            }
            else if($option['basis_evaluation_appraisee_id'])
            {
                $_r=$this->db->get('basis_evaluation_appraisee',array("[>]basis_evaluation_table"=>'basis_evaluation_table_id'),'*',array('basis_evaluation_table_id'=>$option['basis_evaluation_table_id']));
                $option['competency_model_id']=$_r['competency_model_id'];
            }
        }
        
        
        if($option['competency_model_id'])
        {
            //**找出個人的評鑑總分
            $profile_competency_model_row=$this->db->get('profile_competency_model','*',array('AND'=>array(
                'user_id'=>$appraisee_uid,
                'competency_model_id'=>$option['competency_model_id']
            )));
              
        }
        
        
        
        // 依職能尋找
        foreach($grade_competency as $competency_id =>$row1)
        {        
            $_grade['arithmetic'][$competency_id]=$row1[0]['arithmetic_avg'];
            $_grade['geometric'][$competency_id]=$row1[0]['geometric_avg'];
            
            
            if(isset($profile_competency[$competency_id]))
            {           
                //echo    $competency_id.'存在並更新<br>';
                //存在就更新
                $profile_competency_id=$profile_competency[$competency_id]['profile_competency_id'];
                $this->db->update('profile_competency',array(
                    'arithmetic_avg'=>$row1[0]['arithmetic_avg'],
                    'geometric_avg'=>$row1[0]['geometric_avg']
                ),array('profile_competency_id'=>$profile_competency_id));   
            }
            else
            {           
                //echo    $competency_id.'不存在並新增<br>';
                //不存在就新增
                $this->db->insert('profile_competency',array(
                    'user_id'=>$appraisee_uid,
                    'competency_id'=>$competency_id,
                    'competency_level'=>0, 
                    'arithmetic_avg'=>$row1[0]['arithmetic_avg'],
                    'geometric_avg'=>$row1[0]['geometric_avg']
                ));              
            }         
                  
            for($relation=1;$relation<=4;$relation++)
            {                
                $__row=$profile_competency_detail[$competency_id][$relation];               
                
                if(isset($profile_competency_detail[$competency_id][$relation]))
                {
                //    echo    $competency_id.'-'.$relation.'-存在並更新<br>';
                    //存在就更新
                    
                    $profile_competency_detail_id=$__row['profile_competency_detail_id'];
                    $this->db->update('profile_competency_detail',array(
                        'arithmetic_avg'=>intval($row1[$relation]['arithmetic_avg']),
                        'geometric_avg'=>intval($row1[$relation]['geometric_avg'])
                    ),array('profile_competency_detail_id'=>$profile_competency_detail_id));
                }
                else
                {
                   // echo    $competency_id.'-'.$relation.'-不存在並新增<br>';
                    //不存在就新增
                    
                    $this->db->insert('profile_competency_detail',array(
                        'user_id'=>$appraisee_uid,
                        'competency_id'=>$competency_id,
                        'evaluation_relation_id'=>$relation,
                        'competency_level'=>0,
                        'arithmetic_avg'=>intval($row1[$relation]['arithmetic_avg']),
                        'geometric_avg'=>intval($row1[$relation]['geometric_avg'])
                    ));
                   
                }
            }                 
        //$grade_behavior[$competency_id][$behavior_id]['avg_grade']       
         }
         
         
         
         
         foreach($grade_behavior as $behavior_id =>$behavior_row1)
         {
             if(isset($profile_behavior[$behavior_id]))
             {
                // echo    'B:'.$behavior_id.'存在並更新<br>';
                 //存在就更新
                 $profile_behavior_id=$profile_behavior[$behavior_id]['profile_behavior_id'];
                 $this->db->update('profile_behavior',array(
                     'behavior_arithmetic_avg'=>$behavior_row1[0]['behavior_arithmetic_avg'],
                     'behavior_geometric_avg'=>$behavior_row1[0]['behavior_geometric_avg']
                 ),array('profile_behavior_id'=>$profile_behavior_id));
             }
             else
             {
              //   echo    'B:'.$behavior_id.'不存在並新增<br>';
                 //不存在就新增
                 $this->db->insert('profile_behavior',array(
                     'user_id'=>$appraisee_uid,
                     'behavior_id'=>$behavior_id,
                     'behavior_arithmetic_avg'=>$behavior_row1[0]['behavior_arithmetic_avg'],
                     'behavior_geometric_avg'=>$behavior_row1[0]['behavior_geometric_avg']
                 ));
             }
         
             for($relation=1;$relation<=4;$relation++)
             {
                 $__row=$profile_behavior_detail[$behavior_id][$relation];
                 if(isset($profile_behavior_detail[$behavior_id][$relation]))
                 {         
                   //  echo    'B:'.$behavior_id.'存在並更新<br>';
                     //存在就更新
                     $profile_behavior_detail_id=$__row['profile_behavior_detail_id'];
                     $this->db->update('profile_behavior_detail',array(
                         'behavior_arithmetic_avg'=>$behavior_row1[$relation]['behavior_arithmetic_avg'],
                         'behavior_geometric_avg'=>$behavior_row1[$relation]['behavior_geometric_avg']
                     ),array('profile_behavior_detail_id'=>$profile_behavior_detail_id));
                 }
                 else
                 {
                    // echo    'B:'.$behavior_id.'不存在並新增<br>';
                     //不存在就新增
                     $this->db->insert('profile_behavior_detail',array(
                         'user_id'=>$appraisee_uid,
                         'evaluation_relation_id'=>$relation,
                         'behavior_id'=>$behavior_id,
                         'behavior_arithmetic_avg'=>$behavior_row1[$relation]['behavior_arithmetic_avg'],
                         'behavior_geometric_avg'=>$behavior_row1[$relation]['behavior_geometric_avg']
                     ));
                     }
                 }         
              }
            
         // 開始處理 competency_model
              if(count( $_grade['arithmetic'])>0)
                $_arithmetic_avg=array_sum( $_grade['arithmetic'])/count( $_grade['arithmetic']);
              if(count( $_grade['geometric'])>0)
                $_geometric_avg=array_sum( $_grade['geometric'])/count( $_grade['geometric']);
              
              if ($profile_competency_model_row['profile_competency_model_id']) {  
                     // echo 'competency_model_id:' . $option['competency_model_id'] . '存在並更新<br>';
                      // 存在就更新
                   
                      $this->db->update('profile_competency_model', array(
                          'arithmetic_avg' => $_arithmetic_avg,
                          'geometric_avg' => $_geometric_avg
                      ), array(
                          'profile_competency_model_id' => $profile_competency_model_row['profile_competency_model_id']
                      ));
                  } else {
                   //   echo 'competency_model_id:' . $option['competency_model_id'] . '不存在並新增<br>';
                      // 不存在就新增
                      $this->db->insert('profile_competency_model', array(
                          'user_id' => $appraisee_uid,
                          'competency_model_id' => $option['competency_model_id'],
                          'arithmetic_avg' =>  $_arithmetic_avg,
                          'geometric_avg' => $_geometric_avg
                      ));
                  }
        
    }   //function
    
    function del_evaluator($evaluator_id_row)
    {
        $this->db->delete("basis_evaluation_evaluator", array("basis_evaluation_evaluator_id" => $evaluator_id_row));
        $this->db->delete("basis_evaluation_evaluator_detail", array("basis_evaluation_evaluator_id" => $evaluator_id_row));
        $this->db->delete("basis_evaluation_evaluator_competeny", array("basis_evaluation_evaluator_id" => $evaluator_id_row));
    }
    
    function del_appeaisee($appraisee_id_row)    
    {
        if($rows=$this->db->select('basis_evaluation_evaluator','*',array('basis_evaluation_appraisee_id'=>$appraisee_id_row)))
        {
            foreach($rows as $row)
            {
                $evaluator_id_row[]=$row['basis_evaluation_evaluator_id'];
            }           
        }
        $evaluator_id_row && $this->del_evaluator($evaluator_id_row);
        $this->db->delete("basis_evaluation_appraisee", array("basis_evaluation_appraisee_id" => $appraisee_id_row));
    }
    
    /**
     * 刪除評鑑表，連同報告
     * @param unknown $table_id_row
     */
    function del_basis_table($table_id_row)
    {
        if($rows=$this->db->select('basis_evaluation_appraisee','*',array('basis_evaluation_table_id'=>$table_id_row)))
        {
            foreach($rows as $row)
            {
                $basis_evaluation_appraisee_id[]=$row['basis_evaluation_appraisee_id'];
            }
        }
        $basis_evaluation_appraisee_id && $this->del_appeaisee($basis_evaluation_appraisee_id);
        $this->db->delete("basis_evaluation_table", array("basis_evaluation_table_id" => $table_id_row));
        $this->db->delete('report_config',array('basis_evaluation_table_id'=>$table_id_row));
    }
}
?>