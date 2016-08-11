/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

DELIMITER $$
CREATE FUNCTION generate_fname () RETURNS varchar(255)
  BEGIN
    RETURN ELT(FLOOR(1 + (RAND() * (100-1))), "James","Mary","John","Patricia","Robert","Linda","Michael","Barbara","William","Elizabeth","David","Jennifer","Richard","Maria","Charles","Susan","Joseph","Margaret","Thomas","Dorothy","Christopher","Lisa","Daniel","Nancy","Paul","Karen","Mark","Betty","Donald","Helen","George","Sandra","Kenneth","Donna","Steven","Carol","Edward","Ruth","Brian","Sharon","Ronald","Michelle","Anthony","Laura","Kevin","Sarah","Jason","Kimberly","Matthew","Deborah","Gary","Jessica","Timothy","Shirley","Jose","Cynthia","Larry","Angela","Jeffrey","Melissa","Frank","Brenda","Scott","Amy","Eric","Anna","Stephen","Rebecca","Andrew","Virginia","Raymond","Kathleen","Gregory","Pamela","Joshua","Martha","Jerry","Debra","Dennis","Amanda","Walter","Stephanie","Patrick","Carolyn","Peter","Christine","Harold","Marie","Douglas","Janet","Henry","Catherine","Carl","Frances","Arthur","Ann","Ryan","Joyce","Roger","Diane");
  END$$

DELIMITER ;

DELIMITER $$
CREATE FUNCTION generate_lname () RETURNS varchar(255)
  BEGIN
    RETURN ELT(FLOOR(1 + (RAND() * (100-1))), "Smith","Johnson","Williams","Jones","Brown","Davis","Miller","Wilson","Moore","Taylor","Anderson","Thomas","Jackson","White","Harris","Martin","Thompson","Garcia","Martinez","Robinson","Clark","Rodriguez","Lewis","Lee","Walker","Hall","Allen","Young","Hernandez","King","Wright","Lopez","Hill","Scott","Green","Adams","Baker","Gonzalez","Nelson","Carter","Mitchell","Perez","Roberts","Turner","Phillips","Campbell","Parker","Evans","Edwards","Collins","Stewart","Sanchez","Morris","Rogers","Reed","Cook","Morgan","Bell","Murphy","Bailey","Rivera","Cooper","Richardson","Cox","Howard","Ward","Torres","Peterson","Gray","Ramirez","James","Watson","Brooks","Kelly","Sanders","Price","Bennett","Wood","Barnes","Ross","Henderson","Coleman","Jenkins","Perry","Powell","Long","Patterson","Hughes","Flores","Washington","Butler","Simmons","Foster","Gonzales","Bryant","Alexander","Russell","Griffin","Diaz","Hayes");
  END$$
DELIMITER ;

INSERT INTO `CompanyStructures` (`id`, `title`, `description`, `address`, `type`, `country`, `parent`) VALUES
(4, 'Development Center', 'Development Center', 'PO Box 001002\nSample Road, Sample Town', 'Regional Office', 'SG', 1),
(5, 'Engineering Department', 'Engineering Department', 'PO Box 001002\nSample Road, Sample Town,  341234', 'Department', 'SG', 4),
(6, 'Development Team', 'Development Team', '', 'Unit', 'SG', 5),
(7, 'QA Team', 'QA Team', '', 'Unit', 'SG', 5),
(8, 'Server Administration', 'Server Administration', '', 'Unit', 'SG', 5),
(9, 'Administration & HR', 'Administration and Human Resource', '', 'Department', 'SG', 4);


