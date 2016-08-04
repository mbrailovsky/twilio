Feature: Corporate Employer Enrollment
		1.  Register Corporate Employer, Add a Corporate Administrator, Add a Location & Program Administrator and validate all.
		2.  Employer Registration Page & Review (Scenarios 01-06) 
		3.  Company & Corporate Administrator Informations (Scenarios 07,08)
		4.  Registration Review & Enroll  (Scenario 09,10)
		5.  Use WebHQ to edit and validate company, set MOU activation date, save Program Administrator ID, Set Tutorial Complete/Temp Password for Corporate Admin (Scenarios 21-28)
		6.  Login to everify as a Corporate Administrator (Scenario 29)
		7.  Validate the Program Administrator - New Password and Security Questions, Verify User Profile (Scenarios 30-31)
		8.  Add a New Location (Scenario 32)
		9.  Organization Designation, MOU Signatory, Company Informations, Program Administrator Informations, Registration Review & Enroll (Scenarios 33-44)
		10. Use WebHQ to edit and validate Location, Program Administrator - set MOU activation date, save Program Administrator ID, Set Tutorial Complete/Temp Password for Corporate Admin (Scenarios 45-52)
		11. Login to eVerify as a Program Administrator (Scenario 53)
		12. Verify Program Administration activation - Submit New Password and Security Questions, Verify User Profile (Scenarios 54-56)

Scenario: 01-Navigate to Employer Registration page
	Given I navigate to the url for "registration" titled "E-Verify – Employer Registration – Start Page"
	When I set the checkbox with element id "cb_Iagree" to "true"
	And I click on the submit button labeled "Continue"
	Then the page title is "E-Verify – Employer Registration – Checklist"

Scenario: 02-Employer Registration - Checklist
	Given the page is loaded
	When I click on the submit button labeled "Begin E-Verify Enrollment"
	Then the page title is "E-Verify – Employer Registration – Start Here"

Scenario: 03-Employer Access-Y Agent-N Corporate-Y Web Services-N
	Given the page is loaded
	When I click on the radio button using element id "radBpYes"
	And I click on the radio button using element id "radDaNo"
	And I click on the radio button using element id "radCorpYes"
	And I click on the radio button using element id "radWsNo"
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
	| 4  | Yes   |
	| 5  | No    |

Scenario: 06-Registration Review Page
	Given the page title is "E-Verify - Employer Registration - Let’s Review"
	When I click on the submit button labeled "Next"
	Then the page title is "E-Verify – Employer Registration – Company Information"

Scenario: 07-Company Information
	Given the page is loaded
	When I set the text box using element id "ucCAAddressAdmin_txtParentName_TextBox" with the value "CorporateEmployer"
	And I set the text box using element id "ucCAAddressAdmin_txtAddress1_TextBox" with the value "123 Automation Drive"
	And I set the text box using element id "ucCAAddressAdmin_txtCity_TextBox" with the value "Rockville"
	And I select the drop down text "MARYLAND" using element id "ucCAAddressAdmin_vssState_SelectorDrop"
	And I set the text box using element id "ucCAAddressAdmin_ltzZipCode_TextBox" with the value "20852"
	And I select the drop down text "MONTGOMERY" using element id "ucCAAddressAdmin_vscCounty_SelectorDrop"
	And I click on the submit button labeled "Next"
	Then the page title is "E-Verify – Employer Registration - Corporate Administrator Users"

Scenario: 08 - Corporate Administrator Details
	Given the page is loaded
	When I set the text box using element id "ucCorpPocs_rptContacts__ctl0_ltLastName_TextBox" with the value "CO-Employer User-LN-One"
	And I set the text box using element id "ucCorpPocs_rptContacts__ctl0_ltFirstName_TextBox" with the value "CO-Employer User-FN-One"
	And I set the text box using element id "ucCorpPocs_rptContacts__ctl0_scPhone_PhoneAreaCode" with the value "777"
	And I set the text box using element id "ucCorpPocs_rptContacts__ctl0_scPhone_PhonePrefixCode" with the value "888"
	And I set the text box using element id "ucCorpPocs_rptContacts__ctl0_scPhone_PhoneSuffixCode" with the value "9999"
	And I set the text box using element id "ucCorpPocs_rptContacts__ctl0_ltEmail_TextBox" with the value "testuser1@test.com"
	And I set the text box using element id "ucCorpPocs_rptContacts__ctl0_ltEmail2_TextBox" with the value "testuser1@test.com"
	And I click on the submit button labeled "Next"
	Then the page title is "E-Verify – Employer Registration – Registration Review"

