Feature: Agent New Client WebServices Enrollment
		1.  Web Services for E-Verify Employer Agent and New Client Enrollment - Register Web Service Employer Agent, Add an Agent Program Administrator, Add a New Client and validate all
		2.  Employer Registration Page & Review (Scenarios 01-06) 
		3.  Organization Designation, MOU Signatory, Company Informations, Agent Program Administrator Informations, Registration Review & Enroll (Scenarios 07-17)
		4.  Use WebHQ - search for agent to edit and validate company, set MOU activation date, save Program Administrator ID, Set Tutorial Complete/Temp Password for Program Admin (Scenarios 34-43)
		5.  Login to everify as an Agent Program Administrator (Scenario 44)
		6.  Validate the Program Administrator - New Password and Security Questions, Verify User Profile (Scenarios 45,46)
		7.  Add a New Client, Organization Designation, Client Informations, Point of Contact(POC), Review & Register  (Scenario 47-56)
		8.  Verify newly added client (Scenario 57-58)
		9.  Use WebHQ - search for client to edit and validate Client - Set Mou date for new client (Scenarios 59-60)
		10. Login to eVerify as an Agent Program Administrator and validate new client activation (Scenario 61-62) 
				
Scenario: 01-Navigate to Agent Registration page
	Given I navigate to the url for "registration" titled "E-Verify – Employer Registration – Start Page"
	When I set the checkbox with element id "cb_Iagree" to "true"
	And I click on the submit button labeled "Continue"
	Then the page title is "E-Verify – Employer Registration – Checklist"

Scenario: 02-Employer Registration - Checklist
	Given the page is loaded
	Given the page title is "E-Verify – Employer Registration – Checklist"
	When I click on the submit button labeled "Begin E-Verify Enrollment"
	Then the page title is "E-Verify – Employer Registration – Start Here"

Scenario: 03-Employer Access-N Agent-Y Corporate-N Web Services-Y
	Given the page title is "E-Verify – Employer Registration – Start Here"
	When I click on the radio button using element id "radBpNo"
	And I click on the radio button using element id "radDaYes"
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
	| 2  | No    |
	| 3  | Yes   |
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
	And the page contains the text "FOR WEB SERVICES E-VERIFY EMPLOYER AGENTS"
	And I switch back to the body of the page

Scenario: 09-Memorandum of Understanding (MOU)
	Given the page title is "E-Verify – Employer Registration – Memorandum of Understanding"
	When I click on the radio button using element id "ucRegistrationTerms_radAccept"
	And I click on the submit button labeled "Next"
	Then the page title is "E-Verify – Employer Registration – MOU Signatory"

Scenario: 10-MOU Signatory
	Given the page is loaded
	When I set the text box using element id "ucMouPoc_ltLastName_TextBox" with the value "AgentWebServiceOnly-LN-one"
	And I set the text box using element id "ucMouPoc_ltFirstName_TextBox" with the value "AgentWebServiceOnly-FN-one"
	And I set the text box using element id "ucMouPoc_scPhone_PhoneAreaCode" with the value "301"
	And I set the text box using element id "ucMouPoc_scPhone_PhonePrefixCode" with the value "123"
	And I set the text box using element id "ucMouPoc_scPhone_PhoneSuffixCode" with the value "4567"
	And I set the text box using element id "ucMouPoc_ltEmail_TextBox" with the value "automation.bdd@gmail.com"
	And I set the text box using element id "ucMouPoc_ltEmail2_TextBox" with the value "automation.bdd@gmail.com"
	And I select the drop down text "No" using element id "ucMouPoc_optAccess"
	And I click on the submit button labeled "Next"
	Then the page title is "E-Verify – Employer Registration – Company Information"

