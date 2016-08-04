Feature: Employer Only Web Services Enrollment 
		1.  Register Web Service Employer, Add a Program Administrator, Add a General User and validate all.
		2.  Employer Registration Page & Review (Scenarios 01-06) 
		3.  Organization Designation, MOU Signatory, Company Informations, Program Administrator Informations, Registration Review & Enroll (Scenarios 07-17)
		4.  Use WebHQ to edit and validate company, set MOU activation date, save Program Administrator ID, Set Tutorial Complete/Temp Password for Program Admin (Scenarios 35-42)
		5.  Login to everify as a Program Administrator (Scenario 43)
		6.  Validate the Program Administrator - New Password and Security Questions, Verify User Profile (Scenarios 44-45)
		7.  Add a General User (Scenario 46)
		8.  Use WebHQ to edit and validate general user - Set Tutorial Complete/Temp Password for General User, save General User ID (Scenarios 47-55)
		9.  Login to eVerify as a General User (Scenario 56)
		10. Verify General User activation - Submit New Password and Security Questions, Verify User Profile (Scenarios 57-59)

Scenario: 01-Navigate to Employer Registration page
	Given I navigate to the url for "registration" titled "E-Verify – Employer Registration – Start Page"
	When I set the checkbox with element id "cb_Iagree" to "true"
	And I click on the submit button labeled "Continue"
	Then the page title is "E-Verify – Employer Registration – Checklist"

Scenario: 02-Employer Registration - Checklist
	Given the page is loaded
	When I click on the submit button labeled "Begin E-Verify Enrollment"
	Then the page title is "E-Verify – Employer Registration – Start Here"

Scenario: 03-Employer Access-Y Agent/Corporate-N Web Services-Y
	Given the page is loaded
	When I click on the radio button using element id "radBpYes"
	And I click on the radio button using element id "radDaNo"
	And I click on the radio button using element id "radCorpNo"
	And I click on the radio button using element id "radWsYes"
	And I click on the submit button labeled "Next"
	Then the page title is "E-Verify - Employer Registration - Let’s Review"

Scenario: 04-Registration Review Page Verification
	Given the page is loaded
	When I access the table using tag "div" attribute type "class" attribute value "box"

Scenario Outline: 05 - Registration Review Table Verification
	Then table row number <Row> contains the values <Answer> from the following table
	
	Examples: 
	| Row| Answer|
	| 2  | Yes   |
	| 3  | No    |
	| 4  | No    |
	| 5  | Yes   |

Scenario: 06-Registration Review Page
	Given the page title is "E-Verify - Employer Registration - Let’s Review"
	When I click on the submit button labeled "Next"
	Then the page title is "E-Verify - Employer Registration - Organization Designation"

Scenario: 07-Organization Designation
	Given the page is loaded
	When I select the drop down text "Federal Government" using element id "ucCategory_vscCategory_SelectorDrop"
	And I click on the submit button labeled "Next"
	Then the page title is "E-Verify – Employer Registration – Memorandum of Understanding"

Scenario: 08-Switch to iFrame to verify data
	Given the page is loaded
	When I switch to iframe using element id "ucRegistrationTerms_frmMou"
	Then the page contains the text "MEMORANDUM OF UNDERSTANDING"
	And the page contains the text "FOR WEB SERVICES EMPLOYERS"
	And I switch back to the body of the page

Scenario: 09-Memorandum of Understanding (MOU)
	Given the page title is "E-Verify – Employer Registration – Memorandum of Understanding"
	When I click on the radio button using element id "ucRegistrationTerms_radAccept"
	And I click on the submit button labeled "Next"
	Then the page title is "E-Verify – Employer Registration – MOU Signatory"

