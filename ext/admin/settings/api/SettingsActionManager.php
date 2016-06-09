<?php
/*
 This file is part of iCE Hrm.

iCE Hrm is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

iCE Hrm is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with iCE Hrm. If not, see <http://www.gnu.org/licenses/>.

------------------------------------------------------------------

Original work Copyright (c) 2012 
Developer: Thilina Hasantha (thilina.hasantha[at]gmail.com / facebook.com/thilinah)
*/


class SettingsActionManager extends SubActionManager{
	
	public function getAppLog($req){
        $numberOfLines = 100;
        $file = file(CLIENT_BASE_PATH."data/app.log");

        $start = count($file) - $numberOfLines;
        if($start < 0){
            $start = 0;
        }
        $data = "";
        for ($i = $start; $i < count($file); $i++) {
            $data.= $file[$i] . "<br/><br/>";
        }
		
		return new IceResponse(IceResponse::SUCCESS,$data);
		
	}
	
}