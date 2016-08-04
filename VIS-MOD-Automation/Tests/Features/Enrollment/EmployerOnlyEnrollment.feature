Feature: Employer Only Enrollment
		1.  Register Web Service Employer, Add a Program Administrator, Add a General User and validate all.
		2.  Employer Registration Page & Review (Scenarios 01-04) 
		3.  Organization Designation, MOU Signatory, Company Informations, Program Administrator Informations, Registration Review & Enroll (Scenarios 05-15)
		4.  Use WebHQ to edit and validate company, set MOU activation date, save Program Administrator ID, Set Tutorial Complete/Temp Password for Program Admin (Scenarios 31-38)
		5.  Login to everify as a Program Administrator (Scenario 39)
		6.  Validate the Program Administrator - New Password and Security Questions, Verify User Profile (Scenarios 40-41)
		7.  Add a General User (Scenario 42)
		8.  Use WebHQ to edit and validate general user - Set Tutorial Complete/Temp Password for General User, save General User ID (Scenarios 43-51)
		9.  Login to eVerify as a General User (Scenario 52)
		10. Verify General User activation - Submit New Password and Security Questions, Verify User Profile (Scenarios 53-55)
	
Scenario: 01-Navigate to Registration page
	Given I navigate to the url for "registration" titled "E-Verify – Employer Registration – Start Page"
	When I set the checkbox with element id "cb_Iagree" to "true"
	And I click on the submit button labeled "Continue"
	Then the page title is "E-Verify – Employer Registration – Checklist"
	
Scenario: 02-Employer Registration - Checklist
	Given the page is loaded
	When I click on the submit button labeled "Begin E-Verify Enrollment"
	Then the page title is "E-Verify – Employer Registration – Start Here"

Scenario: 03-Employer Access-Y Agent/Corporate-N Web Services-N
	Given the page is loaded
	When I click on the radio button using element id "radBpYes"
	And I click on the radio button using element id "radDaNo"
	And I click on the radio button using element id "radCorpNo"
	And I click on the radio button using element id "radWsNo"
	And I click on the submit button labeled "Next"
	Then the page title is "E-Verify - Employer Registration - Let’s Review"
	And the page contains the text " Employer Access Method."
	
Scenario: 04-Registration Review Page
	Given the page title is "E-Verify - Employer Registration - Let’s Review"
	When I click on the submit button labeled "Next"
	Then the page title is "E-Verify - Employer Registration - Organization Designation"

Scenario: 05-Organization Designation
	Given the page is loaded
	When I select the drop down text "Federal Government" using element id "ucCategory_vscCategory_SelectorDrop"
	And I click on the submit button labeled "Next"
	Then the page title is "E-Verify – Employer Registration – Memorandum of Understanding"

Scenario: 06-Switch to iFrame to verify data
	Given the page is loaded
	When I switch to iframe using element id "ucRegistrationTerms_frmMou"
	Then the page contains the text "MEMORANDUM OF UNDERSTANDING"
	And the page contains the text "FOR EMPLOYERS"
	And I switch back to the body of the page

Scenario: 07-Memorandum of Understanding (MOU)
	Given the page title is "E-Verify – Employer Registration – Memorandum of Understanding"
	When I click on the radio button using element id "ucRegistrationTerms_radAccept"
	And I click on the submit button labeled "Next"
	Then the page title is "E-Verify – Employer Registration – MOU Signatory"

Scenario: 08-MOU Signatory
	Given the page is loaded
	When I set the text box using element id "ucMouPoc_ltLastName_TextBox" with the value "EmployerOnly-LN"
	And I set the text box using element id "ucMouPoc_ltFirstName_TextBox" with the value "EmployerOnly-FN"
	And I set the text box using element id "ucMouPoc_scPhone_PhoneAreaCode" with the value "301"
	And I set the text box using element id "ucMouPoc_scPhone_PhonePrefixCode" with the value "123"
	And I set the text box using element id "ucMouPoc_scPhone_PhoneSuffixCode" with the value "4567"
	And I set the text box using element id "ucMouPoc_ltEmail_TextBox" with the value "automation.bdd@gmail.com"
	And I set the text box using element id "ucMouPoc_ltEmail2_TextBox" with the value "automation.bdd@gmail.com"
	And I select the drop down text "No" using element id "ucMouPoc_optAccess"
	And I click on the button using element id "ucMouPoc_btnNext"
	Then the page title is "E-Verify – Employer Registration – Company Information"