Scenario: 10-MOU Signatory
	Given the page is loaded
	When I set the text box using element id "ucMouPoc_ltLastName_TextBox" with the value "EmployerOnlyWebService-LN"
	And I set the text box using element id "ucMouPoc_ltFirstName_TextBox" with the value "EmployerOnlyWebService-FN"
	And I set the text box using element id "ucMouPoc_scPhone_PhoneAreaCode" with the value "301"
	And I set the text box using element id "ucMouPoc_scPhone_PhonePrefixCode" with the value "123"
	And I set the text box using element id "ucMouPoc_scPhone_PhoneSuffixCode" with the value "4567"
	And I set the text box using element id "ucMouPoc_ltEmail_TextBox" with the value "automation.bdd@gmail.com"
	And I set the text box using element id "ucMouPoc_ltEmail2_TextBox" with the value "automation.bdd@gmail.com"
	And I select the drop down text "No" using element id "ucMouPoc_optAccess"
	And I click on the button using element id "ucMouPoc_btnNext"
	Then the page title is "E-Verify – Employer Registration – Company Information"

Scenario: 11-Company Information
	Given the page is loaded
	When I set the text box using element id "ucCompanyInfo_txtEmpName_TextBox" with the value "EmployerOnlyWebService-One"
	And I set the text box using element id "ucCompanyInfo_txtAddress1_TextBox" with the value "123 Automation Drive"
	And I set the text box using element id "ucCompanyInfo_txtCity_TextBox" with the value "Rockville"
	And I select the drop down text "MARYLAND" using element id "ucCompanyInfo_vssState_SelectorDrop"
	And I set the text box using element id "ucCompanyInfo_ltzZipCode_TextBox" with the value "20852"
	And I select the drop down text "MONTGOMERY" using element id "ucCompanyInfo_vscCounty_SelectorDrop"
	And I set the text box using element id "ucCompanyInfo_ltnEmployerId_TextBox" with the value "123456789"
	And I select the drop down text "100 to 499" using element id "ucCompanyInfo_vscNbrEmps_SelectorDrop"
	And I click on the button using element id "ucCompanyInfo_btnContinue"
	Then the page title is "E-Verify – Employer Registration – NAICS Code"

Scenario: 12 - NAICS Code for new Web Service Employer
	Given the page is loaded
	When I set the text box using element id "ucNaics_ltNaicsCode_TextBox" with the value "521"
	And I click on the submit button labeled "Accept NAICS Code and Continue"
	Then the page title is "E-Verify – Employer Registration – Hiring Sites"

Scenario: 13-Hiring Sites Verification
	Given the page is loaded
	Then the selected drop down text using element id "ucSites_rptHiringSites__ctl1_lstStates" is "MARYLAND"
	And the text box using tag "input" attribute type "value" contains the value "1"
	
Scenario: 14-Navigate to Program Admistrators
	Given the page title is "E-Verify – Employer Registration – Hiring Sites"
	When I click on the submit button labeled "Next"
	Then the page title is "E-Verify – Employer Registration – Program Administrators"

Scenario: 15-Add an Employer Web Service Program Administrator
	Given the page is loaded
	When I set the text box using element id "ucRegContacts_rptContacts__ctl0_ltLastName_TextBox" with the value "AO-Web Services User-LN-One"
	And I set the text box using element id "ucRegContacts_rptContacts__ctl0_ltFirstName_TextBox" with the value "AO-Web Services User-FN-One"
	And I set the text box using element id "ucRegContacts_rptContacts__ctl0_scPhone_PhoneAreaCode" with the value "777"
	And I set the text box using element id "ucRegContacts_rptContacts__ctl0_scPhone_PhonePrefixCode" with the value "888"
	And I set the text box using element id "ucRegContacts_rptContacts__ctl0_scPhone_PhoneSuffixCode" with the value "9999"
	And I set the text box using element id "ucRegContacts_rptContacts__ctl0_ltEmail_TextBox" with the value "testuser1@test.com"
	And I set the text box using element id "ucRegContacts_rptContacts__ctl0_ltEmail2_TextBox" with the value "testuser1@test.com"
	And I click on the submit button labeled "Next"
	Then the page title is "E-Verify – Employer Registration – Registration Review"

