Feature: Agent New Client Enrollment
1. Enroll an Agent and verify enrollment
2. Use WebHQ to edit and validate company, set MOU activation date and activate Users
3. Use eVerify to create new clients and verify PENDING status
4. Go back to WebHQ, set MOU date to activate new cliet
5. Go back to eVerify, search for new client and verify status is ACTIVE

Scenario: 01-Navigate to Agent Registration page
	Given I navigate to the url for "registration" titled "E-Verify – Employer Registration – Start Page"
	When I set the checkbox with element id "cb_Iagree" to "true"
	And I click on the submit button labeled "Continue"
	Then the page title is "E-Verify – Employer Registration – Checklist"

Scenario: 02-Employer Registration - Checklist
	Given the page is loaded
	When I click on the submit button labeled "Begin E-Verify Enrollment"
	Then the page title is "E-Verify – Employer Registration – Start Here"

Scenario: 03-Employer Access-N Agent-Y Corporate/Web Services-N
	Given the page is loaded
	When I click on the radio button using element id "radBpNo"
	And I click on the radio button using element id "radDaYes"
	And I click on the radio button using element id "radCorpNo"
	And I click on the radio button using element id "radWsNo"
	And I click on the submit button labeled "Next"
	Then the page title is "E-Verify - Employer Registration - Let’s Review"

Scenario: 04-Registration Review Page Verification
	Given the page is loaded
	When I access the table using tag "div" attribute type "class" attribute value "box"
	Then table row number "2" column number "3" contains the value "No"
	And table row number "3" column number "3" contains the value "Yes"
	And table row number "4" column number "3" contains the value "No"
	And table row number "5" column number "3" contains the value "No"

Scenario: 05-Registration Review Page
	Given the page is loaded
	When I click on the submit button labeled "Next"
	Then the page title is "E-Verify - Employer Registration - Organization Designation"

Scenario: 06-Organization Designation
	Given the page is loaded
	When I select the drop down text "Federal Government" using element id "ucCategory_vscCategory_SelectorDrop"
	And I click on the submit button labeled "Next"
	Then the page title is "E-Verify – Employer Registration – Memorandum of Understanding"

Scenario: 07-Switch to iFrame to verify data
	Given the page is loaded
	When I switch to iframe using element id "ucRegistrationTerms_frmMou"
	Then the page contains the text "MEMORANDUM OF UNDERSTANDING"
	And the page contains the text "FOR E-VERIFY EMPLOYER AGENTS"
	And I switch back to the body of the page

Scenario: 08-Memorandum of Understanding (MOU)
	Given the page is loaded
	When I click on the radio button using element id "ucRegistrationTerms_radAccept"
	And I click on the submit button labeled "Next"
	Then the page title is "E-Verify – Employer Registration – MOU Signatory"

Scenario: 09-MOU Signatory
	Given the page is loaded
	When I set the text box using element id "ucMouPoc_ltLastName_TextBox" with the value "AgentOnly-LN"
	And I set the text box using element id "ucMouPoc_ltFirstName_TextBox" with the value "AgentOnly-FN"
	And I set the text box using element id "ucMouPoc_scPhone_PhoneAreaCode" with the value "301"
	And I set the text box using element id "ucMouPoc_scPhone_PhonePrefixCode" with the value "123"
	And I set the text box using element id "ucMouPoc_scPhone_PhoneSuffixCode" with the value "4567"
	And I set the text box using element id "ucMouPoc_ltEmail_TextBox" with the value "automation.bdd@gmail.com"
	And I set the text box using element id "ucMouPoc_ltEmail2_TextBox" with the value "automation.bdd@gmail.com"
	And I select the drop down text "Yes" using element id "ucMouPoc_optAccess"
	And I click on the submit button labeled "Next"
	Then the page title is "E-Verify – Employer Registration – Company Information"