Scenario: 09-Company Information
	Given the page is loaded
	When I set the text box using element id "ucCompanyInfo_txtEmpName_TextBox" with the value "EmployerOnly"
	And I set the text box using element id "ucCompanyInfo_txtAddress1_TextBox" with the value "123 Automation Drive"
	And I set the text box using element id "ucCompanyInfo_txtCity_TextBox" with the value "Rockville"
	And I select the drop down text "MARYLAND" using element id "ucCompanyInfo_vssState_SelectorDrop"
	And I set the text box using element id "ucCompanyInfo_ltzZipCode_TextBox" with the value "20852"
	And I select the drop down text "MONTGOMERY" using element id "ucCompanyInfo_vscCounty_SelectorDrop"
	And I set the text box using element id "ucCompanyInfo_ltnEmployerId_TextBox" with the value "123456789"
	And I select the drop down text "100 to 499" using element id "ucCompanyInfo_vscNbrEmps_SelectorDrop"
	And I click on the button using element id "ucCompanyInfo_btnContinue"
	Then the page title is "E-Verify – Employer Registration – NAICS Code"

Scenario: 10 - NAICS Code for new Web Service Employer
	Given the page is loaded
	When I set the text box using element id "ucNaics_ltNaicsCode_TextBox" with the value "521"
	And I click on the submit button labeled "Accept NAICS Code and Continue"
	Then the page title is "E-Verify – Employer Registration – Hiring Sites"

Scenario: 11-Hiring Sites Verification 
	Given the page is loaded
	Then the selected drop down text using element id "ucSites_rptHiringSites__ctl1_lstStates" is "MARYLAND"
	And the text box using tag "input" attribute type "value" contains the value "1"
	
Scenario: 12-Click Next
	Given the page title is "E-Verify – Employer Registration – Hiring Sites"
	When I click on the submit button labeled "Next"
	Then the page title is "E-Verify – Employer Registration – Program Administrators"

Scenario: 13-Add an Employer Program Administrator
	Given the page is loaded
	When I set the text box using element id "ucRegContacts_rptContacts__ctl0_ltLastName_TextBox" with the value "AO-Employer User-LN-One"
	And I set the text box using element id "ucRegContacts_rptContacts__ctl0_ltFirstName_TextBox" with the value "AO-Employer User-FN-One"
	And I set the text box using element id "ucRegContacts_rptContacts__ctl0_scPhone_PhoneAreaCode" with the value "777"
	And I set the text box using element id "ucRegContacts_rptContacts__ctl0_scPhone_PhonePrefixCode" with the value "888"
	And I set the text box using element id "ucRegContacts_rptContacts__ctl0_scPhone_PhoneSuffixCode" with the value "9999"
	And I set the text box using element id "ucRegContacts_rptContacts__ctl0_ltEmail_TextBox" with the value "testuser1@test.com"
	And I set the text box using element id "ucRegContacts_rptContacts__ctl0_ltEmail2_TextBox" with the value "testuser1@test.com"
	And I click on the submit button labeled "Next"
	Then the page title is "E-Verify – Employer Registration – Registration Review"

Scenario Outline: 14-Registration Review-Verify Registration Details
	Given the page is loaded
	Then the page contains the text <TextOnPage> from the following table

	Examples: 
	| TextOnPage                                      |
	| EmployerOnly                                    |
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
	| AO-Employer User-LN-One                         |
	| AO-Employer User-FN-One                         |
	| (777) 888 - 9999                                |
	| testuser1@test.com                              |