Scenario Outline: 16-Registration Review-Verify Registration Details
	Given the page is loaded
	Then the page contains the text <TextOnPage> from the following table

	Examples: 
	| TextOnPage                                      |
	| EmployerOnlyWebService-One                      |
	| 123 Automation Drive                            |
	| Rockville                                       |
	| MD                                              |
	| 20852                                           |
	| MONTGOMERY                                      |
	| 123456789                                       |
	| 100 to 499                                      |
	| Federal Government                              |
	| 521 - MONETARY AUTHORITIES - CENTRAL BANK       |
	| MARYLAND                                        |
	| AO-Web Services User-LN-One                     |
	| AO-Web Services User-FN-O                       |
	| (777) 888 - 9999                                |
	| testuser1@test.com                              |

Scenario: 17-Complete Enrollment to Register Employer Web Service 
	Given the page title is "E-Verify – Employer Registration – Registration Review"
	When I set the checkbox with element id "ucSummary_chkAgree" to "true"
	And I click on the submit button labeled "Register Employer"
	Then the page title is "E-Verify – Employer Registration – You're Finished"
	
Scenario: 18-Navigate to Employer Registration page
	Given I navigate to the url for "registration" titled "E-Verify – Employer Registration – Start Page"
	When I set the checkbox with element id "cb_Iagree" to "true"
	And I click on the submit button labeled "Continue"
	Then the page title is "E-Verify – Employer Registration – Checklist"

Scenario: 19-Employer Registration - Checklist
	Given the page is loaded
	When I click on the submit button labeled "Begin E-Verify Enrollment"
	Then the page title is "E-Verify – Employer Registration – Start Here"

Scenario: 20-Employer Access-Y Agent/Corporate-N Web Services-Y
	Given the page is loaded
	When I click on the radio button using element id "radBpYes"
	And I click on the radio button using element id "radDaNo"
	And I click on the radio button using element id "radCorpNo"
	And I click on the radio button using element id "radWsYes"
	And I click on the submit button labeled "Next"
	Then the page title is "E-Verify - Employer Registration - Let’s Review"

Scenario: 21-Registration Review Page Verification
	Given the page is loaded
	When I access the table using tag "div" attribute type "class" attribute value "box"

Scenario Outline: 22 - Registration Review Table Verification
	Then table row number <Row> contains the values <Answer> from the following table
	
	Examples: 
	| Row| Answer|
	| 2  | Yes   |
	| 3  | No    |
	| 4  | No    |
	| 5  | Yes   |

Scenario: 23-Registration Review Page
	Given the page title is "E-Verify - Employer Registration - Let’s Review"
	When I click on the submit button labeled "Next"
	Then the page title is "E-Verify - Employer Registration - Organization Designation"

Scenario: 24-Organization Designation
	Given the page is loaded
	When I select the drop down text "Federal Government" using element id "ucCategory_vscCategory_SelectorDrop"
	And I click on the submit button labeled "Next"
	Then the page title is "E-Verify – Employer Registration – Memorandum of Understanding"

Scenario: 25-Switch to iFrame to verify data
	Given the page is loaded
	When I switch to iframe using element id "ucRegistrationTerms_frmMou"
	Then the page contains the text "MEMORANDUM OF UNDERSTANDING"
	And the page contains the text "FOR WEB SERVICES EMPLOYERS"
	And I switch back to the body of the page

Scenario: 26-Memorandum of Understanding (MOU)
	Given the page title is "E-Verify – Employer Registration – Memorandum of Understanding"
	When I click on the radio button using element id "ucRegistrationTerms_radAccept"
	And I click on the submit button labeled "Next"
	Then the page title is "E-Verify – Employer Registration – MOU Signatory"