Scenario: 10-Company Information
	Given the page is loaded
	When I set the text box using element id "ucCompanyInfo_txtEmpName_TextBox" with the value "New VariQ Agent"
	And I set the text box using element id "ucCompanyInfo_txtAddress1_TextBox" with the value "123 Automation Drive"
	And I set the text box using element id "ucCompanyInfo_txtCity_TextBox" with the value "Rockville"
	And I select the drop down text "MARYLAND" using element id "ucCompanyInfo_vssState_SelectorDrop"
	And I set the text box using element id "ucCompanyInfo_ltzZipCode_TextBox" with the value "20852"
	And I select the drop down text "MONTGOMERY" using element id "ucCompanyInfo_vscCounty_SelectorDrop"
	And I set the text box using element id "ucCompanyInfo_ltnEmployerId_TextBox" with the value "123456789"
	And I select the drop down text "100 to 499" using element id "ucCompanyInfo_vscNbrEmps_SelectorDrop"
	And I click on the submit button labeled "Next"
	Then the page title is "E-Verify – Employer Registration – NAICS Code"

Scenario: 11-Generate NAIC Code
	Given the page is loaded
	When I click on the submit button labeled "Generate NAICS Code"
	And I select the drop down text "FINANCE AND INSURANCE (52)" using element id "ucNaics_scNAICSector_SelectorDrop"
	And I click on the submit button labeled "Continue NAICS Code"
	Then the page title is "E-Verify – Employer Registration – NAICS Code Subsector"
	And the page contains the text "FINANCE AND INSURANCE (52)"

Scenario: 12-NAICS Code - Subsector
	Given the page is loaded
	When I select the drop down text "MONETARY AUTHORITIES - CENTRAL BANK (521)" using element id "ucNaics_scSubsector_SelectorDrop"
	And I click on the submit button labeled "Accept NAICS Code and Continue"
	Then the page title is "E-Verify – Employer Registration – Hiring Sites"

Scenario: 13-Hiring Sites Verification
	Given the page is loaded
	Then the selected drop down text using element id "ucSites_rptHiringSites__ctl1_lstStates" is "MARYLAND"
	And the text box using tag "input" attribute type "value" contains the value "1"

Scenario: 14-Navigate to Program Admistrators
	Given the page is loaded
	When I click on the submit button labeled "Next"
	Then the page title is "E-Verify – Employer Registration – Program Administrators"

Scenario: 15-Add a Second User
	Given the page is loaded
	When I set the text box using element id "ucRegContacts_rptContacts__ctl0_ltLastName_TextBox" with the value "AO-Second User-LN"
	And I set the text box using element id "ucRegContacts_rptContacts__ctl0_ltFirstName_TextBox" with the value "AO-Second User-FN"
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
	| New VariQ Agent                                 |
	| 123 Automation Drive                            |
	| Rockville                                       |
	| MD                                              |
	| 20852                                           |
	| MONTGOMERY                                      |
	| 123456789                                       |
	| 100 to 499                                      |
	| Federal Government                              |
	| 521 - MONETARY AUTHORITIES - CENTRAL BANK (521) |
	| MARYLAND                                        |
	| AO-Second User-LN                               |
	| AO-Second User-FN                               |
	| (777) 888 - 9999                                |
	| automation.bdd@gmail.com                        |

Scenario: 17-Complete Enrollment to Register Agent
	Given the page is loaded
	When I set the checkbox with element id "ucSummary_chkAgree" to "true"
	And I click on the submit button labeled "Register Employer"
	Then the page title is "E-Verify – Employer Registration – You're Finished"
	And I close the current page

Scenario: 18-Logon to WebHQ
	Given I navigate to the url for "webhq" titled "Login"
	When I set the checkbox with element id "cb_Iagree" to "true"
	And I click on the button using element id "btnContinue1"
	And I set the text box using element id "txtUserID" with the value for "webhq-username"
	And I set the text box using element id "txtUserPassword" with the value for "webhq-password"
	And I click on the submit button labeled "Login"
	Then the page title is "Web-HQ: Home"