Scenario: 15-Complete Enrollment to Register Employer  
	Given the page title is "E-Verify – Employer Registration – Registration Review"
	When I set the checkbox with element id "ucSummary_chkAgree" to "true"
	And I click on the submit button labeled "Register Employer"
	Then the page title is "E-Verify – Employer Registration – You're Finished"

Scenario: 16-Navigate to Registration page
	Given I navigate to the url for "registration" titled "E-Verify – Employer Registration – Start Page"
	When I set the checkbox with element id "cb_Iagree" to "true"
	And I click on the submit button labeled "Continue"
	Then the page title is "E-Verify – Employer Registration – Checklist"

Scenario: 17-Employer Registration - Checklist
	Given the page is loaded
	When I click on the submit button labeled "Begin E-Verify Enrollment"
	Then the page title is "E-Verify – Employer Registration – Start Here"

Scenario: 18-Employer Access-Y Agent/Corporate-N Web Services-N
	Given the page is loaded
	When I click on the radio button using element id "radBpYes"
	And I click on the radio button using element id "radDaNo"
	And I click on the radio button using element id "radCorpNo"
	And I click on the radio button using element id "radWsNo"
	And I click on the submit button labeled "Next"
	Then the page title is "E-Verify - Employer Registration - Let’s Review"
	And the page contains the text " Employer Access Method."
	
Scenario: 19-Registration Review Page
	Given the page title is "E-Verify - Employer Registration - Let’s Review"
	When I click on the submit button labeled "Next"
	Then the page title is "E-Verify - Employer Registration - Organization Designation"

Scenario: 20-Organization Designation
	Given the page is loaded
	When I select the drop down text "Federal Government" using element id "ucCategory_vscCategory_SelectorDrop"
	And I click on the submit button labeled "Next"
	Then the page title is "E-Verify – Employer Registration – Memorandum of Understanding"

Scenario: 21-Switch to iFrame to verify data
	Given the page is loaded
	When I switch to iframe using element id "ucRegistrationTerms_frmMou"
	Then the page contains the text "MEMORANDUM OF UNDERSTANDING"
	And the page contains the text "FOR EMPLOYERS"
	And I switch back to the body of the page

Scenario: 22-Memorandum of Understanding (MOU)
	Given the page title is "E-Verify – Employer Registration – Memorandum of Understanding"
	When I click on the radio button using element id "ucRegistrationTerms_radAccept"
	And I click on the submit button labeled "Next"
	Then the page title is "E-Verify – Employer Registration – MOU Signatory"

Scenario: 23-MOU Signatory
	Given the page is loaded
	When I set the text box using element id "ucMouPoc_ltLastName_TextBox" with the value "EmployerOnly-LN"
	And I set the text box using element id "ucMouPoc_ltFirstName_TextBox" with the value "EmployerOnly-FN"
	And I set the text box using element id "ucMouPoc_scPhone_PhoneAreaCode" with the value "301"
	And I set the text box using element id "ucMouPoc_scPhone_PhonePrefixCode" with the value "123"
	And I set the text box using element id "ucMouPoc_scPhone_PhoneSuffixCode" with the value "4567"
	And I set the text box using element id "ucMouPoc_ltEmail_TextBox" with the value "automation.bdd@gmail.com"
	And I set the text box using element id "ucMouPoc_ltEmail2_TextBox" with the value "automation.bdd@gmail.com"
	And I select the drop down text "No" using element id "ucMouPoc_optAccess"
	And I click on the button using element id "ucMouPoc_btnNext"
	Then the page title is "E-Verify – Employer Registration – Company Information"

