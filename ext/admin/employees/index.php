<?php 

$moduleName = 'employees';
define('MODULE_PATH',dirname(__FILE__));
include APP_BASE_PATH.'header.php';
include APP_BASE_PATH.'modulejslibs.inc.php';
$fieldNameMap = BaseService::getInstance()->getFieldNameMappings("Employee");
$customFields = BaseService::getInstance()->getCustomFields("Employee");
?><div class="span9">
			  
	<ul class="nav nav-tabs" id="modTab" style="margin-bottom:0px;margin-left:5px;border-bottom: none;">
        <?php if($user->user_level != "Admin"){
        ?>
		    <li class="active"><a id="tabEmployee" href="#tabPageEmployee">Users</a></li>
        <?php }else{ ?>
            <li class="active"><a id="tabEmployee" href="#tabPageEmployee">Users</a></li>
        <?php }?>

	</ul>
	 
	<div class="tab-content">
		<div class="tab-pane active" id="tabPageEmployee">
			<div id="Employee" class="reviewBlock" data-content="List" style="padding-left:5px;">
		
			</div>
			<div id="EmployeeForm" class="reviewBlock" data-content="Form" style="padding-left:5px;display:none;">
		
			</div>
		</div>

        <?php if (!class_exists('DocumentsAdminManager')) {?>
            <div class="tab-pane" id="tabPageEmployeeDocument">
                <div id="EmployeeDocument" class="reviewBlock" data-content="List" style="padding-left:5px;">

                </div>
                <div id="EmployeeDocumentForm" class="reviewBlock" data-content="Form" style="padding-left:5px;display:none;">

                </div>
            </div>
        <?php } ?>
		
	</div>

</div>
<script>
var modJsList = new Array();
<?php if($user->user_level != "Admin"){
?>
modJsList['tabEmployee'] = new EmployeeAdapter('Employee','Employee',{"status":"Active"});
modJsList['tabEmployee'].setShowAddNew(false);
<?php
}else{
?>
modJsList['tabEmployee'] = new EmployeeAdapter('Employee','Employee',{"status":"Active"});
<?php
}
?>

modJsList['tabEmployee'].setRemoteTable(true);
modJsList['tabEmployee'].setFieldNameMap(<?=json_encode($fieldNameMap)?>);
modJsList['tabEmployee'].setCustomFields(<?=json_encode($customFields)?>);


var modJs = modJsList['tabEmployee'];

	

</script>


<div class="modal" id="createUserModel" tabindex="-1" role="dialog" aria-labelledby="messageModelLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><li class="fa fa-times"/></button>
                <h3 style="font-size: 17px;">Employee Saved Successfully</h3>
            </div>
            <div class="modal-body">
                 Do you want to create a login for this user now? <br/><br/>You can do this later through Logins module if required.
            </div>
            <div class="modal-footer">
                <button class="btn btn-primary" onclick="modJs.createUser();">Yes</button>
                <button class="btn" onclick="modJs.closeCreateUser();">No</button>
            </div>
        </div>
    </div>
</div>


<?php include APP_BASE_PATH.'footer.php';?>      