Scenario: 11-Company Information
	Given the page is loaded
	When I set the text box using element id "ucCompanyInfo_txtEmpName_TextBox" with the value "Variq Web Service Agent"
	And I set the text box using element id "ucCompanyInfo_txtAddress1_TextBox" with the value "123 Automation Drive"
	And I set the text box using element id "ucCompanyInfo_txtCity_TextBox" with the value "Rockville"
	And I select the drop down text "MARYLAND" using element id "ucCompanyInfo_vssState_SelectorDrop"
	And I set the text box using element id "ucCompanyInfo_ltzZipCode_TextBox" with the value "20852"
	And I select the drop down text "MONTGOMERY" using element id "ucCompanyInfo_vscCounty_SelectorDrop"
	And I set the text box using element id "ucCompanyInfo_ltnEmployerId_TextBox" with the value "123456789"
	And I select the drop down text "100 to 499" using element id "ucCompanyInfo_vscNbrEmps_SelectorDrop"
	And I click on the submit button labeled "Next"
	Then the page title is "E-Verify – Employer Registration – NAICS Code"

Scenario: 12 - NAICS Code for new Web Service Agent
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

Scenario: 15-Add a Web Service Agent Program Administrator
	Given the page is loaded
	When I set the text box using element id "ucRegContacts_rptContacts__ctl0_ltLastName_TextBox" with the value "AO-Web Services User-LN-One"
	And I set the text box using element id "ucRegContacts_rptContacts__ctl0_ltFirstName_TextBox" with the value "AO-Web Services User-FN-One"
	And I set the text box using element id "ucRegContacts_rptContacts__ctl0_scPhone_PhoneAreaCode" with the value "777"
	And I set the text box using element id "ucRegContacts_rptContacts__ctl0_scPhone_PhonePrefixCode" with the value "888"
	And I set the text box using element id "ucRegContacts_rptContacts__ctl0_scPhone_PhoneSuffixCode" with the value "9999"
	And I set the text box using element id "ucRegContacts_rptContacts__ctl0_ltEmail_TextBox" with the value "testuser@test.com"
	And I set the text box using element id "ucRegContacts_rptContacts__ctl0_ltEmail2_TextBox" with the value "testuser@test.com"
	And I click on the submit button labeled "Next"
	Then the page title is "E-Verify – Employer Registration – Registration Review"

Scenario Outline: 16-Registration Review-Verify Registration Details
	Given the page is loaded
	Then the page contains the text <TextOnPage> from the following table

	Examples: 
	| TextOnPage                                      |
	| Variq Web Service Agent                         |
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
	| testuser@test.com                               |

Scenario: 17-Complete Enrollment to Register Web Service Agent
	Given the page title is "E-Verify – Employer Registration – Registration Review"
	When I set the checkbox with element id "ucSummary_chkAgree" to "true"
	And I click on the submit button labeled "Register Employer"
	Then the page title is "E-Verify – Employer Registration – You're Finished"
	And I close the current page

Scenario: 18-Navigate to Agent Registration page
	Given I navigate to the url for "registration" titled "E-Verify – Employer Registration – Start Page"
	When I set the checkbox with element id "cb_Iagree" to "true"
	And I click on the submit button labeled "Continue"
	Then the page title is "E-Verify – Employer Registration – Checklist"

Scenario: 19-Employer Registration - Checklist
	Given the page is loaded
	Given the page title is "E-Verify – Employer Registration – Checklist"
	When I click on the submit button labeled "Begin E-Verify Enrollment"
	Then the page title is "E-Verify – Employer Registration – Start Here"

Scenario: 20-Employer Access-N Agent-Y Corporate-N Web Services-Y
	Given the page title is "E-Verify – Employer Registration – Start Here"
	When I click on the radio button using element id "radBpNo"
	And I click on the radio button using element id "radDaYes"
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
	| 2  | No    |
	| 3  | Yes   |
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
	And the page contains the text "FOR WEB SERVICES E-VERIFY EMPLOYER AGENTS"
	And I switch back to the body of the page

Scenario: 26-Memorandum of Understanding (MOU)
	Given the page title is "E-Verify – Employer Registration – Memorandum of Understanding"
	When I click on the radio button using element id "ucRegistrationTerms_radAccept"
	And I click on the submit button labeled "Next"
	Then the page title is "E-Verify – Employer Registration – MOU Signatory"