Scenario Outline: 09-Registration Review-Verify Registration Details
	Given the page is loaded
	Then the page contains the text <TextOnPage> from the following table

	Examples: 
	| TextOnPage                                      |
	| CorporateEmployer                               |
	| 123 Automation Drive                            |
	| Rockville                                       |
	| MD                                              |
	| 20852                                           |
	| MONTGOMERY                                      |
	| CO-Employer User-LN-One                         |
	| CO-Employer User-FN-One                         |
	| (777) 888 - 9999                                |
	| testuser1@test.com                              |

Scenario: 10-Complete Enrollment to Register Corporate Employer 
	Given the page title is "E-Verify – Employer Registration – Registration Review"
	When I set the checkbox with element id "ucCAAddressAdminRegResults_chkAgree" to "true"
	And I click on the submit button labeled "Register Company"
	Then the page title is "E-Verify – Employer Registration – You're Finished"
					
Scenario: 11-Navigate to Employer Registration page
	Given I navigate to the url for "registration" titled "E-Verify – Employer Registration – Start Page"
	When I set the checkbox with element id "cb_Iagree" to "true"
	And I click on the submit button labeled "Continue"
	Then the page title is "E-Verify – Employer Registration – Checklist"

Scenario: 12-Employer Registration - Checklist
	Given the page is loaded
	When I click on the submit button labeled "Begin E-Verify Enrollment"
	Then the page title is "E-Verify – Employer Registration – Start Here"

Scenario: 13-Employer Access-Y Agent-N Corporate-Y Web Services-N
	Given the page is loaded
	When I click on the radio button using element id "radBpYes"
	And I click on the radio button using element id "radDaNo"
	And I click on the radio button using element id "radCorpYes"
	And I click on the radio button using element id "radWsNo"
	And I click on the submit button labeled "Next"
	Then the page title is "E-Verify - Employer Registration - Let’s Review"

Scenario: 14-Registration Review Page Verification
	Given the page is loaded
	When I access the table using tag "div" attribute type "class" attribute value "box"

Scenario Outline: 15 - Registration Review Table Verification
	Then table row number <Row> contains the values <Answer> from the following table
	
	Examples: 
	| Row| Answer|
	| 2  | Yes   |
	| 3  | No    |
	| 4  | Yes   |
	| 5  | No    |

Scenario: 16-Registration Review Page
	Given the page title is "E-Verify - Employer Registration - Let’s Review"
	When I click on the submit button labeled "Next"
	Then the page title is "E-Verify – Employer Registration – Company Information"

Scenario: 17-Company Information
	Given the page is loaded
	When I set the text box using element id "ucCAAddressAdmin_txtParentName_TextBox" with the value "CorporateEmployer"
	And I set the text box using element id "ucCAAddressAdmin_txtAddress1_TextBox" with the value "123 Automation Drive"
	And I set the text box using element id "ucCAAddressAdmin_txtCity_TextBox" with the value "Rockville"
	And I select the drop down text "MARYLAND" using element id "ucCAAddressAdmin_vssState_SelectorDrop"
	And I set the text box using element id "ucCAAddressAdmin_ltzZipCode_TextBox" with the value "20852"
	And I select the drop down text "MONTGOMERY" using element id "ucCAAddressAdmin_vscCounty_SelectorDrop"
	And I click on the submit button labeled "Next"
	Then the page title is "E-Verify – Employer Registration - Corporate Administrator Users"

