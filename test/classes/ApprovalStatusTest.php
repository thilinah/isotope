<?php

if(!class_exists("TestTemplate")) {
    include dirname(__FILE__).'/../TestTemplate.php';
}


class ApprovalStatusTest extends TestTemplate{

    protected function setUp(){
        parent::setUp();
        $emp = new Employee();
        $emp->Load("id = ?",array(1));
        $emp->supervisor = 2;
        $emp->indirect_supervisors = json_encode(array(3,4));
        $emp->approver1 = 5;
        $emp->approver2 = 6;
        $emp->approver3 = 7;
        $emp->Save();
    }
    
    protected function tearDown(){
        parent::tearDown();
    }


    public function testInitializeApprovalChain(){
        $this->initializeObjects();
        $as = ApprovalStatus::getInstance();
        fwrite(STDOUT, __METHOD__ . " Start\n");
        $as->initializeApprovalChain('EmployeeLeave',2);
        $status = $as->getAllStatuses('EmployeeLeave',2);
        fwrite(STDOUT,"[testInitializeApprovalChain]Status :".print_r($status,true)."\r\n");
        $this->assertEquals(3, count($status));
        fwrite(STDOUT, __METHOD__ . " End\n");

    }

    public function testUpdateApprovalStatus(){
        $this->initializeObjects();
        $as = ApprovalStatus::getInstance();
        fwrite(STDOUT, __METHOD__ . " Start\n");
        $as->initializeApprovalChain('EmployeeLeave',1);
        $resp = $as->updateApprovalStatus('EmployeeLeave',1,2,1);
        fwrite(STDOUT,"[testUpdateApprovalStatus]Resp :".print_r($resp,true)."\r\n");
        $this->assertNull($resp->getObject()[0]);
        $this->assertEquals(1, $resp->getObject()[1]->active);
        $this->assertEquals(1, $resp->getObject()[1]->level);


        $resp = $as->updateApprovalStatus('EmployeeLeave',1,3,1);
        fwrite(STDOUT,"[testUpdateApprovalStatus]Resp :".print_r($resp,true)."\r\n");
        $this->assertEquals(IceResponse::ERROR, $resp->getStatus());

        $resp = $as->updateApprovalStatus('EmployeeLeave',1,5,1);
        fwrite(STDOUT,"[testUpdateApprovalStatus]Resp :".print_r($resp,true)."\r\n");
        $this->assertEquals(0, $resp->getObject()[0]->active);
        $this->assertEquals(1, $resp->getObject()[0]->level);
        $this->assertEquals(1, $resp->getObject()[1]->active);
        $this->assertEquals(2, $resp->getObject()[1]->level);

        $resp = $as->updateApprovalStatus('EmployeeLeave',1,6,1);
        fwrite(STDOUT,"[testUpdateApprovalStatus]Resp :".print_r($resp,true)."\r\n");
        $this->assertEquals(0, $resp->getObject()[0]->active);
        $this->assertEquals(2, $resp->getObject()[0]->level);
        $this->assertEquals(1, $resp->getObject()[1]->active);
        $this->assertEquals(3, $resp->getObject()[1]->level);

        $resp = $as->updateApprovalStatus('EmployeeLeave',1,7,1);
        fwrite(STDOUT,"[testUpdateApprovalStatus]Resp :".print_r($resp,true)."\r\n");
        $this->assertEquals(1, $resp->getObject()[0]->active);
        $this->assertEquals(3, $resp->getObject()[0]->level);
        $this->assertNull($resp->getObject()[1]);


        fwrite(STDOUT, __METHOD__ . " End\n");
    }
}