Scenario: 27-MOU Signatory
	Given the page is loaded
	When I set the text box using element id "ucMouPoc_ltLastName_TextBox" with the value "AgentWebServiceOnly-LN-one"
	And I set the text box using element id "ucMouPoc_ltFirstName_TextBox" with the value "AgentWebServiceOnly-FN-one"
	And I set the text box using element id "ucMouPoc_scPhone_PhoneAreaCode" with the value "301"
	And I set the text box using element id "ucMouPoc_scPhone_PhonePrefixCode" with the value "123"
	And I set the text box using element id "ucMouPoc_scPhone_PhoneSuffixCode" with the value "4567"
	And I set the text box using element id "ucMouPoc_ltEmail_TextBox" with the value "automation.bdd@gmail.com"
	And I set the text box using element id "ucMouPoc_ltEmail2_TextBox" with the value "automation.bdd@gmail.com"
	And I select the drop down text "No" using element id "ucMouPoc_optAccess"
	And I click on the submit button labeled "Next"
	Then the page title is "E-Verify – Employer Registration – Company Information"

Scenario: 28-Company Information
	Given the page is loaded
	When I set the text box using element id "ucCompanyInfo_txtEmpName_TextBox" with the value "Variq Web Service Agent"
	And I set the text box using element id "ucCompanyInfo_txtAddress1_TextBox" with the value "123 Automation Drive"
	And I set the text box using element id "ucCompanyInfo_txtCity_TextBox" with the value "Rockville"
	And I select the drop down text "MARYLAND" using element id "ucCompanyInfo_vssState_SelectorDrop"
	And I set the text box using element id "ucCompanyInfo_ltzZipCode_TextBox" with the value "20852"
	And I select the drop down text "MONTGOMERY" using element id "ucCompanyInfo_vscCounty_SelectorDrop"
	And I set the text box using element id "ucCompanyInfo_ltnEmployerId_TextBox" with the value "123456789"
	And I select the drop down text "100 to 499" using element id "ucCompanyInfo_vscNbrEmps_SelectorDrop"
	And I click on the submit button labeled "Next"
	Then the page title is "E-Verify – Employer Registration – NAICS Code"

Scenario: 29 - NAICS Code for new Web Service Agent
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

Scenario: 32-Add a Web Service Agent Program Administrator
	Given the page is loaded
	When I set the text box using element id "ucRegContacts_rptContacts__ctl0_ltLastName_TextBox" with the value "AO-Web Services User-LN-One"
	And I set the text box using element id "ucRegContacts_rptContacts__ctl0_ltFirstName_TextBox" with the value "AO-Web Services User-FN-One"
	And I set the text box using element id "ucRegContacts_rptContacts__ctl0_scPhone_PhoneAreaCode" with the value "777"
	And I set the text box using element id "ucRegContacts_rptContacts__ctl0_scPhone_PhonePrefixCode" with the value "888"
	And I set the text box using element id "ucRegContacts_rptContacts__ctl0_scPhone_PhoneSuffixCode" with the value "9999"
	And I set the text box using element id "ucRegContacts_rptContacts__ctl0_ltEmail_TextBox" with the value "testuser@test.com"
	And I set the text box using element id "ucRegContacts_rptContacts__ctl0_ltEmail2_TextBox" with the value "testuser@test.com"
	And I click on the submit button labeled "Next"
	Then the page title is "E-Verify – Employer Registration – Registration Review"

Scenario Outline: 33-Registration Review-Verify Registration Details
	Given the page is loaded
	Then the page contains the text <TextOnPage> from the following table

	Examples: 
	| TextOnPage                                      |
	| Variq Web Service Agent                         |
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
	| testuser@test.com                               |