Scenario: 24-Company Information
	Given the page is loaded
	When I set the text box using element id "ucCompanyInfo_txtEmpName_TextBox" with the value "EmployerOnly"
	And I set the text box using element id "ucCompanyInfo_txtAddress1_TextBox" with the value "123 Automation Drive"
	And I set the text box using element id "ucCompanyInfo_txtCity_TextBox" with the value "Rockville"
	And I select the drop down text "MARYLAND" using element id "ucCompanyInfo_vssState_SelectorDrop"
	And I set the text box using element id "ucCompanyInfo_ltzZipCode_TextBox" with the value "20852"
	And I select the drop down text "MONTGOMERY" using element id "ucCompanyInfo_vscCounty_SelectorDrop"
	And I set the text box using element id "ucCompanyInfo_ltnEmployerId_TextBox" with the value "123456789"
	And I select the drop down text "100 to 499" using element id "ucCompanyInfo_vscNbrEmps_SelectorDrop"
	And I click on the button using element id "ucCompanyInfo_btnContinue"
	Then the page title is "E-Verify – Employer Registration – NAICS Code"

Scenario: 25 - NAICS Code for new Web Service Employer
	Given the page is loaded
	When I set the text box using element id "ucNaics_ltNaicsCode_TextBox" with the value "521"
	And I click on the submit button labeled "Accept NAICS Code and Continue"
	Then the page title is "E-Verify – Employer Registration – Hiring Sites"

Scenario: 26-Hiring Sites Verification 
	Given the page is loaded
	Then the selected drop down text using element id "ucSites_rptHiringSites__ctl1_lstStates" is "MARYLAND"
	And the text box using tag "input" attribute type "value" contains the value "1"
	
Scenario: 27-Click Next
	Given the page title is "E-Verify – Employer Registration – Hiring Sites"
	When I click on the submit button labeled "Next"
	Then the page title is "E-Verify – Employer Registration – Program Administrators"

Scenario: 28-Add an Employer Program Administrator
	Given the page is loaded
	When I set the text box using element id "ucRegContacts_rptContacts__ctl0_ltLastName_TextBox" with the value "AO-Employer User-LN-One"
	And I set the text box using element id "ucRegContacts_rptContacts__ctl0_ltFirstName_TextBox" with the value "AO-Employer User-FN-One"
	And I set the text box using element id "ucRegContacts_rptContacts__ctl0_scPhone_PhoneAreaCode" with the value "777"
	And I set the text box using element id "ucRegContacts_rptContacts__ctl0_scPhone_PhonePrefixCode" with the value "888"
	And I set the text box using element id "ucRegContacts_rptContacts__ctl0_scPhone_PhoneSuffixCode" with the value "9999"
	And I set the text box using element id "ucRegContacts_rptContacts__ctl0_ltEmail_TextBox" with the value "testuser1@test.com"
	And I set the text box using element id "ucRegContacts_rptContacts__ctl0_ltEmail2_TextBox" with the value "testuser1@test.com"
	And I click on the submit button labeled "Next"
	Then the page title is "E-Verify – Employer Registration – Registration Review"

Scenario Outline: 29-Registration Review-Verify Registration Details
	Given the page is loaded
	Then the page contains the text <TextOnPage> from the following table

	Examples: 
	| TextOnPage                                      |
	| EmployerOnly                                    |
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
	| AO-Employer User-LN-One                         |
	| AO-Employer User-FN-One                         |
	| (777) 888 - 9999                                |
	| testuser1@test.com                              |

Scenario: 30-Complete Enrollment to Register Employer  
	Given the page title is "E-Verify – Employer Registration – Registration Review"
	When I set the checkbox with element id "ucSummary_chkAgree" to "true"
	And I click on the submit button labeled "Register Employer"
	Then the page title is "E-Verify – Employer Registration – You're Finished"

Scenario: 31-Logon to WebHQ
	Given I navigate to the url for "webhq" titled "Login"
	When I set the checkbox with element id "cb_Iagree" to "true"
	And I click on the button using element id "btnContinue1"
	And I set the text box using element id "txtUserID" with the value for "webhq-username"
	And I set the text box using element id "txtUserPassword" with the value for "webhq-password"
	And I click on the submit button labeled "Login"
	Then the page title is "Web-HQ: Home"
	
