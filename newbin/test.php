// <?php
// $str = "An example of a long word oh fuck yes me too awhe fucking me yes";
// echo wordwrap($str,3,"<br>\n");


function doLines($string, $nl){
  // Break into 'words' 
  $bits = explode(' ', $string);
  $output = '';
  $counter=0;
  // Go word by word...
  foreach($bits as $bit){
     //Add the word to the output...
     $output .= $bit.' ';
     //If it's 3 words...
     if($counter==2){
       // Remove the trailing space
       $output = substr($output, 0, strlen($output)-1);
       //Add the separator character...
       $output .=$nl;
       //Reset Counter
       $counter=0;
     }
  }
  //Remove final trailing space
  $output = substr($output, 0, strlen($output)-1);

  return $output;
}

// ?>