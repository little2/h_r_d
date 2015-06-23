<?php
set_time_limit(9900);



/**
 * Command line utility to use dompdf.
 * Can also be used with HTTP GET parameters
 * 
 * @package dompdf
 * @link    http://dompdf.github.com/
 * @author  Benj Carson <benjcarson@digitaljunkies.ca>
 * @license http://www.gnu.org/copyleft/lesser.html GNU Lesser General Public License
 */

require_once ("dompdf_config.inc.php");
global $_dompdf_show_warnings, $_dompdf_debug, $_DOMPDF_DEBUG_TYPES;

$options = array();
global $id,$type;


$type='report';
$input_file='95.htm';        



if (isset($input_file))
    $file = rawurldecode($input_file);
else
    throw new DOMPDF_Exception("An input file is required (i.e. input_file _GET variable).");


$paper = DOMPDF_DEFAULT_PAPER_SIZE;
$orientation = "portrait";


$base_path = rawurldecode("data/".$type."/");
$file = $base_path . $file; // Set the input file

reg(__LINE__,$msg=false);


$file_parts = explode_url($file);
/*
 * Check to see if the input file is local and, if so, that the base path falls
 * within that specified by DOMDPF_CHROOT
 */
if (($file_parts['protocol'] == '' || $file_parts['protocol'] === 'file://')) {
    
    if (! ($file = realpath($file))) {
        $file = realpath($base_path) . DIRECTORY_SEPARATOR .
                 rawurldecode($input_file);
    }

    if (strpos($file, DOMPDF_CHROOT) !== 0) {
        throw new DOMPDF_Exception("Permission denied on $file. The file could not be found under the directory specified by DOMPDF_CHROOT.");
    }
}

$outfile = str_replace('.htm', '.pdf', $file);
if(file_exists($outfile))
{
    reg(__LINE__,$msg=false);
    $data = $_POST;
    $data['errmsg']="";
    echo 'Exists';
    exit(0);
    die;
}

if ($file_parts['protocol'] === 'php://') {
    throw new DOMPDF_Exception(
            "Permission denied on $file. This script does not allow PHP streams.");
}
// $outfile = "dompdf_out123.pdf"; # Don't allow them to set the output file

$save_file = true; // Don't save the file

$dompdf = new DOMPDF();
reg(__LINE__,$msg=false);

if ($file === "-") {
    reg(__LINE__,$file);
    $str = "";
    while (! feof(STDIN))
        $str .= fread(STDIN, 4096);
    
    $dompdf->load_html($str);
} 
else
{
    reg(__LINE__,$file);
    $dompdf->load_html_file($file);
}    
    


if (isset($base_path)) {
    reg(__LINE__,$base_path);
    $dompdf->set_base_path($base_path);
}

$dompdf->set_paper($paper, $orientation);

reg(__LINE__,$msg=false);
$dompdf->render();
reg(__LINE__,$msg=false);
if ($_dompdf_show_warnings) {
    reg(__LINE__,$msg=false);
    global $_dompdf_warnings;
    foreach ($_dompdf_warnings as $msg)
        echo $msg . "\n";
    echo $dompdf->get_canvas()->get_cpdf()->messages;
    flush();
}
reg(__LINE__,$msg=false);
if ($save_file) {
    reg(__LINE__,$msg=false);
    // if ( !is_writable($outfile) )
    // throw new DOMPDF_Exception("'$outfile' is not writable.");
    /*
    if (strtolower(DOMPDF_PDF_BACKEND) === "gd")
        $outfile = str_replace(".pdf", ".png", $outfile);
  
    list ($proto, $host, $path, $file) = explode_url($outfile);
    if ($proto != "") // i.e. not file://
        $outfile = $file; // just save it locally, FIXME? could save it like
                          // wget:
                              // ./host/basepath/file
    
    $outfile = realpath(dirname($outfile)) . DIRECTORY_SEPARATOR . basename(
            $outfile);
    
    if (! ($file = realpath($file))) {
        $file = realpath($base_path) . DIRECTORY_SEPARATOR .
                 rawurldecode($input_file);
    }
    */
    $outfile = str_replace('.htm', '.pdf', $file);
  
    if (strpos($outfile, DOMPDF_CHROOT) !== 0)
        throw new DOMPDF_Exception("Permission denied.");
   
    reg(__LINE__,$msg=false);
    file_put_contents($outfile, $dompdf->output(array("compress" => 0)));
    
    // //若順利儲存,則轉到 company_view
    echo 'Finish';
    
    
    exit(0);
}

if (! headers_sent()) {
    $dompdf->stream($outfile, $options);
}


function reg($line,$msg=false)
{
    file_put_contents('_SVGIG.txt', $line.' Time:'.time().'  '.$msg.chr(10),FILE_APPEND);    
}
