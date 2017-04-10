<?php
class nUploadHandler extends UploadHandler
{


    function __construct($options = null, $initialize = true, $error_messages = null) {
        $upload_dir=(isset($options['d_upload_dir']))?$options['d_upload_dir']:'files';
        $this->options = array(
                'script_url' => $this->get_full_url().'/',
                'upload_dir' => dirname($this->get_server_var('SCRIPT_FILENAME')).'/'.$upload_dir.'/',
                'upload_url' => $this->get_full_url().'/'.$upload_dir.'/',
                'user_dirs' => false,
                'mkdir_mode' => 0755,
                'param_name' => 'files',
                // Set the following option to 'POST', if your server does not support
                // DELETE requests. This is a parameter sent to the client:
                'delete_type' => 'DELETE',
                'access_control_allow_origin' => '*',
                'access_control_allow_credentials' => false,
                'access_control_allow_methods' => array(
                        'OPTIONS',
                        'HEAD',
                        'GET',
                        'POST',
                        'PUT',
                        'PATCH',
                        'DELETE'
                ),
                'access_control_allow_headers' => array(
                        'Content-Type',
                        'Content-Range',
                        'Content-Disposition'
                ),
                // Enable to provide file downloads via GET requests to the PHP script:
                //     1. Set to 1 to download files via readfile method through PHP
                //     2. Set to 2 to send a X-Sendfile header for lighttpd/Apache
                //     3. Set to 3 to send a X-Accel-Redirect header for nginx
                // If set to 2 or 3, adjust the upload_url option to the base path of
                // the redirect parameter, e.g. '/files/'.
                'download_via_php' => false,
                // Read files in chunks to avoid memory limits when download_via_php
                // is enabled, set to 0 to disable chunked reading of files:
                'readfile_chunk_size' => 10 * 1024 * 1024, // 10 MiB
                // Defines which files can be displayed inline when downloaded:
                'inline_file_types' => '/\.(gif|jpe?g|png)$/i',
                // Defines which files (based on their names) are accepted for upload:
                'accept_file_types' => '/.+$/i',
                // The php.ini settings upload_max_filesize and post_max_size
                // take precedence over the following max_file_size setting:
                'max_file_size' => null,
                'min_file_size' => 1,
                // The maximum number of files for the upload directory:
                'max_number_of_files' => null,
                // Defines which files are handled as image files:
                'image_file_types' => '/\.(gif|jpe?g|png)$/i',
                // Use exif_imagetype on all files to correct file extensions:
                'correct_image_extensions' => false,
                // Image resolution restrictions:
                'max_width' => null,
                'max_height' => null,
                'min_width' => 1,
                'min_height' => 1,
                // Set the following option to false to enable resumable uploads:
                'discard_aborted_uploads' => true,
                // Set to 0 to use the GD library to scale and orient images,
                // set to 1 to use imagick (if installed, falls back to GD),
                // set to 2 to use the ImageMagick convert binary directly:
                'image_library' => 1,
                // Uncomment the following to define an array of resource limits
                // for imagick:
                /*
                 'imagick_resource_limits' => array(
                         imagick::RESOURCETYPE_MAP => 32,
                         imagick::RESOURCETYPE_MEMORY => 32
                 ),
        */
                // Command or path for to the ImageMagick convert binary:
                'convert_bin' => 'convert',
                // Uncomment the following to add parameters in front of each
                // ImageMagick convert call (the limit constraints seem only
                // to have an effect if put in front):
                /*
                 'convert_params' => '-limit memory 32MiB -limit map 32MiB',
        */
                // Command or path for to the ImageMagick identify binary:
                'identify_bin' => 'identify',
                'image_versions' => array(
                        // The empty image version key defines options for the original image:
                        '' => array(
                                // Automatically rotate images based on EXIF meta data:
                                'auto_orient' => true
                        ),
                        // Uncomment the following to create medium sized images:
                        /*
                         'medium' => array(
                                 'max_width' => 800,
                                 'max_height' => 600
                         ),
        */
                        'thumbnail' => array(
                                // Uncomment the following to use a defined directory for the thumbnails
                                // instead of a subdirectory based on the version identifier.
                                // Make sure that this directory doesn't allow execution of files if you
                                // don't pose any restrictions on the type of uploaded files, e.g. by
                                // copying the .htaccess file from the files directory for Apache:
                                //'upload_dir' => dirname($this->get_server_var('SCRIPT_FILENAME')).'/thumb/',
                                //'upload_url' => $this->get_full_url().'/thumb/',
                                // Uncomment the following to force the max
                                // dimensions and e.g. create square thumbnails:
                                //'crop' => true,
                                'max_width' => 80,
                                'max_height' => 80
                        )
                )
        );
        if ($options) {
            $this->options = $options + $this->options;
        }
        if ($error_messages) {
            $this->error_messages = $error_messages + $this->error_messages;
        }
        
        //若不要縮圖
        if(!$this->options['create_thumbnail'])
        {
            unset($this->options['image_versions']['thumbnail']);
        }
        
        
        if ($initialize) {
            $this->initialize();
        }
    }
    
    
    protected function get_file_name($file_path, $name, $size, $type, $error,
            $index, $content_range) {
        $newname=$this->get_unique_filename(
            $file_path,
            $this->trim_file_name($file_path, $name, $size, $type, $error,
                $index, $content_range),
            $size,
            $type,
            $error,
            $index,
            $content_range
        );
        //新增修改處 (BEGIN)
        if($this->options['create_text'])
        {
            @file_put_contents($this->options['upload_dir'].'/__'.$newname.'.txt', $this->options['realname']);
        }
        //新增修改處 (END)
        return $newname;
    }