Scenario: 34-Complete Enrollment to Register Web Service Agent
	Given the page title is "E-Verify – Employer Registration – Registration Review"
	When I set the checkbox with element id "ucSummary_chkAgree" to "true"
	And I click on the submit button labeled "Register Employer"
	Then the page title is "E-Verify – Employer Registration – You're Finished"
	And I close the current page

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
	And I set the text box using element id "txtEmployer_TextBox" with the value "Variq Web Service Agent"
	And I click on the submit button labeled "Display Company Summary List"
	Then the page title is "Company Summary List"

Scenario: 37-Navigate to company details
	Given the page is loaded
	When I access the table using tag "table" attribute type "class" attribute value "ControlText"
	And I save the table row number containing the data "PENDING" in column number "11" into the variable "tableRowNumber"
	And I click on the button labeled "Edit" in the table row number saved in the variable "tableRowNumber"
	Then the page title is "Company Details"

Scenario Outline: 38-Validate Access Method - Web DABP / WS-EMP
	Given the page is loaded
	Then the page contains the text <Access> from the following table

	Examples: 
	| Access  |
	| WEB-DABP|
	| WS-EMP  |

Scenario: 39-Validate and Match Company
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
	
Scenario: 40-Set MOU Signed Date 
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
	
Scenario: 41-Save Active User ID and Edit User
	Given the page title is "Company Details"
	When I click on the button labeled "View / Edit" in row number "10"
	And the page title is "Employer User Summary"
	And I access the table using element id "dgCpsUsers"
	And I save the data from table row number "3" column number "2" into the variable "userid1" 
	And I click on table row number "3" in column number "2"
	Then the page title is "User Details - View / Modify User Information"
			
Scenario: 42-Set Tutorial Complete/Temp Password for Program Admin  
	Given the page is loaded
	When I set the checkbox with element id "ucCpsUserModEmployer_chkTutorialComplete" to "true"
	And I set the text box using element id "ucCpsUserModEmployer_ltbNewPwd_TextBox" with the value "Welcome1!"
	And I set the text box using element id "ucCpsUserModEmployer_ltbConfPwd_TextBox" with the value "Welcome1!"
	And I click on the submit button labeled "Submit User Modifications"
	Then the page title is "User Confirmation"

Scenario: 43-Signout from Web-HQ
	Given the page is loaded
	When I click on the button using element id "ucVisNav_hlExit"
	Then the page title is "Login"
	And I close the current page
	
Scenario: 44-Logon to eVerify for creating new clients
	Given I navigate to the url for "everify" titled "E-Verify: Login"
	When I click on the submit button containing the text "I agree"
	And I set the text box using element id "MainContentPlaceHolder_UserIdTextBox_TextBox" with the value stored in the variable "userid1"
	And I set the text box using element id "MainContentPlaceHolder_PasswordTextBox_TextBox" with the value "Welcome1!"
	And I click on the submit button labeled "Log In"
	Then the page title is "E-Verify: Change Password"

Scenario: 45-Submit New Password and Security Questions
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

Scenario: 46-Verify User Profile and logon to eVerify
	Given the page is loaded
	Then the text box using element id "MainContentPlaceHolder_ucEvProfileInfoUpdate_ptbPhoneNumber_PhoneAreaCode" contains the value "777"
	Then the text box using element id "MainContentPlaceHolder_ucEvProfileInfoUpdate_ptbPhoneNumber_PhonePrefixCode" contains the value "888"
	Then the text box using element id "MainContentPlaceHolder_ucEvProfileInfoUpdate_ptbPhoneNumber_PhoneSuffixCode" contains the value "9999"
	Then the text box using element id "MainContentPlaceHolder_ucEvProfileInfoUpdate_lteUserEmail_TextBox" contains the value "testuser@test.com"
	When I click on the submit button labeled "Submit User Profile Changes"
	Then the page title is "E-Verify: Home Page"

Scenario: 47-Navigate to Clients > Add New Client
	Given the page is loaded
	When I click on the link using element id "anch_7"
	And I click on the link containing the text "Add New Client"
	Then the page title is "E-Verify: Client Wizard - Organization Designation"