Scenario: 18 - Corporate Administrator Details
	Given the page is loaded
	When I set the text box using element id "ucCorpPocs_rptContacts__ctl0_ltLastName_TextBox" with the value "CO-Employer User-LN-One"
	And I set the text box using element id "ucCorpPocs_rptContacts__ctl0_ltFirstName_TextBox" with the value "CO-Employer User-FN-One"
	And I set the text box using element id "ucCorpPocs_rptContacts__ctl0_scPhone_PhoneAreaCode" with the value "777"
	And I set the text box using element id "ucCorpPocs_rptContacts__ctl0_scPhone_PhonePrefixCode" with the value "888"
	And I set the text box using element id "ucCorpPocs_rptContacts__ctl0_scPhone_PhoneSuffixCode" with the value "9999"
	And I set the text box using element id "ucCorpPocs_rptContacts__ctl0_ltEmail_TextBox" with the value "testuser1@test.com"
	And I set the text box using element id "ucCorpPocs_rptContacts__ctl0_ltEmail2_TextBox" with the value "testuser1@test.com"
	And I click on the submit button labeled "Next"
	Then the page title is "E-Verify – Employer Registration – Registration Review"

Scenario Outline: 19-Registration Review-Verify Registration Details
	Given the page is loaded
	Then the page contains the text <TextOnPage> from the following table

	Examples: 
	| TextOnPage                                      |
	| CorporateEmployer                               |
	| 123 Automation Drive                            |
	| Rockville                                       |
	| MD                                              |
	| 20852                                           |
	| MONTGOMERY                                      |
	| CO-Employer User-LN-One                         |
	| CO-Employer User-FN-One                         |
	| (777) 888 - 9999                                |
	| testuser1@test.com                              |

Scenario: 20-Complete Enrollment to Register Corporate Employer 
	Given the page title is "E-Verify – Employer Registration – Registration Review"
	When I set the checkbox with element id "ucCAAddressAdminRegResults_chkAgree" to "true"
	And I click on the submit button labeled "Register Company"
	Then the page title is "E-Verify – Employer Registration – You're Finished"

Scenario: 21-Logon to WebHQ
	Given I navigate to the url for "webhq" titled "Login"
	When I set the checkbox with element id "cb_Iagree" to "true"
	And I click on the button using element id "btnContinue1"
	And I set the text box using element id "txtUserID" with the value for "webhq-username"
	And I set the text box using element id "txtUserPassword" with the value for "webhq-password"
	And I click on the submit button labeled "Login"
	Then the page title is "Web-HQ: Home"
	
Scenario: 22-Search Company 
	Given the page is loaded
	When I click on the link containing the text "Maintain Company"
	And the page title is "Company Search"
	And I set the text box using element id "txtEmployer_TextBox" with the value "CorporateEmployer"
	And I click on the submit button labeled "Display Company Summary List"
	Then the page title is "Company Summary List"

Scenario: 23-Navigate to Company details
	Given the page is loaded
	When I access the table using tag "table" attribute type "class" attribute value "ControlText"
	And I save the table row number containing the data "PENDING" in column number "11" into the variable "tableRowNumber"
	And I click on the button labeled "Edit" in the table row number saved in the variable "tableRowNumber"
	Then the page title is "ParentSummary"
	
Scenario: 24-Validate and Match Company
	Given the page is loaded
	When I click on the submit button labeled "IIP Match Review"
	And the page title is "IIP Match Review"
	And I skip scenario if element is missing using tag "input" attribute type "value" attribute value "Confirm Company Validity"
	And I click on the submit button labeled "Confirm Company Validity"
	And I select the drop down text "Match" using element id "vscMatchStatus_SelectorDrop"
	And I click on the submit button labeled "Confirm Validity"
	And the page title is "ParentSummary"
	And I click on the submit button labeled "IIP Match Review"
	And I access table number "2" using tag "table" attribute type "id" attribute value "structure"
	Then table row number "1" column number "2" contains the value "Match"
	
Scenario: 25-Set MOU Signed Date & Check Status
	Given the page title is "IIP Match Review"
	When I click on the submit button labeled "Return to Maintain Company"
	And the page title is "ParentSummary"
	And I click on the button using element id "btnAccessInfo" 
	And the page title is "Corporate Maintenance"
	And I set the text box using element id "cdtStartDate_dateTextBox" with the value "06/20/2016"
	And I click on the submit button labeled "Submit Company Information"
	Then the page title is "ParentSummary"
		
Scenario: 26-Save Active User ID and Edit User
	Given the page is loaded
	When I click on the button using element id "btnUser"
	And the page title is "Employer User Summary List"
	And I access the table using element id "dgCpsUsers"
	And I save the data from table row number "3" column number "2" into the variable "userid1" 
	And I click on table row number "3" in column number "2"
	Then the page title is "User Details - View / Modify User Information"