    protected function trim_file_name($file_path, $name, $size, $type, $error,
            $index, $content_range) {
        // Remove path information and dots around the filename, to prevent uploading
        // into different directories or replacing hidden system files.
        // Also remove control characters and spaces (\x00..\x20) around the filename:
        
        $this->options['realname']=$name;        
        
        //先取得副檔名
        $parts = explode('.', $name);
        $extIndex = count($parts) - 1;
        $real_ext = strtolower(@$parts[$extIndex]);        
        
        $name = trim(basename(stripslashes($name)), ".\x00..\x20");     
        if($this->options['specified_name'])        {           
            //若有指定的檔名
            if (strpos($name, '.') )
            {
                $parts = explode('.', $name);
                $extIndex = count($parts) - 1;
                $ext = strtolower(@$parts[$extIndex]);
                $name = ($this->options['specified_name']).'.'.$ext;
                
            }
            else
            {
                $name = $this->options['specified_name'];
            }
        
        
           if(!$this->options['file_append'])
            {
                //刪除舊的
                $files = glob($this->options['upload_dir'].'/'.$this->options['specified_name'].'.*'); // get all file names
                foreach($files as $file){ // iterate files
                    if(is_file($file))
                        unlink($file); // delete file
                }
            }
        
        }
        else 
        {
            if($this->options['realname']!=$name)
            {
                $name.=microtime(true).'.'.$real_ext;
            }    
        }
    
        
        // Use a timestamp for empty filenames:
        if (!$name) {
            $name = str_replace('.', '-', microtime(true));         
        }
        
        
        
        // Add missing file extension for known image types:
        if (strpos($name, '.') === false &&
        preg_match('/^image\/(gif|jpe?g|png)/', $type, $matches)) {
            $name .= '.'.$matches[1];
        }
        
        if (function_exists('exif_imagetype')) {
            
       
            
            switch(@exif_imagetype($file_path)){
            	case IMAGETYPE_JPEG:
            	    $extensions = array('jpg', 'jpeg');
            	    break;
            	case IMAGETYPE_PNG:
            	    $extensions = array('png');
            	    break;
            	case IMAGETYPE_GIF:
            	    $extensions = array('gif');
            	    break;
            	     
            }
            // Adjust incorrect image file extensions:
            if (!empty($extensions)) {
                
             
                
                $parts = explode('.', $name);
                $extIndex = count($parts) - 1;
                $ext = strtolower(@$parts[$extIndex]);
                if (!in_array($ext, $extensions)) {
                    $parts[$extIndex] = $extensions[0];
                    $name = implode('.', $parts);
                }
            }
        }
        
        
        return $name;
    }

    protected function set_additional_file_properties($file) {
        //新增
        $file->realname=$this->options['realname'];
        //新增（END)
        $file->deleteUrl = $this->options['script_url']
        .$this->get_query_separator($this->options['script_url'])
        .$this->get_singular_param_name()
        .'='.rawurlencode($file->name);
        $file->deleteType = $this->options['delete_type'];
        if ($file->deleteType !== 'DELETE') {
            $file->deleteUrl .= '&_method=DELETE';
        }
        if ($this->options['access_control_allow_credentials']) {
            $file->deleteWithCredentials = true;
        }         
    }    
    
    
}