Scenario: 48-Organization Designation
	Given the page title is "E-Verify: Client Wizard - Organization Designation"
	When I select the drop down text "Federal Government" using element id "MainContentPlaceHolder_ClientCategory1_ddlCategory"
	And I click on the submit button labeled "Next"
	Then the page title is "E-Verify: Client Wizard - Company Information"

Scenario: 49-Input Client Information
	Given the page is loaded
	When I set the text box using element id "MainContentPlaceHolder_CompanyInformation1_txtEmpName_TextBox" with the value "VariQ Web Service Agent - Client"
	And I set the text box using element id "MainContentPlaceHolder_CompanyInformation1_txtAddress1_TextBox" with the value "123 Test Dr"
	And I set the text box using element id "MainContentPlaceHolder_CompanyInformation1_txtCity_TextBox" with the value "Rockville"
	And I select the drop down text "MARYLAND" using element id "MainContentPlaceHolder_CompanyInformation1_ddlState"
	And I set the text box using element id "MainContentPlaceHolder_CompanyInformation1_ltzZipCode_TextBox" with the value "00000"
	And I select the drop down text "MONTGOMERY" using element id "MainContentPlaceHolder_CompanyInformation1_ddlCounty"
	And I set the text box using element id "MainContentPlaceHolder_CompanyInformation1_ltnEmployerId_TextBox" with the value "123456789"
	And I select the drop down text "2,500 to 4,999" using element id "MainContentPlaceHolder_CompanyInformation1_ddlTotalEmployeeRange"
	And I click on the submit button labeled "Next"
	Then the page title is "E-Verify: Client Wizard - Enter NAICS Code"
	
Scenario: 50-NAIC Code for New Client
	Given the page is loaded
	When I set the text box using element id "MainContentPlaceHolder_Naics_ltNaicsCode_TextBox" with the value "721"
	And I click on the submit button labeled "Accept NAICS Code"
	Then the page title is "E-Verify: Client Wizard - How Many Hiring Sites?"

Scenario: 51-Hiring Sites
	Given the page is loaded
	When I click on the submit button labeled "Single Site Verification"
	Then the page title is "E-Verify: Client Wizard - Enter Program Administrator"

Scenario: 52-Enter POC Details
	Given the page is loaded
	When I set the text box using element id "MainContentPlaceHolder_ucContacts_ltaLastName_TextBox" with the value "Web Service Client-LN"
	And I set the text box using element id "MainContentPlaceHolder_ucContacts_ltaFirstName_TextBox" with the value "Web Service Client-FN"
	And I set the text box using element id "MainContentPlaceHolder_ucContacts_ptbPhoneNumber_PhoneAreaCode" with the value "301"
	And I set the text box using element id "MainContentPlaceHolder_ucContacts_ptbPhoneNumber_PhonePrefixCode" with the value "888"
	And I set the text box using element id "MainContentPlaceHolder_ucContacts_ptbPhoneNumber_PhoneSuffixCode" with the value "9999"
	And I set the text box using element id "MainContentPlaceHolder_ucContacts_lteEmailAddress_TextBox" with the value "clientemail@variq.com"
	And I click on the submit button labeled "Next"
	Then the page title is "E-Verify: Client Wizard - Points of Contact Summary List"

Scenario: 53-POC Summary
	Given the page is loaded
	When I access the table using element id "MainContentPlaceHolder_ucContacts_ContactsGrid"
	Then table row number "3" column number "1" contains the value "Web Service Client-LN"
	And table row number "3" column number "2" contains the value "Web Service Client-FN"
	And table row number "3" column number "4" contains the value "(301) 888 - 9999"
	And table row number "3" column number "6" contains the value "clientemail@variq.com"
	
Scenario: 54-Navigate to Company Information
	Given the page title is "E-Verify: Client Wizard - Points of Contact Summary List"
	When I click on the submit button labeled "Next"
	Then the page title is "E-Verify: Client Wizard - Company Information"
	