Scenario: 27-Set Tutorial Complete/Temp Password for Corporate Admin   
	Given the page is loaded
	When I set the checkbox with element id "ucCpsUserModEmployer_chkTutorialComplete" to "true"
	And I set the text box using element id "ucCpsUserModEmployer_ltbNewPwd_TextBox" with the value "Welcome1!"
	And I set the text box using element id "ucCpsUserModEmployer_ltbConfPwd_TextBox" with the value "Welcome1!"
	And I click on the submit button labeled "Submit User Modifications"
	Then the page title is "User Confirmation"

Scenario: 28-Signout from Web-HQ
	Given the page is loaded
	When I click on the button using element id "ucVisNav_hlExit"
	Then the page title is "Login"
	And I close the current page

Scenario: 29-Logon to eVerify as Corp.Admin. to create Location/Program Admin.
	Given I navigate to the url for "everify" titled "E-Verify: Login"
	When I click on the submit button containing the text "I agree"
	And I set the text box using element id "MainContentPlaceHolder_UserIdTextBox_TextBox" with the value stored in the variable "userid1"
	And I set the text box using element id "MainContentPlaceHolder_PasswordTextBox_TextBox" with the value "Welcome1!"
	And I click on the submit button labeled "Log In"
	Then the page title is "E-Verify: Change Password"

Scenario: 30-Submit New Password and Security Questions
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

Scenario: 31-Verify Corporate Administrator Profile 
	Given the page is loaded
	Then the text box using element id "MainContentPlaceHolder_ucEvProfileInfoUpdate_ptbPhoneNumber_PhoneAreaCode" contains the value "777"
	Then the text box using element id "MainContentPlaceHolder_ucEvProfileInfoUpdate_ptbPhoneNumber_PhonePrefixCode" contains the value "888"
	Then the text box using element id "MainContentPlaceHolder_ucEvProfileInfoUpdate_ptbPhoneNumber_PhoneSuffixCode" contains the value "9999"
	Then the text box using element id "MainContentPlaceHolder_ucEvProfileInfoUpdate_lteUserEmail_TextBox" contains the value "testuser1@test.com"
	When I click on the submit button labeled "Submit User Profile Changes"
	Then the page title is "E-Verify: Home Page"

Scenario: 32-Click Add New Location under Company Locations
	Given the page is loaded
	When I click on the button using element id "anch_3"
	And I click on the link containing the text "Add New Location"
	Then the page title is "E-Verify: Employer Wizard - Organization Designation"

Scenario: 33-Organization Designation
	Given the page is loaded
	When I select the drop down text "Federal Government" using element id "MainContentPlaceHolder_EmployerCategory1_ddlCategory"
	And I click on the submit button labeled "Next"
	Then the page title is "E-Verify: Employer Wizard - MOU Notice"

Scenario: 34-Switch to iFrame to verify data
	Given the page is loaded
	When I switch to iframe using element id "MainContentPlaceHolder_MouNotice_frmMou"
	Then the page contains the text "MEMORANDUM OF UNDERSTANDING"
	And I switch back to the body of the page

Scenario: 35-Memorandum of Understanding (MOU)
	Given the page title is "E-Verify: Employer Wizard - MOU Notice"
	When I click on the radio button using element id "MainContentPlaceHolder_MouNotice_radAccept"
	And I click on the submit button labeled "Next"
	Then the page title is "E-Verify: Employer Wizard - Company Information"

