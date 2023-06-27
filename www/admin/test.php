<?
$calendar = array();
			$thisyear = date("Y");
			for ($year = date("Y"); $year<=($thisyear+1); $year++){
				if ($year == $thisyear){
					$startmonth = date("m", mktime(0,0,0,date('m'),1,date('Y')));	
				}else{
					$startmonth = 1;
				}
				for ($month = $startmonth; $month <= 12; $month++) {
					$daysInMonth = date("t", mktime(0,0,0,$month,1,$year));
					for($day = 1; $day <= $daysInMonth; $day++){
						$skip = date("N", mktime(0,0,0,$month,$day,$year));
						if ($skip == 6 or $skip == 7){
							$days[$day]=$day;
							$calendar[$year][$month] = $days;
						}
					}
				}
			}
			echo "<pre>";
			var_dump($calendar);
			echo "</pre>";
			?>