Scenario: 19-Search Company
	Given the page is loaded
	When I click on the link containing the text "Maintain Company"
	And the page title is "Company Search"
	And I set the text box using element id "txtEmployer_TextBox" with the value "New VariQ Agent"
	And I click on the submit button labeled "Display Company Summary List"
	Then the page title is "Company Summary List"

Scenario: 20-Navigate to company details
	Given the page is loaded
	When I access the table using tag "table" attribute type "class" attribute value "ControlText"
	#And I skip scenario if table does not contain the data "PENDING"
	And I save the table row number containing the data "PENDING" in column number "11" into the variable "tableRowNumber"
	And I click on the button labeled "Edit" in the table row number saved in the variable "tableRowNumber"
	Then the page title is "Company Details"

Scenario: 21-Validate and Match Company
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

Scenario: 22-Set MOU Signed Date to Activate Users
	Given the page is loaded
	When I click on the submit button labeled "Return to Maintain Company"
	And the page title is "Company Details"
	And I access table number "6" using tag "table" attribute type "id" attribute value "structure"
	#And I access table number "5" using tag "table" attribute type "id" attribute value "tblAddress"
	And I click on the button labeled "View / Edit" in row number "2"
	And the page title is "Company Details"
	And I set the text box using element id "ucCompanyAccess_cdtMOUDate_dateTextBox" with the value "01/01/2016"
	And I click on the submit button labeled "Submit Information"
	And I access table number "4" using tag "table" attribute type "id" attribute value "tblAddress"
	Then table row number "10" column number "2" contains the value "Total Active Users:"
	And table row number "10" column number "3" contains the value "2"

Scenario: 23-Save Active User ID and Edit User
	Given the page is loaded
	When I click on the button labeled "View / Edit" in row number "10"
	# (or) When I click on the button using element id "ucSummary_btnUser"
	And the page title is "Employer User Summary"
	And I access the table using element id "dgCpsUsers"
	And I save the data from table row number "3" column number "2" into the variable "userid" 
	And I click on table row number "3" in column number "2"
	#Then the page title is "WEB-HQ - User Administration"
	Then the page title is "User Details - View / Modify User Information"

Scenario: 24-Set Tutorial Complete and Set Temp Password
	Given the page is loaded
	When I set the checkbox with element id "ucCpsUserModEmployer_chkTutorialComplete" to "true"
	And I set the text box using element id "ucCpsUserModEmployer_ltbNewPwd_TextBox" with the value "Welcome1!"
	And I set the text box using element id "ucCpsUserModEmployer_ltbConfPwd_TextBox" with the value "Welcome1!"
	And I click on the submit button labeled "Submit User Modifications"
	Then the page title is "User Confirmation"
	
Scenario: 25-Logon to eVerify for creating new clients
	Given I navigate to the url for "everify" titled "E-Verify: Login"
	When I click on the submit button containing the text "I agree"
	And I set the text box using element id "MainContentPlaceHolder_UserIdTextBox_TextBox" with the value stored in the variable "userid"
	And I set the text box using element id "MainContentPlaceHolder_PasswordTextBox_TextBox" with the value "Welcome1!"
	And I click on the submit button labeled "Log In"
	Then the page title is "E-Verify: Change Password"

Scenario: 26-Submit New Password and Security Questions
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

Scenario: 27-Verify User Profile and logon to eVerify
	Given the page is loaded
	Then the text box using element id "MainContentPlaceHolder_ucEvProfileInfoUpdate_ptbPhoneNumber_PhoneAreaCode" contains the value "301"
	Then the text box using element id "MainContentPlaceHolder_ucEvProfileInfoUpdate_ptbPhoneNumber_PhonePrefixCode" contains the value "123"
	Then the text box using element id "MainContentPlaceHolder_ucEvProfileInfoUpdate_ptbPhoneNumber_PhoneSuffixCode" contains the value "4567"
	Then the text box using element id "MainContentPlaceHolder_ucEvProfileInfoUpdate_lteUserEmail_TextBox" contains the value "automation.bdd@gmail.com"
	When I click on the submit button labeled "Submit User Profile Changes"
	Then the page title is "E-Verify: Home Page"
	
