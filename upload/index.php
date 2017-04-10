<?php
/*
 * jQuery File Upload Plugin PHP Example 5.14
 * https://github.com/blueimp/jQuery-File-Upload
 *
 * Copyright 2010, Sebastian Tschan
 * https://blueimp.net
 *
 * Licensed under the MIT license:
 * http://www.opensource.org/licenses/MIT
 */

error_reporting(E_ALL | E_STRICT);
require('UploadHandler.php');
require('UploadHandler_ryan.php');

 if(!isset($_GET['d_upload_dir']))
 {
     $option['d_upload_dir']='files';
 }
 else 
 {     
     $option['d_upload_dir']=$_GET['d_upload_dir'];
 }
 
 if(!file_exists($option['d_upload_dir']))
 {
     @mkdir($option['d_upload_dir']);
 }
 

 if(!isset($_GET['specified_name']))
 {
     $option['specified_name']='files';
 }
 else
 {
     $option['specified_name']=$_GET['specified_name'];
 }
 
 if(!isset($_GET['file_append']))
 {
     $option['file_append']=true;
     
 }
 else if($_GET['file_append']=='false')
 {
     $option['file_append']=false;
 }     
 else
 {
    $option['file_append']=$_GET['file_append'];
 }
 
 if(!isset($_GET['create_text']))
 {
     $option['create_text']=true;      
 }
 else
 {
     $option['create_text']=false;
 }
 
 if(!isset($_GET['thumbnail']))
 {
     $option['create_thumbnail']=true;      
 }
 else
 {
     $option['create_thumbnail']=false;
 }
 
 
 error_reporting(0);



$upload_handler = new nUploadHandler($option);