Scenario Outline: 55-Verify Company Information
	Given the page is loaded
	Then the page contains the text <TextOnPage> from the following table

	Examples: 
	| TextOnPage                       |
	| VariQ Web Service Agent - Client |
	| 123 Test Dr                      |
	| Rockville                        |
	| MD                               |
	| 00000                            |
	| MONTGOMERY                       |
	| 123456789                        |
	| 2,500 to 4,999                   |
	| Federal Government               |
	| 721 - ACCOMMODATION (721)        |

Scenario: 56-Register Client
	Given the page title is "E-Verify: Client Wizard - Company Information"
	When I click on the submit button labeled "Register Client"
	Then the page title is "E-Verify: Client Wizard - Thank you for registering for E-Verify"

Scenario: 57-Navigate to Newly Registered Client
	Given the page is loaded
	When I click on the link using element id "anch_7"
	And I click on the link containing the text "View Existing Clients"
	And I click on the submit button labeled "Search"
	Then the page title is "E-Verify: Search Results"
	
Scenario Outline: 58-Verify newly created Client
	Given the page is loaded
	When I access the table using element id "MainContentPlaceHolder_ClientCompanyGrid"
	Then table row number <Table Row Number> contains the values <Data> from the following table
	
	Examples: 
	| Table Row Number | Data                             |
	| 3                | VariQ Web Service Agent - Client |
	| 3                | 123 Test Dr                      |
	| 3                | Rockville                        |
	| 3                | MD                               |
	| 3                | PENDING                          |

Scenario: 59-Logon to WebHQ and search for company - client
	Given I navigate to the url for "webhq" titled "Login"
	When I set the checkbox with element id "cb_Iagree" to "true"
	And I click on the button using element id "btnContinue1"
	And I set the text box using element id "txtUserID" with the value for "webhq-username"
	And I set the text box using element id "txtUserPassword" with the value for "webhq-password"
	And I click on the submit button labeled "Login"
	Then the page title is "Web-HQ: Home"
	And I click on the link containing the text "Maintain Company"
	And the page title is "Company Search"
	And I set the text box using element id "txtEmployer_TextBox" with the value "VariQ Web Service Agent - Client"
	And I click on the submit button labeled "Display Company Summary List"
	Then the page title is "Company Summary List"

Scenario: 60-Set Mou date for new client
	Given the page is loaded
	When I access the table using tag "table" attribute type "class" attribute value "ControlText"
	And I save the table row number containing the data "PENDING" in column number "11" into the variable "tableRowNumber"
	And I click on the button labeled "Edit" in the table row number saved in the variable "tableRowNumber"
	And the page title is "Client Company"
	And I access table number "5" using tag "table" attribute type "id" attribute value "tblAddress"
	And I click on the button labeled "View / Edit" in row number "2"
	And I set the text box using element id "ucCompanyAccess_cdtMOUDate_dateTextBox" with the value "01/01/2016"
	And I click on the submit button labeled "Submit Information"
	Then table row number "2" column number "3" contains the value "01/01/2016"

Scenario: 61-Finally logon to eVerify and validate new client activation
	Given I navigate to the url for "everify" titled "E-Verify: Login"
	When I click on the submit button containing the text "I agree"
	And I set the text box using element id "MainContentPlaceHolder_UserIdTextBox_TextBox" with the value stored in the variable "userid1"
	And I set the text box using element id "MainContentPlaceHolder_PasswordTextBox_TextBox" with the value "Autotest123!"
	And I click on the submit button labeled "Log In"
	And I click on the link using element id "anch_7"
	And I click on the link containing the text "View Existing Clients"
	And I click on the submit button labeled "Search"
	And I access the table using element id "MainContentPlaceHolder_ClientCompanyGrid"
	Then table row number "3" column number "2" contains the value "VariQ Web Service Agent - Client"
	And table row number "3" column number "6" contains the value "ACTIVE"
	And the page title is "E-Verify: Search Results"

Scenario: 62 - Logout of E-Verify
	Given the page is loaded
	When I click on the button using element id "anch_32"
	Then I close the current page