Scenario: 28-Navigate to Clients > Add New Client
	Given the page is loaded
	When I click on the link using element id "anch_7"
	And I click on the link using element id "anch_8"
	Then the page title is "E-Verify: Client Wizard - Organization Designation"

Scenario: 29-Organization Designation
	Given the page is loaded
	When I select the drop down text "Federal Government" using element id "MainContentPlaceHolder_ClientCategory1_ddlCategory"
	And I click on the submit button labeled "Next"
	Then the page title is "E-Verify: Client Wizard - Company Information"

Scenario: 30-Input Client Information
	Given the page is loaded
	When I set the text box using element id "MainContentPlaceHolder_CompanyInformation1_txtEmpName_TextBox" with the value "New VariQ Client"
	And I set the text box using element id "MainContentPlaceHolder_CompanyInformation1_txtAddress1_TextBox" with the value "123 Test Dr"
	And I set the text box using element id "MainContentPlaceHolder_CompanyInformation1_txtCity_TextBox" with the value "Rockville"
	And I select the drop down text "MARYLAND" using element id "MainContentPlaceHolder_CompanyInformation1_ddlState"
	And I set the text box using element id "MainContentPlaceHolder_CompanyInformation1_ltzZipCode_TextBox" with the value "00000"
	And I select the drop down text "MONTGOMERY" using element id "MainContentPlaceHolder_CompanyInformation1_ddlCounty"
	And I set the text box using element id "MainContentPlaceHolder_CompanyInformation1_ltnEmployerId_TextBox" with the value "123456789"
	And I select the drop down text "2,500 to 4,999" using element id "MainContentPlaceHolder_CompanyInformation1_ddlTotalEmployeeRange"
	And I click on the submit button labeled "Next"
	Then the page title is "E-Verify: Client Wizard - Enter NAICS Code"

Scenario: 31-NAIC Code for New Client
	Given the page is loaded
	When I set the text box using element id "MainContentPlaceHolder_Naics_ltNaicsCode_TextBox" with the value "721"
	And I click on the submit button labeled "Accept NAICS Code"
	Then the page title is "E-Verify: Client Wizard - How Many Hiring Sites?"

Scenario: 32-Hiring Sites
	Given the page is loaded
	When I click on the submit button labeled "Single Site Verification"
	Then the page title is "E-Verify: Client Wizard - Enter Program Administrator"

Scenario: 33-Enter Program Administrator information
	Given the page is loaded
	When I set the text box using element id "MainContentPlaceHolder_ucContacts_ltaLastName_TextBox" with the value "RWD Client-LN"
	And I set the text box using element id "MainContentPlaceHolder_ucContacts_ltaFirstName_TextBox" with the value "RWD Client-FN"
	And I set the text box using element id "MainContentPlaceHolder_ucContacts_ptbPhoneNumber_PhoneAreaCode" with the value "301"
	And I set the text box using element id "MainContentPlaceHolder_ucContacts_ptbPhoneNumber_PhonePrefixCode" with the value "888"
	And I set the text box using element id "MainContentPlaceHolder_ucContacts_ptbPhoneNumber_PhoneSuffixCode" with the value "9999"
	And I set the text box using element id "MainContentPlaceHolder_ucContacts_lteEmailAddress_TextBox" with the value "clientemail@variq.com"
	And I click on the submit button labeled "Next"
	Then the page title is "E-Verify: Client Wizard - Points of Contact Summary List"

Scenario: 34-POC Summary
	Given the page is loaded
	When I access the table using element id "MainContentPlaceHolder_ucContacts_ContactsGrid"
	Then table row number "3" column number "1" contains the value "RWD Client-LN"
	And table row number "3" column number "2" contains the value "RWD Client-FN"
	And table row number "3" column number "4" contains the value "(301) 888 - 9999"
	And table row number "3" column number "6" contains the value "clientemail@variq.com"
	