Scenario: 27-MOU Signatory
	Given the page is loaded
	When I set the text box using element id "ucMouPoc_ltLastName_TextBox" with the value "EmployerOnlyWebService-LN"
	And I set the text box using element id "ucMouPoc_ltFirstName_TextBox" with the value "EmployerOnlyWebService-FN"
	And I set the text box using element id "ucMouPoc_scPhone_PhoneAreaCode" with the value "301"
	And I set the text box using element id "ucMouPoc_scPhone_PhonePrefixCode" with the value "123"
	And I set the text box using element id "ucMouPoc_scPhone_PhoneSuffixCode" with the value "4567"
	And I set the text box using element id "ucMouPoc_ltEmail_TextBox" with the value "automation.bdd@gmail.com"
	And I set the text box using element id "ucMouPoc_ltEmail2_TextBox" with the value "automation.bdd@gmail.com"
	And I select the drop down text "No" using element id "ucMouPoc_optAccess"
	And I click on the button using element id "ucMouPoc_btnNext"
	Then the page title is "E-Verify – Employer Registration – Company Information"

Scenario: 28-Company Information
	Given the page is loaded
	When I set the text box using element id "ucCompanyInfo_txtEmpName_TextBox" with the value "EmployerOnlyWebService-One"
	And I set the text box using element id "ucCompanyInfo_txtAddress1_TextBox" with the value "123 Automation Drive"
	And I set the text box using element id "ucCompanyInfo_txtCity_TextBox" with the value "Rockville"
	And I select the drop down text "MARYLAND" using element id "ucCompanyInfo_vssState_SelectorDrop"
	And I set the text box using element id "ucCompanyInfo_ltzZipCode_TextBox" with the value "20852"
	And I select the drop down text "MONTGOMERY" using element id "ucCompanyInfo_vscCounty_SelectorDrop"
	And I set the text box using element id "ucCompanyInfo_ltnEmployerId_TextBox" with the value "123456789"
	And I select the drop down text "100 to 499" using element id "ucCompanyInfo_vscNbrEmps_SelectorDrop"
	And I click on the button using element id "ucCompanyInfo_btnContinue"
	Then the page title is "E-Verify – Employer Registration – NAICS Code"

Scenario: 29 - NAICS Code for new Web Service Employer
	Given the page is loaded
	When I set the text box using element id "ucNaics_ltNaicsCode_TextBox" with the value "521"
	And I click on the submit button labeled "Accept NAICS Code and Continue"
	Then the page title is "E-Verify – Employer Registration – Hiring Sites"

Scenario: 30-Hiring Sites Verification
	Given the page is loaded
	Then the selected drop down text using element id "ucSites_rptHiringSites__ctl1_lstStates" is "MARYLAND"
	And the text box using tag "input" attribute type "value" contains the value "1"
	
Scenario: 31-Navigate to Program Admistrators
	Given the page title is "E-Verify – Employer Registration – Hiring Sites"
	When I click on the submit button labeled "Next"
	Then the page title is "E-Verify – Employer Registration – Program Administrators"

Scenario: 32-Add an Employer Web Service Program Administrator
	Given the page is loaded
	When I set the text box using element id "ucRegContacts_rptContacts__ctl0_ltLastName_TextBox" with the value "AO-Web Services User-LN-One"
	And I set the text box using element id "ucRegContacts_rptContacts__ctl0_ltFirstName_TextBox" with the value "AO-Web Services User-FN-One"
	And I set the text box using element id "ucRegContacts_rptContacts__ctl0_scPhone_PhoneAreaCode" with the value "777"
	And I set the text box using element id "ucRegContacts_rptContacts__ctl0_scPhone_PhonePrefixCode" with the value "888"
	And I set the text box using element id "ucRegContacts_rptContacts__ctl0_scPhone_PhoneSuffixCode" with the value "9999"
	And I set the text box using element id "ucRegContacts_rptContacts__ctl0_ltEmail_TextBox" with the value "testuser1@test.com"
	And I set the text box using element id "ucRegContacts_rptContacts__ctl0_ltEmail2_TextBox" with the value "testuser1@test.com"
	And I click on the submit button labeled "Next"
	Then the page title is "E-Verify – Employer Registration – Registration Review"

