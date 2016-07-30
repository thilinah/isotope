<?php
class EmployeesActionManager extends SubActionManager{

    public function terminateEmployee($req){
        $employee = new Employee();
        $employee->Load("id = ?",array($req->id));

        if(empty($employee->id)){
            return new IceResponse(IceResponse::ERROR, "Employee Not Found");
        }

        $employee->termination_date = date('Y-m-d H:i:s');
        $employee->status = 'Terminated';

        $ok = $employee->Save();
        if(!$ok){
            return new IceResponse(IceResponse::ERROR, "Error occured while terminating employee");
        }

        return new IceResponse(IceResponse::SUCCESS, $employee);

        //$user = BaseService::getInstance()->getUserFromProfileId($employee->id);
    }

    public function activateEmployee($req){
        $employee = new Employee();
        $employee->Load("id = ?",array($req->id));

        if(empty($employee->id)){
            return new IceResponse(IceResponse::ERROR, "Employee Not Found");
        }

        $employee->termination_date = NULL;
        $employee->status = 'Active';

        $ok = $employee->Save();
        if(!$ok){
            return new IceResponse(IceResponse::ERROR, "Error occurred while activating employee");
        }

        return new IceResponse(IceResponse::SUCCESS, $employee);

        //$user = BaseService::getInstance()->getUserFromProfileId($employee->id);
    }

    public function deleteEmployee($req){

        $employee = new Employee();
        $employee->Load("id = ?",array($req->id));

        if(empty($employee->id)){
            return new IceResponse(IceResponse::ERROR, "Employee Not Found");
        }

        $archived = new ArchivedEmployee();
        $archived->ref_id = $employee->id;
        $archived->employee_id = $employee->employee_id;
        $archived->first_name = $employee->first_name;
        $archived->last_name = $employee->last_name;
        $archived->gender = $employee->gender;
        $archived->ssn_num = $employee->ssn_num;
        $archived->nic_num = $employee->nic_num;
        $archived->other_id = $employee->other_id;
        $archived->work_email = $employee->work_email;
        $archived->joined_date = $employee->joined_date;
        $archived->confirmation_date = $employee->confirmation_date;
        $archived->supervisor = $employee->supervisor;
        $archived->department = $employee->department;
        $archived->termination_date = $employee->termination_date;
        $archived->notes = $employee->notes;

        //$archived = BaseService::getInstance()->cleanUpAdoDB($archived);

        $mapping = '{"nationality":["Nationality","id","name"],"country":["Country","code","name"],"province":["Province","id","name"],"department":["CompanyStructure","id","title"],"supervisor":["Employee","id","first_name+last_name"]}';

        $employeeEnriched = BaseService::getInstance()->getElement('Employee',$employee->id,$mapping,true);
        $employeeEnriched = BaseService::getInstance()->cleanUpAdoDB($employeeEnriched);

        $data = new stdClass();
        $data->enrichedEmployee = $employeeEnriched;

        $data->timesheets = $this->getEmployeeData($employee->id, new EmployeeTimeSheet());
        $data->timesheetEntries = $this->getEmployeeData($employee->id, new EmployeeTimeEntry());
        $data->attendance = $this->getEmployeeData($employee->id, new Attendance());
        $data->documents = $this->getEmployeeData($employee->id, new EmployeeDocument());
        if(class_exists('EmployeeTrainingSession')){
            $data->trainingSessions = $this->getEmployeeData($employee->id, new EmployeeTrainingSession());
        }
        $data->travelRecords = $this->getEmployeeData($employee->id, new EmployeeTravelRecord());
        $data->qualificationSkills = $this->getEmployeeData($employee->id, new EmployeeSkill());
        $data->qualificationEducation = $this->getEmployeeData($employee->id, new EmployeeEducation());
        $data->qualificationCertifications = $this->getEmployeeData($employee->id, new EmployeeCertification());
        $data->qualificationLanguages = $this->getEmployeeData($employee->id, new EmployeeLanguage());
        $data->salary = $this->getEmployeeData($employee->id, new EmployeeSalary());
        $data->dependants = $this->getEmployeeData($employee->id, new EmployeeDependent());
        $data->emergencyContacts = $this->getEmployeeData($employee->id, new EmergencyContact());
        $data->projects = $this->getEmployeeData($employee->id, new EmployeeProject());
        $data->leaves = $this->getEmployeeData($employee->id, new EmployeeLeave());
        $data->leaveDays = $this->getEmployeeData($employee->id, new EmployeeLeaveDay());

        $archived->data = json_encode($data, JSON_PRETTY_PRINT);

        $ok = $archived->Save();
        if(!$ok){
            return new IceResponse(IceResponse::ERROR, "Error occured while archiving employee");
        }

        $ok = $employee->Delete();
        if(!$ok){
            return new IceResponse(IceResponse::ERROR, "Error occured while deleting employee");
        }

        return new IceResponse(IceResponse::SUCCESS, $archived);
    }

    public function downloadArchivedEmployee($req){


        if($this->baseService->currentUser->user_level != 'Admin'){
            echo "Error: Permission denied";
            exit();
        }

        $employee = new ArchivedEmployee();
        $employee->Load("id = ?",array($req->id));

        if(empty($employee->id)){
            return new IceResponse(IceResponse::ERROR, "Employee Not Found");
        }

        $employee->data = json_decode($employee->data);
        $employee = $this->baseService->cleanUpAdoDB($employee);

        $str = json_encode($employee, JSON_PRETTY_PRINT);

        $filename = uniqid();
        $file = fopen("/tmp/".$filename,"w");
        fwrite($file,$str);
        fclose($file);

        $downloadFileName = "employee_".$employee->id."_".str_replace(" ", "_", $employee->first_name)."_".str_replace(" ", "_", $employee->last_name).".txt";

        header("Pragma: public"); // required
        header("Expires: 0");
        header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
        header("Content-Description: File Transfer");
        header("Content-Type: image/jpg");
        header('Content-Disposition: attachment; filename="'.$downloadFileName.'"');
        header("Content-Transfer-Encoding: binary");
        header("Content-Length: ".filesize("/tmp/".$filename));
        readfile("/tmp/".$filename);
        exit();

    }

    private function getEmployeeData($id, $obj){
        $data = array();
        $objs = $obj->Find("employee = ?",array($id));
        foreach($objs as $entry){
            $data[] = BaseService::getInstance()->cleanUpAdoDB($entry);
        }
        return $data;
    }
}
