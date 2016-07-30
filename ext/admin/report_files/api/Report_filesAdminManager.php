<?php
if (!class_exists('Report_filesAdminManager')) {
	class Report_filesAdminManager extends AbstractModuleManager{
		
		public function initializeUserClasses(){
			if(defined('MODULE_TYPE') && MODULE_TYPE != 'admin'){
				$this->addUserClass("ReportFile");
			}
		}
		
		public function initializeFieldMappings(){
			$this->addFileFieldMapping('ReportFile', 'attachment', 'name');
		}
		
		public function initializeDatabaseErrorMappings(){

		}
		
		public function setupModuleClassDefinitions(){

		}
		
	}
}