Scenario Outline: 33-Registration Review-Verify Registration Details
	Given the page is loaded
	Then the page contains the text <TextOnPage> from the following table

	Examples: 
	| TextOnPage                                      |
	| EmployerOnlyWebService-One                      |
	| 123 Automation Drive                            |
	| Rockville                                       |
	| MD                                              |
	| 20852                                           |
	| MONTGOMERY                                      |
	| 123456789                                       |
	| 100 to 499                                      |
	| Federal Government                              |
	| 521 - MONETARY AUTHORITIES - CENTRAL BANK       |
	| MARYLAND                                        |
	| AO-Web Services User-LN-One                     |
	| AO-Web Services User-FN-O                       |
	| (777) 888 - 9999                                |
	| testuser1@test.com                              |

Scenario: 34-Complete Enrollment to Register Employer Web Service 
	Given the page title is "E-Verify – Employer Registration – Registration Review"
	When I set the checkbox with element id "ucSummary_chkAgree" to "true"
	And I click on the submit button labeled "Register Employer"
	Then the page title is "E-Verify – Employer Registration – You're Finished"

Scenario: 35-Logon to WebHQ
	Given I navigate to the url for "webhq" titled "Login"
	When I set the checkbox with element id "cb_Iagree" to "true"
	And I click on the button using element id "btnContinue1"
	And I set the text box using element id "txtUserID" with the value for "webhq-username"
	And I set the text box using element id "txtUserPassword" with the value for "webhq-password"
	And I click on the submit button labeled "Login"
	Then the page title is "Web-HQ: Home"
	
Scenario: 36-Search Company
	Given the page is loaded
	When I click on the link containing the text "Maintain Company"
	And the page title is "Company Search"
	And I set the text box using element id "txtEmployer_TextBox" with the value "EmployerOnlyWebService-One"
	And I click on the submit button labeled "Display Company Summary List"
	Then the page title is "Company Summary List"
	And the page contains the text "WEB-BP"
	And the page contains the text "WS-EMP"

Scenario: 37-Navigate to company details
	Given the page title is "Company Summary List"
	When I access the table using tag "table" attribute type "class" attribute value "ControlText"
	And I save the table row number containing the data "PENDING" in column number "11" into the variable "tableRowNumber"
	And I click on the button labeled "Edit" in the table row number saved in the variable "tableRowNumber"
	Then the page title is "Company Details"
	
Scenario: 38-Validate and Match Company
	Given the page is loaded
	When I click on the submit button labeled "IIP Match Review"
	And the page title is "IIP Match Review"
	And I skip scenario if element is missing using tag "input" attribute type "value" attribute value "Confirm Company Validity"
	And I click on the submit button labeled "Confirm Company Validity"
	And I select the drop down text "Match" using element id "vscMatchStatus_SelectorDrop"
	And I click on the submit button labeled "Confirm Validity"
	And the page title is "Company Details"
	And I click on the submit button labeled "IIP Match Review"
	And I access table number "2" using tag "table" attribute type "id" attribute value "structure"
	Then table row number "1" column number "2" contains the value "Match"
	
Scenario: 39-Set MOU Signed Date & Check Status
	Given the page title is "IIP Match Review"
	When I click on the submit button labeled "Return to Maintain Company"
	And the page title is "Company Details"
	And I access table number "6" using tag "table" attribute type "id" attribute value "structure"
	And I click on the button labeled "View / Edit" in row number "2"
	And the page title is "Company Details"
	And I set the text box using element id "ucCompanyAccess_cdtMOUDate_dateTextBox" with the value "06/20/2016"
	And I click on the submit button labeled "Submit Information"
	And I access table number "4" using tag "table" attribute type "id" attribute value "tblAddress"
	Then table row number "10" column number "2" contains the value "Total Active Users:"
	And table row number "10" column number "3" contains the value "1"