INSERT INTO `Employees` (`id`, `employee_id`, `first_name`, `middle_name`, `last_name`, `nationality`, `birthday`, `gender`, `marital_status`, `ssn_num`, `nic_num`, `other_id`, `driving_license`, `driving_license_exp_date`, `employment_status`, `job_title`, `pay_grade`, `work_station_id`, `address1`, `address2`, `city`, `country`, `province`, `postal_code`, `home_phone`, `mobile_phone`, `work_phone`, `work_email`, `private_email`, `joined_date`, `confirmation_date`, `supervisor`, `department`, `custom1`, `custom2`, `custom3`, `custom4`, `custom5`, `custom6`, `custom7`, `custom8`, `custom9`, `custom10`,`indirect_supervisors`) VALUES
(2, 'EMP002', 'Lala', 'Nadila ', 'Lamees', 175, '1984-03-12 18:30:00', 'Female', 'Single', '', '4594567WE3', '4595567WE3', '349-066-YUO', '2012-03-01', 1, 8, 2, 'W001', 'Green War Rd, 00123', '', 'Istanbul', 'TR', NULL, '909066', '+960112345', '+960112345', '+960112345', 'icehrm+manager@web-stalk.com', 'icehrm+manager@web-stalk.com', '2011-03-07 18:30:00', '2012-02-14 18:30:00', 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL),
(3, 'EMP003', 'Sofia', '', 'O''Sullivan', 4, '1975-08-28 18:30:00', 'Female', 'Married', '', '768-20-4394', '768-20-4394', '', NULL, 3, 10, 2, '', '2792 Trails End Road', 'Fort Lauderdale', 'Fort Lauderdale', 'US', 12, '33308', '954-388-3340', '954-388-3340', '954-388-3340', 'icehrm+user1@web-stalk.com', 'icehrm+user1@web-stalk.com', '2010-02-08 18:30:00', '0000-00-00 00:00:00', 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,'[\"1\"]'),
(4, 'EMP004', 'Taylor', '', 'Holmes', 10, '1979-07-15 18:30:00', 'Male', 'Single', '158-06-2292', '158-06-2292', '', '', NULL, 1, 5, 2, '', '1164', 'Walnut Avenue', 'Rochelle Park', 'US', 35, '7662', '201-474-8048', '201-474-8048', '201-474-8048', 'icehrm+user2@web-stalk.com', 'icehrm+user2@web-stalk.com', '2006-07-12 18:30:00', '0000-00-00 00:00:00', 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL);