Scenario: 32-Search Company 
	Given the page is loaded
	When I click on the link containing the text "Maintain Company"
	And the page title is "Company Search"
	And I set the text box using element id "txtEmployer_TextBox" with the value "EmployerOnly"
	And I click on the submit button labeled "Display Company Summary List"
	Then the page title is "Company Summary List"

Scenario: 33-Navigate to company details
	Given the page is loaded
	When I access the table using tag "table" attribute type "class" attribute value "ControlText"
	And I save the table row number containing the data "PENDING" in column number "11" into the variable "tableRowNumber"
	And I click on the button labeled "Edit" in the table row number saved in the variable "tableRowNumber"
	Then the page title is "Company Details"
	And the page contains the text "WEB-BP"
	
Scenario: 34-Validate and Match Company
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

Scenario: 35-Set MOU Signed Date & Check Status
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
	
Scenario: 36-Save Active User ID and Edit User
	Given the page title is "Company Details"
	When I access table number "4" using tag "table" attribute type "id" attribute value "tblAddress"
	And I click on the button labeled "View / Edit" in row number "10"
	And the page title is "Employer User Summary List"
	And I access the table using element id "dgCpsUsers"
	And I save the data from table row number "3" column number "2" into the variable "userid1" 
	And I click on table row number "3" in column number "2"
	Then the page title is "User Details - View / Modify User Information"

Scenario: 37-Set Tutorial Complete/Temp Password for Program Admin   
	Given the page is loaded
	When I set the checkbox with element id "ucCpsUserModEmployer_chkTutorialComplete" to "true"
	And I set the text box using element id "ucCpsUserModEmployer_ltbNewPwd_TextBox" with the value "Welcome1!"
	And I set the text box using element id "ucCpsUserModEmployer_ltbConfPwd_TextBox" with the value "Welcome1!"
	And I click on the submit button labeled "Submit User Modifications"
	Then the page title is "User Confirmation"

Scenario: 38-Signout from Web-HQ
	Given the page is loaded
	When I click on the button using element id "ucVisNav_hlExit"
	Then the page title is "Login"
	And I close the current page

Scenario: 39-Logon to eVerify for creating general users
	Given I navigate to the url for "everify" titled "E-Verify: Login"
	When I click on the submit button containing the text "I agree"
	And I set the text box using element id "MainContentPlaceHolder_UserIdTextBox_TextBox" with the value stored in the variable "userid1"
	And I set the text box using element id "MainContentPlaceHolder_PasswordTextBox_TextBox" with the value "Welcome1!"
	And I click on the submit button labeled "Log In"
	Then the page title is "E-Verify: Change Password"
	
Scenario: 40-Submit New Password and Security Questions
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

Scenario: 41-Verify User Profile and logon to eVerify
	Given the page is loaded
	Then the text box using element id "MainContentPlaceHolder_ucEvProfileInfoUpdate_ptbPhoneNumber_PhoneAreaCode" contains the value "777"
	Then the text box using element id "MainContentPlaceHolder_ucEvProfileInfoUpdate_ptbPhoneNumber_PhonePrefixCode" contains the value "888"
	Then the text box using element id "MainContentPlaceHolder_ucEvProfileInfoUpdate_ptbPhoneNumber_PhoneSuffixCode" contains the value "9999"
	Then the text box using element id "MainContentPlaceHolder_ucEvProfileInfoUpdate_lteUserEmail_TextBox" contains the value "testuser1@test.com"
	When I click on the submit button labeled "Submit User Profile Changes"
	Then the page title is "E-Verify: Home Page"

Scenario: 42-New General User Information
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

Scenario: 43-Logon to WebHQ
	Given I navigate to the url for "webhq" titled "Login"
	When I set the checkbox with element id "cb_Iagree" to "true"
	And I click on the button using element id "btnContinue1"
	And I set the text box using element id "txtUserID" with the value for "webhq-username"
	And I set the text box using element id "txtUserPassword" with the value for "webhq-password"
	And I click on the submit button labeled "Login"
	Then the page title is "Web-HQ: Home"
	