Scenario: 40-Save Active User ID and Edit User
	Given the page title is "Company Details"
	When I access table number "4" using tag "table" attribute type "id" attribute value "tblAddress"
	And I click on the button labeled "View / Edit" in row number "10"
	And the page title is "Employer User Summary List"
	And I access the table using element id "dgCpsUsers"
	And I save the data from table row number "3" column number "2" into the variable "userid1" 
	And I click on table row number "3" in column number "2"
	Then the page title is "User Details - View / Modify User Information"

Scenario: 41-Set Tutorial Complete/Temp Password for Program Admin   
	Given the page is loaded
	When I set the checkbox with element id "ucCpsUserModEmployer_chkTutorialComplete" to "true"
	And I set the text box using element id "ucCpsUserModEmployer_ltbNewPwd_TextBox" with the value "Welcome1!"
	And I set the text box using element id "ucCpsUserModEmployer_ltbConfPwd_TextBox" with the value "Welcome1!"
	And I click on the submit button labeled "Submit User Modifications"
	Then the page title is "User Confirmation"

Scenario: 42-Signout from Web-HQ
	Given the page is loaded
	When I click on the button using element id "ucVisNav_hlExit"
	Then the page title is "Login"
	And I close the current page

Scenario: 43-Logon to eVerify as Program Administrator for creating general users
	Given I navigate to the url for "everify" titled "E-Verify: Login"
	When I click on the submit button containing the text "I agree"
	And I set the text box using element id "MainContentPlaceHolder_UserIdTextBox_TextBox" with the value stored in the variable "userid1"
	And I set the text box using element id "MainContentPlaceHolder_PasswordTextBox_TextBox" with the value "Welcome1!"
	And I click on the submit button labeled "Log In"
	Then the page title is "E-Verify: Change Password"
	
Scenario: 44-Submit New Password and Security Questions
	Given the page is loaded
	When I set the text box using element id "MainContentPlaceHolder_ltbOldPwd_TextBox" with the value "Welcome1!"
	And I set the text box using element id "MainContentPlaceHolder_ltbNewPwd_TextBox" with the value "Autotest123!"
	And I set the text box using element id "MainContentPlaceHolder_ltbValidatePwd_TextBox" with the value "Autotest123!"
	And I select the drop down text "What is the name of the first school you attended?" using element id "MainContentPlaceHolder_ucPwdChallengeAnswers_lstQuestion1"
	And I set the text box using element id "MainContentPlaceHolder_ucPwdChallengeAnswers_txtAnswer1_TextBox" with the value "abcde"
	And I select the drop down text "What is the name of your first pet?" using element id "MainContentPlaceHolder_ucPwdChallengeAnswers_lstQuestion2"
	And I set the text box using element id "MainContentPlaceHolder_ucPwdChallengeAnswers_txtAnswer2_TextBox" with the value "fghij"
	And I select the drop down text "What is your father's middle name?" using element id "MainContentPlaceHolder_ucPwdChallengeAnswers_lstQuestion3"
	And I set the text box using element id "MainContentPlaceHolder_ucPwdChallengeAnswers_txtAnswer3_TextBox" with the value "klmno"
	And I click on the submit button labeled "Submit"
	Then the page title is "E-Verify: Update User Profile"

Scenario: 45-Verify User Profile and logon to eVerify
	Given the page is loaded
	Then the text box using element id "MainContentPlaceHolder_ucEvProfileInfoUpdate_ptbPhoneNumber_PhoneAreaCode" contains the value "777"
	Then the text box using element id "MainContentPlaceHolder_ucEvProfileInfoUpdate_ptbPhoneNumber_PhonePrefixCode" contains the value "888"
	Then the text box using element id "MainContentPlaceHolder_ucEvProfileInfoUpdate_ptbPhoneNumber_PhoneSuffixCode" contains the value "9999"
	Then the text box using element id "MainContentPlaceHolder_ucEvProfileInfoUpdate_lteUserEmail_TextBox" contains the value "testuser1@test.com"
	When I click on the submit button labeled "Submit User Profile Changes"
	Then the page title is "E-Verify: Home Page"