Scenario: 35-Navigate to Company Information
	Given the page is loaded
	When I click on the submit button labeled "Next"
	Then the page title is "E-Verify: Client Wizard - Company Information"

Scenario Outline: 36-Verify Company Information
	Given the page is loaded
	Then the page contains the text <TextOnPage> from the following table

	Examples: 
	| TextOnPage                |
	| New VariQ Client          |
	| 123 Test Dr               |
	| Rockville                 |
	| MD                        |
	| 00000                     |
	| MONTGOMERY                |
	| 123456789                 |
	| 2,500 to 4,999            |
	| Federal Government        |
	| 721 - ACCOMMODATION (721) |

Scenario: 37-Register Client
	Given the page is loaded
	When I click on the submit button labeled "Register Client"
	Then the page title is "E-Verify: Client Wizard - Thank you for registering for E-Verify"

Scenario: 38: Navigate to Newly Registered Client
	Given the page is loaded
	When I click on the link using element id "anch_7"
	And I click on the link using element id "anch_9"
	And I click on the submit button labeled "Search"
	Then the page title is "E-Verify: Search Results"
	
Scenario Outline: 39: Verify newly created RWD Client
	Given the page is loaded
	When I access the table using element id "MainContentPlaceHolder_ClientCompanyGrid"
	Then table row number <Table Row Number> contains the values <Data> from the following table
	
	Examples: 
	| Table Row Number | Data             |
	| 3                | New VariQ Client |
	| 3                | 123 Test Dr      |
	| 3                | Rockville        |
	| 3                | MD               |
	| 3                | PENDING          |

Scenario: 40-Logon to WebHQ and search for new client
	Given I navigate to the url for "webhq" titled "Login"
	When I set the checkbox with element id "cb_Iagree" to "true"
	And I click on the button using element id "btnContinue1"
	And I set the text box using element id "txtUserID" with the value for "webhq-username"
	And I set the text box using element id "txtUserPassword" with the value for "webhq-password"
	And I click on the submit button labeled "Login"
	And the page title is "Web-HQ: Home"
	And I click on the link containing the text "Maintain Company"
	And the page title is "Company Search"
	And I set the text box using element id "txtEmployer_TextBox" with the value "New VariQ Client"
	And I click on the submit button labeled "Display Company Summary List"
	Then the page title is "Company Summary List"

Scenario: 41-Set Mou date for new client
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

Scenario: 42-Finally logon to eVerify and validate new client activation
	Given I navigate to the url for "everify" titled "E-Verify: Login"
	When I click on the submit button containing the text "I agree"
	And I set the text box using element id "MainContentPlaceHolder_UserIdTextBox_TextBox" with the value stored in the variable "userid"
	And I set the text box using element id "MainContentPlaceHolder_PasswordTextBox_TextBox" with the value "Autotest123!"
	And I click on the submit button labeled "Log In"
	And I click on the link using element id "anch_7"
	And I click on the link using element id "anch_9"
	And I click on the submit button labeled "Search"
	And I access the table using element id "MainContentPlaceHolder_ClientCompanyGrid"
	Then table row number "3" column number "6" contains the value "ACTIVE"
	And I close the current page
	
	@ignore
Scenario: 50-Set Mou Date-Upload Mou Doc-Activate Client
	Given the page title is "E-Verify: Search Results"
	When I click on the submit button labeled "Edit"
	And the page title is "E-Verify: Client Wizard - Company Information"
	And I click on the submit button labeled "Upload Signature Page"
	And the page title is "E-Verify: Client Wizard - Upload Client Company Signature Page"
	And I set the text box using element id "MainContentPlaceHolder_UploadMouSignature1_dtMouSigned_dateTextBox" with the value "06/06/2016"
	And I upload file "UploadFiles\Client_MOU_Signature.gif" using element id "MainContentPlaceHolder_UploadMouSignature1_fileUpload"
	And I click on the submit button labeled "Submit Electronic Document"
	

