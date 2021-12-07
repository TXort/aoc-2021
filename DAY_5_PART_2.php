
<?php

// Name:   AOC_2021_DAY5_PART2
// Author: Ort
// Date:   2021/12/05

$input = explode(",", preg_replace(['/ /', '/->/', '/\n/'], ['', ',', ','], file_get_contents('input.txt')) );
$hash = array(array());

for ($i = 0; $i < count($input); $i += 4) {
    $x1 = $input[$i]; $y1 = $input[$i + 1]; $x2 = $input[$i + 2]; $y2 = $input[$i + 3];
    $difx = ($x2 - $x1) < 0 ? -1 : 1;
    $dify = ($y2 - $y1) < 0 ? -1 : 1;
    if ($x2 - $x1 == 0) $difx = 0;
    if ($y2 - $y1 == 0) $dify = 0;
    for ($j = 0; $j <= max(abs($x2-$x1), abs($y2-$y1)); $j++)
        isset($hash[$x1 + $difx * $j][$y1 + $dify * $j]) ? $hash[$x1 + $difx * $j][$y1 + $dify * $j]++ : $hash[$x1 + $difx * $j][$y1 + $dify * $j] = 1;
}

$sum = 0;
foreach ($hash as &$array)
    foreach ($array as &$x) 
        $x > 1 ? $sum++ : 0;


echo ($sum);

?>