Scenario: 46-Add New General User Information
	Given the page is loaded
	When I click on the link using element id "anch_11"
	And I click on the link containing the text "Add New User"
	And I select the drop down text "General User" using element id "MainContentPlaceHolder_vscUserRole_SelectorDrop"
	And I set the text box using element id "MainContentPlaceHolder_ucUserProfile_ltaLastName_TextBox" with the value "WS Employer General User-LN"
	And I set the text box using element id "MainContentPlaceHolder_ucUserProfile_ltaFirstName_TextBox" with the value "WS Empl General User-FN"
	And I set the text box using element id "MainContentPlaceHolder_ucUserProfile_ptbPhoneNumber_PhoneAreaCode" with the value "123"
	And I set the text box using element id "MainContentPlaceHolder_ucUserProfile_ptbPhoneNumber_PhonePrefixCode" with the value "456"
	And I set the text box using element id "MainContentPlaceHolder_ucUserProfile_ptbPhoneNumber_PhoneSuffixCode" with the value "7890"
	And I set the text box using element id "MainContentPlaceHolder_ucUserProfile_ptbPhoneNumber_PhoneExtension" with the value "1111"
	And I set the text box using element id "MainContentPlaceHolder_ucUserProfile_lteEmailAddress_TextBox" with the value "testuser3@test.com"
	And I click on the submit button labeled "Next"
	And I click on the submit button labeled "Submit New User"
	Then the page title is "E-Verify: Add User – Registration Complete"

Scenario: 47-Logon to WebHQ
	Given I navigate to the url for "webhq" titled "Login"
	When I set the checkbox with element id "cb_Iagree" to "true"
	And I click on the button using element id "btnContinue1"
	And I set the text box using element id "txtUserID" with the value for "webhq-username"
	And I set the text box using element id "txtUserPassword" with the value for "webhq-password"
	And I click on the submit button labeled "Login"
	Then the page title is "Web-HQ: Home"
	
Scenario: 48-Search Company 
	Given the page is loaded
	When I click on the link containing the text "Maintain Company"
	And the page title is "Company Search"
	And I set the text box using element id "txtEmployer_TextBox" with the value "EmployerOnlyWebService-One"
	And I click on the submit button labeled "Display Company Summary List"
	Then the page title is "Company Summary List"

Scenario: 49-Navigate to company details
	Given the page is loaded
	When I access the table using tag "table" attribute type "class" attribute value "ControlText"
	And I save the table row number containing the data "ACTIVE" in column number "11" into the variable "tableRowNumber"
	And I click on the button labeled "Edit" in the table row number saved in the variable "tableRowNumber"
	Then the page title is "Company Details"
	
Scenario: 50-Check Total Active Users 
	Given the page is loaded
	When I access table number "4" using tag "table" attribute type "id" attribute value "tblAddress"
	Then table row number "10" column number "2" contains the value "Total Active Users:"
	And table row number "10" column number "3" contains the value "2"

Scenario: 51-Navigate to Employer User Summary List
	Given the page title is "Company Details"
	When I access table number "4" using tag "table" attribute type "id" attribute value "tblAddress"
	And I click on the button labeled "View / Edit" in row number "10"
	Then the page title is "Employer User Summary List"

Scenario: 52-Save General User ID and Edit User
	Given the page is loaded
	When I access the table using element id "dgCpsUsers"
	And I save the data from table row number "4" column number "2" into the variable "userid3" 
	And I click on table row number "4" in column number "2"
	Then the page title is "User Details - View / Modify User Information"