Scenario: 36-Company Details for the Location
	Given the page is loaded
	When I set the text box using element id "MainContentPlaceHolder_CompanyInformation1_txtEmpName_TextBox" with the value "CorporateEmployer"
	And I set the text box using element id "MainContentPlaceHolder_CompanyInformation1_txtAddress1_TextBox" with the value "123 Automation Drive"
	And I set the text box using element id "MainContentPlaceHolder_CompanyInformation1_txtCity_TextBox" with the value "Rockville"
	And I select the drop down text "MARYLAND" using element id "MainContentPlaceHolder_CompanyInformation1_ddlState"
	And I set the text box using element id "MainContentPlaceHolder_CompanyInformation1_ltzZipCode_TextBox" with the value "20852"
	And I select the drop down text "MONTGOMERY" using element id "MainContentPlaceHolder_CompanyInformation1_ddlCounty"
	And I set the text box using element id "MainContentPlaceHolder_CompanyInformation1_ltnEmployerId_TextBox" with the value "123456789"
	And I select the drop down text "100 to 499" using element id "MainContentPlaceHolder_CompanyInformation1_ddlTotalEmployeeRange"
	And I click on the submit button labeled "Next"
	Then the page title is "E-Verify: Employer Wizard - Enter NAICS Code"

Scenario: 37 - NAICS Code for new Web Service Employer
	Given the page is loaded
	When I set the text box using element id "MainContentPlaceHolder_Naics_ltNaicsCode_TextBox" with the value "521"
	And I click on the submit button labeled "Accept NAICS Code"
	Then the page title is "E-Verify: Employer Wizard - How Many Hiring Sites?"

Scenario: 38-Hiring Sites Verification
	Given the page is loaded
	When I click on the submit button labeled "Single Site Verification"
	Then the page title is "E-Verify: Employer Wizard - Enter Program Administrator"

Scenario: 39-Program Administrator Details
	Given the page is loaded
	When I set the text box using element id "MainContentPlaceHolder_ucContacts_ltaLastName_TextBox" with the value "AO-Corporate Employer User-LN-One"
	And I set the text box using element id "MainContentPlaceHolder_ucContacts_ltaFirstName_TextBox" with the value "AO-Corp Empl User-FN-One"
	And I set the text box using element id "MainContentPlaceHolder_ucContacts_ptbPhoneNumber_PhoneAreaCode" with the value "777"
	And I set the text box using element id "MainContentPlaceHolder_ucContacts_ptbPhoneNumber_PhonePrefixCode" with the value "888"
	And I set the text box using element id "MainContentPlaceHolder_ucContacts_ptbPhoneNumber_PhoneSuffixCode" with the value "9999"
	And I set the text box using element id "MainContentPlaceHolder_ucContacts_lteEmailAddress_TextBox" with the value "testuser2@test.com"
	And I click on the submit button labeled "Next"
	Then the page title is "E-Verify: Employer Wizard - Points of Contact Summary List"

Scenario Outline: 40-Point of Contact/Program Adminintrator Summary List
	Given the page is loaded
	Then the page contains the text <TextOnPage> from the following table

	Examples: 
	| TextOnPage                          |
	| AO-Corporate Employer User-LN-One   |
	| AO-Corp Empl User-FN-One            |
	| (777) 888 - 9999                    |
	| testuser2@test.com                  |

Scenario: 41-POC/Program Admin confirmation
	Given the page title is "E-Verify: Employer Wizard - Points of Contact Summary List"
	When I click on the submit button labeled "Next"
	Then the page title is "E-Verify: Employer Wizard - Company Information"

Scenario Outline: 42-Company Information-Review
	Given the page is loaded
	Then the page contains the text <TextOnPage> from the following table

	Examples: 
	| TextOnPage                 |
	| CorporateEmployer          |
	| 123 Automation Drive       |
	| Rockville                  |
	| MD                         |
	| 20852                      |
	| MONTGOMERY                 |
	| 123456789                  |
	| 100 to 499                 |
	| CorporateEmployer          |
	| Federal Government         |

Scenario: 43-Register Employer
	Given the page title is "E-Verify: Employer Wizard - Company Information"
	When I click on the submit button labeled "Register Employer"
	Then the page title is "E-Verify: Employer Wizard - Thank you for registering for E-Verify"

Scenario: 44-Logout of E-verify
	Given the page is loaded
	When I click on the link using element id "anch_26"
	Then the page title is "E-Verify: Login"
	And I close the current page

Scenario: 45-Logon to WebHQ
	Given I navigate to the url for "webhq" titled "Login"
	When I set the checkbox with element id "cb_Iagree" to "true"
	And I click on the button using element id "btnContinue1"
	And I set the text box using element id "txtUserID" with the value for "webhq-username"
	And I set the text box using element id "txtUserPassword" with the value for "webhq-password"
	And I click on the submit button labeled "Login"
	Then the page title is "Web-HQ: Home"
	