Scenario: 44-Search Company  
	Given the page is loaded
	When I click on the link containing the text "Maintain Company"
	And the page title is "Company Search"
	And I set the text box using element id "txtEmployer_TextBox" with the value "EmployerOnly"
	And I click on the submit button labeled "Display Company Summary List"
	Then the page title is "Company Summary List"

Scenario: 45-Navigate to company details
	Given the page is loaded
	When I access the table using tag "table" attribute type "class" attribute value "ControlText"
	And I click on the link containing the text "Last Update Date"
	And I click on the link containing the text "Last Update Date"
	And I click on table row number "3" in column number "1"
	Then the page title is "Company Details"
	
Scenario: 46-Check Total Active Users 
	Given the page is loaded
	When I access table number "4" using tag "table" attribute type "id" attribute value "tblAddress"
	Then table row number "10" column number "2" contains the value "Total Active Users:"
	And table row number "10" column number "3" contains the value "2"

Scenario: 47-Navigate to Employer User Summary List
	Given the page title is "Company Details"
	When I access table number "4" using tag "table" attribute type "id" attribute value "tblAddress"
	And I click on the button labeled "View / Edit" in row number "10"
	Then the page title is "Employer User Summary List"

Scenario: 48-Save General User ID and Edit User
	Given the page is loaded
	When I access the table using element id "dgCpsUsers"
	And I save the data from table row number "4" column number "2" into the variable "userid3" 
	And I click on table row number "4" in column number "2"
	Then the page title is "User Details - View / Modify User Information"

Scenario: 49-Set Tutorial Complete/Temp Password for General User 
	Given the page is loaded
	When I set the checkbox with element id "ucCpsUserModEmployer_chkTutorialComplete" to "true"
	And I set the text box using element id "ucCpsUserModEmployer_ltbNewPwd_TextBox" with the value "Welcome1!"
	And I set the text box using element id "ucCpsUserModEmployer_ltbConfPwd_TextBox" with the value "Welcome1!"
	And I click on the submit button labeled "Submit User Modifications"
	Then the page title is "User Confirmation"

Scenario: 50-Navigate to User Admin Page
	Given the page is loaded
	When I click on the submit button labeled "Back"
	Then the page title is "Employer User Summary List"

Scenario: 51-Signout from Web-HQ
	Given the page is loaded
	When I click on the button using element id "ucVisNav_hlExit"
	Then the page title is "Login"
	And I close the current page

Scenario: 52-Logon to eVerify to set New Password for the New General User
	Given I navigate to the url for "everify" titled "E-Verify: Login"
	When I click on the submit button containing the text "I agree"
	And I set the text box using element id "MainContentPlaceHolder_UserIdTextBox_TextBox" with the value stored in the variable "userid3"
	And I set the text box using element id "MainContentPlaceHolder_PasswordTextBox_TextBox" with the value "Welcome1!"
	And I click on the submit button labeled "Log In"
	Then the page title is "E-Verify: Change Password"
	
Scenario: 53-Submit New Password and Security Questions
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

Scenario: 54-Verify User Profile
	Given the page is loaded
	Then the text box using element id "MainContentPlaceHolder_ucEvProfileInfoUpdate_ptbPhoneNumber_PhoneAreaCode" contains the value "123"
	And the text box using element id "MainContentPlaceHolder_ucEvProfileInfoUpdate_ptbPhoneNumber_PhonePrefixCode" contains the value "456"
	And the text box using element id "MainContentPlaceHolder_ucEvProfileInfoUpdate_ptbPhoneNumber_PhoneSuffixCode" contains the value "7890"
	And the text box using element id "MainContentPlaceHolder_ucEvProfileInfoUpdate_lteUserEmail_TextBox" contains the value "testuser3@test.com"
	When I click on the submit button labeled "Submit User Profile Changes"
	Then the page title is "E-Verify: Home Page"

Scenario: 55 - Logout
	Given the page is loaded
	When I click on the button using element id "anch_19"
	Then I close the current page