Scenario: 53-Set Tutorial Complete/Temp Password for General User 
	Given the page is loaded
	When I set the checkbox with element id "ucCpsUserModEmployer_chkTutorialComplete" to "true"
	And I set the text box using element id "ucCpsUserModEmployer_ltbNewPwd_TextBox" with the value "Welcome1!"
	And I set the text box using element id "ucCpsUserModEmployer_ltbConfPwd_TextBox" with the value "Welcome1!"
	And I click on the submit button labeled "Submit User Modifications"
	Then the page title is "User Confirmation"

Scenario: 54-Navigate to User Admin Page
	Given the page is loaded
	When I click on the submit button labeled "Back"
	Then the page title is "Employer User Summary List"

Scenario: 55-Signout from Web-HQ
	Given the page is loaded
	When I click on the button using element id "ucVisNav_hlExit"
	Then the page title is "Login"
	And I close the current page

Scenario: 56-Logon to eVerify to set New Password for the New General User
	Given I navigate to the url for "everify" titled "E-Verify: Login"
	When I click on the submit button containing the text "I agree"
	And I set the text box using element id "MainContentPlaceHolder_UserIdTextBox_TextBox" with the value stored in the variable "userid3"
	And I set the text box using element id "MainContentPlaceHolder_PasswordTextBox_TextBox" with the value "Welcome1!"
	And I click on the submit button labeled "Log In"
	Then the page title is "E-Verify: Change Password"
	
Scenario: 57-Submit New Password and Security Questions
	Given the page is loaded
	When I set the text box using element id "MainContentPlaceHolder_ltbOldPwd_TextBox" with the value "Welcome1!"
	And I set the text box using element id "MainContentPlaceHolder_ltbNewPwd_TextBox" with the value "Autotest123!"
	And I set the text box using element id "MainContentPlaceHolder_ltbValidatePwd_TextBox" with the value "Autotest123!"
	And I select the drop down text "What is the name of the first school you attended?" using element id "MainContentPlaceHolder_ucPwdChallengeAnswers_lstQuestion1"
	And I set the text box using element id "MainContentPlaceHolder_ucPwdChallengeAnswers_txtAnswer1_TextBox" with the value "abcde"
	And I select the drop down text "What is the name of your first pet?" using element id "MainContentPlaceHolder_ucPwdChallengeAnswers_lstQuestion2"
	And I set the text box using element id "MainContentPlaceHolder_ucPwdChallengeAnswers_txtAnswer2_TextBox" with the value "fghij"
	And I select the drop down text "What is your father's middle name?" using element id "MainContentPlaceHolder_ucPwdChallengeAnswers_lstQuestion3"
	And I set the text box using element id "MainContentPlaceHolder_ucPwdChallengeAnswers_txtAnswer3_TextBox" with the value "klmno"
	And I click on the submit button labeled "Submit"
	Then the page title is "E-Verify: Update User Profile"

Scenario: 58-Verify User Profile
	Given the page is loaded
	Then the text box using element id "MainContentPlaceHolder_ucEvProfileInfoUpdate_ptbPhoneNumber_PhoneAreaCode" contains the value "123"
	And the text box using element id "MainContentPlaceHolder_ucEvProfileInfoUpdate_ptbPhoneNumber_PhonePrefixCode" contains the value "456"
	And the text box using element id "MainContentPlaceHolder_ucEvProfileInfoUpdate_ptbPhoneNumber_PhoneSuffixCode" contains the value "7890"
	And the text box using element id "MainContentPlaceHolder_ucEvProfileInfoUpdate_lteUserEmail_TextBox" contains the value "testuser3@test.com"
	When I click on the submit button labeled "Submit User Profile Changes"
	Then the page title is "E-Verify: Home Page"

Scenario: 59 - Logout
	Given the page is loaded
	When I click on the button using element id "anch_32"
	Then I close the current page