Scenario: 46-Search Company - Location  
	Given the page is loaded
	When I click on the link containing the text "Maintain Company"
	And the page title is "Company Search"
	And I set the text box using element id "txtEmployer_TextBox" with the value "CorporateEmployer"
	And I click on the submit button labeled "Display Company Summary List"
	Then the page title is "Company Summary List"

Scenario: 47-Navigate to Company details
	Given the page is loaded
	When I access the table using tag "table" attribute type "class" attribute value "ControlText"
	And I save the table row number containing the data "CorporateEmployer" in column number "3" into the variable "tableRowNumber1"
	And I click on the button labeled "Edit" in the table row number saved in the variable "tableRowNumber1"
	Then the page title is "Company Details"
	And the page contains the text "WEB-BP"

Scenario: 48-IIP Match for Corporate Employer - Location
	Given the page title is "Company Details"
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
	
Scenario: 49-Set MOU Signed Date & Check Status
	Given the page title is "IIP Match Review"
	When I click on the submit button labeled "Return to Maintain Company"
	And the page title is "Company Details"
	And I click on the button using element id "ucSummary_btnAccessInfo" 
	And the page title is "Company Details"
	And I set the text box using element id "ucCompanyAccess_cdtMOUDate_dateTextBox" with the value "06/20/2016"
	And I click on the submit button labeled "Submit Information"
	Then the page title is "Company Details"

Scenario: 50-Save Active Program Administrator ID and Edit Program Administrator
	Given the page is loaded
	When I click on the button using element id "ucSummary_btnUser"
	And the page title is "Employer User Summary List"
	And I access the table using element id "dgCpsUsers"
	And I save the data from table row number "3" column number "2" into the variable "userid2" 
	And I click on table row number "3" in column number "2"
	Then the page title is "User Details - View / Modify User Information"

Scenario: 51-Set Tutorial Complete/Temp Password for Program Admin   
	Given the page title is "User Details - View / Modify User Information"
	When I set the checkbox with element id "ucCpsUserModEmployer_chkTutorialComplete" to "true"
	And I set the text box using element id "ucCpsUserModEmployer_ltbNewPwd_TextBox" with the value "Welcome1!"
	And I set the text box using element id "ucCpsUserModEmployer_ltbConfPwd_TextBox" with the value "Welcome1!"
	And I click on the submit button labeled "Submit User Modifications"
	Then the page title is "User Details - User Confirmation"

Scenario: 52-Signout from Web-HQ
	Given the page is loaded
	When I click on the button using element id "ucVisNav_hlExit"
	Then the page title is "Login"
	And I close the current page

Scenario: 53-Logon to eVerify as Prog.Admin. to change password
	Given I navigate to the url for "everify" titled "E-Verify: Login"
	When I click on the submit button containing the text "I agree"
	And I set the text box using element id "MainContentPlaceHolder_UserIdTextBox_TextBox" with the value stored in the variable "userid2"
	And I set the text box using element id "MainContentPlaceHolder_PasswordTextBox_TextBox" with the value "Welcome1!"
	Then the page title is "E-Verify: Change Password"

Scenario: 54-Submit New Password and Security Questions
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

Scenario: 55-Verify User Profile and logon to eVerify
	Given the page is loaded
	Then the text box using element id "MainContentPlaceHolder_ucEvProfileInfoUpdate_ptbPhoneNumber_PhoneAreaCode" contains the value "777"
	Then the text box using element id "MainContentPlaceHolder_ucEvProfileInfoUpdate_ptbPhoneNumber_PhonePrefixCode" contains the value "888"
	Then the text box using element id "MainContentPlaceHolder_ucEvProfileInfoUpdate_ptbPhoneNumber_PhoneSuffixCode" contains the value "9999"
	Then the text box using element id "MainContentPlaceHolder_ucEvProfileInfoUpdate_lteUserEmail_TextBox" contains the value "testuser2@test.com"
	When I click on the submit button labeled "Submit User Profile Changes"
	Then the page title is "E-Verify: Home Page"

Scenario: 56 - Logout of E-Verify
	Given the page is loaded
	When I click on the button using element id "anch_24"
	Then I close the current page