INSERT INTO `Employees` (`id`, `employee_id`, `first_name`, `middle_name`, `last_name`, `nationality`, `birthday`, `gender`, `marital_status`, `ssn_num`, `nic_num`, `other_id`, `driving_license`, `driving_license_exp_date`, `employment_status`, `job_title`, `pay_grade`, `work_station_id`, `address1`, `address2`, `city`, `country`, `province`, `postal_code`, `home_phone`, `mobile_phone`, `work_phone`, `work_email`, `private_email`, `joined_date`, `confirmation_date`, `supervisor`, `department`, `custom1`, `custom2`, `custom3`, `custom4`, `custom5`, `custom6`, `custom7`, `custom8`, `custom9`, `custom10`) VALUES
  (5, CONCAT('EMP', RAND()), generate_fname(), '', generate_fname(), 10, '1979-07-15 18:30:00', 'Male', 'Single', '158-06-2292', '158-06-2292', '', '', NULL, 1, 5, 2, '', '1164', 'Walnut Avenue', 'Rochelle Park', 'US', 35, '7662', '201-474-8048', '201-474-8048', '201-474-8048', 'icehrm+user2@web-stalk.com', 'icehrm+user2@web-stalk.com', '2006-07-12 18:30:00', '0000-00-00 00:00:00', 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
  (6, CONCAT('EMP', RAND()), generate_fname(), '', generate_fname(), 10, '1979-07-15 18:30:00', 'Male', 'Single', '158-06-2292', '158-06-2292', '', '', NULL, 1, 5, 2, '', '1164', 'Walnut Avenue', 'Rochelle Park', 'US', 35, '7662', '201-474-8048', '201-474-8048', '201-474-8048', 'icehrm+user2@web-stalk.com', 'icehrm+user2@web-stalk.com', '2006-07-12 18:30:00', '0000-00-00 00:00:00', 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
  (7, CONCAT('EMP', RAND()), generate_fname(), '', generate_fname(), 10, '1979-07-15 18:30:00', 'Male', 'Single', '158-06-2292', '158-06-2292', '', '', NULL, 1, 5, 2, '', '1164', 'Walnut Avenue', 'Rochelle Park', 'US', 35, '7662', '201-474-8048', '201-474-8048', '201-474-8048', 'icehrm+user2@web-stalk.com', 'icehrm+user2@web-stalk.com', '2006-07-12 18:30:00', '0000-00-00 00:00:00', 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
  (8, CONCAT('EMP', RAND()), generate_fname(), '', generate_fname(), 10, '1979-07-15 18:30:00', 'Male', 'Single', '158-06-2292', '158-06-2292', '', '', NULL, 1, 5, 2, '', '1164', 'Walnut Avenue', 'Rochelle Park', 'US', 35, '7662', '201-474-8048', '201-474-8048', '201-474-8048', 'icehrm+user2@web-stalk.com', 'icehrm+user2@web-stalk.com', '2006-07-12 18:30:00', '0000-00-00 00:00:00', 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
  (9, CONCAT('EMP', RAND()), generate_fname(), '', generate_fname(), 10, '1979-07-15 18:30:00', 'Male', 'Single', '158-06-2292', '158-06-2292', '', '', NULL, 1, 5, 2, '', '1164', 'Walnut Avenue', 'Rochelle Park', 'US', 35, '7662', '201-474-8048', '201-474-8048', '201-474-8048', 'icehrm+user2@web-stalk.com', 'icehrm+user2@web-stalk.com', '2006-07-12 18:30:00', '0000-00-00 00:00:00', 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
  (10, CONCAT('EMP', RAND()), generate_fname(), '', generate_fname(), 10, '1979-07-15 18:30:00', 'Female', 'Single', '158-06-2292', '158-06-2292', '', '', NULL, 1, 5, 2, '', '1164', 'Walnut Avenue', 'Rochelle Park', 'US', 35, '7662', '201-474-8048', '201-474-8048', '201-474-8048', 'icehrm+user2@web-stalk.com', 'icehrm+user2@web-stalk.com', '2006-07-12 18:30:00', '0000-00-00 00:00:00', 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
  (11, CONCAT('EMP', RAND()), generate_fname(), '', generate_fname(), 10, '1979-07-15 18:30:00', 'Female', 'Single', '158-06-2292', '158-06-2292', '', '', NULL, 1, 5, 2, '', '1164', 'Walnut Avenue', 'Rochelle Park', 'US', 35, '7662', '201-474-8048', '201-474-8048', '201-474-8048', 'icehrm+user2@web-stalk.com', 'icehrm+user2@web-stalk.com', '2006-07-12 18:30:00', '0000-00-00 00:00:00', 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
  (12, CONCAT('EMP', RAND()), generate_fname(), '', generate_fname(), 10, '1979-07-15 18:30:00', 'Female', 'Single', '158-06-2292', '158-06-2292', '', '', NULL, 1, 5, 2, '', '1164', 'Walnut Avenue', 'Rochelle Park', 'US', 35, '7662', '201-474-8048', '201-474-8048', '201-474-8048', 'icehrm+user2@web-stalk.com', 'icehrm+user2@web-stalk.com', '2006-07-12 18:30:00', '0000-00-00 00:00:00', 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
  (13, CONCAT('EMP', RAND()), generate_fname(), '', generate_fname(), 10, '1979-07-15 18:30:00', 'Female', 'Single', '158-06-2292', '158-06-2292', '', '', NULL, 1, 5, 2, '', '1164', 'Walnut Avenue', 'Rochelle Park', 'US', 35, '7662', '201-474-8048', '201-474-8048', '201-474-8048', 'icehrm+user2@web-stalk.com', 'icehrm+user2@web-stalk.com', '2006-07-12 18:30:00', '0000-00-00 00:00:00', 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
  (14, CONCAT('EMP', RAND()), generate_fname(), '', generate_fname(), 10, '1979-07-15 18:30:00', 'Female', 'Single', '158-06-2292', '158-06-2292', '', '', NULL, 1, 5, 2, '', '1164', 'Walnut Avenue', 'Rochelle Park', 'US', 35, '7662', '201-474-8048', '201-474-8048', '201-474-8048', 'icehrm+user2@web-stalk.com', 'icehrm+user2@web-stalk.com', '2006-07-12 18:30:00', '0000-00-00 00:00:00', 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
  (15, CONCAT('EMP', RAND()), generate_fname(), '', generate_fname(), 10, '1979-07-15 18:30:00', 'Female', 'Single', '158-06-2292', '158-06-2292', '', '', NULL, 1, 5, 2, '', '1164', 'Walnut Avenue', 'Rochelle Park', 'US', 35, '7662', '201-474-8048', '201-474-8048', '201-474-8048', 'icehrm+user2@web-stalk.com', 'icehrm+user2@web-stalk.com', '2006-07-12 18:30:00', '0000-00-00 00:00:00', 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


UPDATE `Employees` set supervisor = 2, indirect_supervisors = '[3,4]', approver1 = 5, approver2 = 6, approver3 = 7 where id = 1;
UPDATE `Employees` set supervisor = 1, indirect_supervisors = '[3,4]', approver1 = 5, approver2 = 6 where id = 2;
UPDATE `Employees` set supervisor = 2, indirect_supervisors = '[1,4]', approver1 = 5 where id = 3;




INSERT INTO `Users` (`id`, `username`, `email`, `password`, `employee`,`default_module`, `user_level`,`user_roles`, `last_login`, `last_update`, `created`) VALUES
(2, 'manager', 'icehrm+manager@web-stalk.com', '4048bb914a704a0728549a26b92d8550', 2,NULL, 'Manager','', '2013-01-03 02:47:37', '2013-01-03 02:47:37', '2013-01-03 02:47:37'),
(3, 'user1', 'icehrm+user1@web-stalk.com', '4048bb914a704a0728549a26b92d8550', 3,NULL, 'Employee','', '2013-01-03 02:48:32', '2013-01-03 02:48:32', '2013-01-03 02:48:32'),
(4, 'user2', 'icehrm+user2@web-stalk.com', '4048bb914a704a0728549a26b92d8550', 4,NULL, 'Employee','', '2013-01-03 02:58:55', '2013-01-03 02:58:55', '2013-01-03 02:58:55'),
(5, 'user3', 'icehrm+user3@web-stalk.com', '4048bb914a704a0728549a26b92d8550', NULL,NULL, 'Other','["1"]', '2013-01-03 02:58:55', '2013-01-03 02:58:55', '2013-01-03 02:58:55'),
(6, 'user4', 'icehrm+user4@web-stalk.com', '4048bb914a704a0728549a26b92d8550', 5,NULL, 'Manager','', '2013-01-03 02:58:55', '2013-01-03 02:58:55', '2013-01-03 02:58:55'),
(7, 'user5', 'icehrm+user5@web-stalk.com', '4048bb914a704a0728549a26b92d8550', 6,NULL, 'Employee','', '2013-01-03 02:58:55', '2013-01-03 02:58:55', '2013-01-03 02:58:55'),
(8, 'user6', 'icehrm+user6@web-stalk.com', '4048bb914a704a0728549a26b92d8550', 7,NULL, 'Employee','', '2013-01-03 02:58:55', '2013-01-03 02:58:55', '2013-01-03 02:58:55'),
(9, 'user7', 'icehrm+user7@web-stalk.com', '4048bb914a704a0728549a26b92d8550', 8,NULL, 'Employee','', '2013-01-03 02:58:55', '2013-01-03 02:58:55', '2013-01-03 02:58:55'),
(10, 'user8', 'icehrm+user8@web-stalk.com', '4048bb914a704a0728549a26b92d8550', 9,NULL, 'Employee','', '2013-01-03 02:58:55', '2013-01-03 02:58:55', '2013-01-03 02:58:55'),
(11, 'user9', 'icehrm+user9@web-stalk.com', '4048bb914a704a0728549a26b92d8550', 10,NULL, 'Employee','', '2013-01-03 02:58:55', '2013-01-03 02:58:55', '2013-01-03 02:58:55');

INSERT INTO `Job` VALUES
  (1,'Software Engineer','More than 375,000 users world-wide rely on our software for their daily business as it makes creating graphical presentations so much easier, faster and more enjoyable. Among our customers are many renowned consulting companies and large international corporations.','More than 375,000 users world-wide rely on our software for their daily business as it makes creating graphical presentations so much easier, faster and more enjoyable. Among our customers are many renowned consulting companies and large international corporations.\n\nWe follow our own strategy and do not have to make compromises with regard to code quality and beauty, because think-cell is profitable and has no outside investors. We are flourishing without program managers, meetings, and marketing-driven deadlines. Our code quality is extraordinarily high because we only release software when it is ready. We are willing to do the leg work of developing sophisticated algorithms and refining our user interface, which makes working with think-cellâ€™s software so satisfying.','Challenging C++ coding with high personal responsibility\nWork with a competent and creative team in a modern loft office in Berlin\nFamily-friendly working hours, no deadlines\nAbove-average salary (we offer our developers EUR 120,000 annually after one year of employment)\nFree supply of drinks, fruits, sweets and snacks\nFlat hierarchies and plenty of room for your ideas\nA full-time company nanny who is available for free when children are sick, or when you just feel like spending an evening out','[\"Health plan\",\"Paid vacations\"]',226,2,NULL,'JC001',1,NULL,7,14,9,151,'Yes',3500,5500,'job, engineer','Active','0000-00-00 00:00:00',NULL,'Text Only',1),
  (2,'QA Senior Test Automation Engineer','As a QA Senior Test Automation Engineer at Rocket you will help us launch the most successful startup companies around the world.','As a QA Senior Test Automation Engineer at Rocket you will help us launch the most successful startup companies around the world.','Responsibilities:\n\nAutomated testing of web and mobile applications\nDevelop automated scenarios/scripts using Cucumber (for web applications) and Calabash (for mobile applications)\nOptimize existing test cases to get more stability and efficiency\nRun automated functional tests as well as performance and load tests\nAnalyze automated test results and report bugs to responsible employees\nSupport the test automation team during the whole development process (starting from the analysis of requirements up to the integration of automated test cases into the CI system (Jenkins)\n\n\nRequirements:\n\nSeveral years of experience as a Test Automation Engineer ( 5+ years )\nExperience with automated solutions such as Cucumber/Calabash, Gherkin, Selenium or similar tools/frameworks\nExperience with Ruby, Python, PHP, JAVA or similar programming languages\nExperience with source code controls like SVN, GIT, CVS\nFamiliarity with Continuous Integration and Delivery\nExperience in Agile Methodologies like Scrum and Kanban or extreme programming\nFluency in speaking & writing English skills\nISTQB certification\n Technology stack we use:\n\nTools: GitHub, Jira, Confluence, Bamboo, Jenkins, Testlink\nScrum, Kanban\nCucumber, Calabash, Capybara, JMeter','[\"Life insurance\"]',80,3,NULL,'JC002',3,NULL,5,14,6,151,'Yes',4000,4500,'','Active','0000-00-00 00:00:00',NULL,'Text Only',1),
  (3,'Online Editor','Online Editors required for a reputed news agency','Online Editors required for a reputed news agency','','[]',129,NULL,NULL,'J0003',1,NULL,7,23,9,103,'No',0,0,'','Active','0001-01-01 00:00:00','attachment_BI5XQCYFxZO12W1447383181684','Image and Full Text',1);

INSERT INTO `Candidates` VALUES
  (1,'Jhon','Doe',4,NULL,'Male',NULL,NULL,NULL,'New York','US',NULL,NULL,'icehrm+jhon@web-stalk.com','+1 455565656',NULL,'Software Engineer','cv_rYwHphV7xD5dOe1444302569136',NULL,NULL,NULL,'','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,'2015-10-08 16:59:20','2015-10-08 16:59:20',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'663fd20d1859344585f678a0f87b23522b8f9fce8c67c5290a609ce342b81442',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

INSERT INTO `Files` VALUES
  (6,'attachment_BI5XQCYFxZO12W1447383181684','attachment_BI5XQCYFxZO12W1447383181684.png',1,'Job');




INSERT INTO `Settings` (`name`, `value`, `description`, `meta`) VALUES
  ('Instance : ID', '0847429146712c108e23c435e8f93b4d', '',''),
  ('Instance: Key', 'UQHEYBx9H1eNR66nhNCNCz1WCDDhkjtx1OuJbO3ZQMt+8tfSGvuOH/YEHntRajY=', '','');


/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;





