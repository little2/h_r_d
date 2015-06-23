<?php
set_time_limit(9900);
require_once ("dompdf_config.inc.php");

$type='order';
$input_file='YZO-1406-36-2.htm';
$file = rawurldecode($input_file);
$base_path = rawurldecode("data/".$type."/");
$file = $base_path . $file; // Set the input file

$paper = DOMPDF_DEFAULT_PAPER_SIZE;
$orientation = "portrait"; 

if (! ($file = realpath($file))) {
    $file = realpath($base_path) . DIRECTORY_SEPARATOR .rawurldecode($input_file);
}

$dompdf = new DOMPDF();
$dompdf->load_html_file($file);
$dompdf->set_base_path($base_path);
$dompdf->set_paper($paper, $orientation);   //設定尺寸及方向  
$dompdf->render();

$outfile = str_replace('.htm', '.pdf', $file);   
file_put_contents($outfile, $dompdf->output(array("compress" => 0)));        

