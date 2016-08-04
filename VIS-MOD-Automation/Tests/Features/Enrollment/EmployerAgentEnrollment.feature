Feature: Employer Agent Enrollment
	1. Enroll an Employer Agent
	2. Employer Registration Page & Review (Scenarios 01-06) 
	3. Organization Designation, MOU Signatory, Company Informations, Agent Program Administrator Informations, Registration Review & Enroll (Scenarios 07-17)                                                                                                                                                                                                                                                                                                                                                                                                    
	4. Use WebHQ - search for agent to edit and validate company, set MOU activation date, save Program Administrator ID, Set Tutorial Complete/Temp Password for Program Admin (Scenarios 35-41)
	5. Login to everify as an Agent Program Administrator, Set New Password, Security Questions and Verify User Profile (Scenarios 42-44)
	6. Add a New Client, Organization Designation, Client Informations, Point of Contact(POC), Review & Register (Scenarios 45-54)
	7. Verify newly added client (Scenarios 55-56)
	8. Use WebHQ - search for client to edit and validate Client - Set Mou date for new client (Scenarios 57-58)
	9. Login to eVerify as an Agent Program Administrator and validate new client activation (Scenario 59)

Scenario: 01-Navigate to E-Verify Registration Checklist page
	Given I navigate to the url for "registration" titled "E-Verify – Employer Registration – Start Page"
	When I set the checkbox with element id "cb_Iagree" to "true"
	And I click on the submit button labeled "Continue"
	Then the page title is "E-Verify – Employer Registration – Checklist"

Scenario: 02-Navigate to page E-Verify – Employer Registration – Start Here
	Given the page is loaded
	When I click on the submit button labeled "Begin E-Verify Enrollment"
	Then the page title is "E-Verify – Employer Registration – Start Here"

Scenario: 03-Set Employer Access-Y Agent-Y Corporate/Web Services-N
	Given the page is loaded
	When I click on the radio button using element id "radBpYes"
	And I click on the radio button using element id "radDaYes"
	And I click on the radio button using element id "radCorpNo"
	And I click on the radio button using element id "radWsNo"
	And I click on the submit button labeled "Next"
	Then the page title is "E-Verify - Employer Registration - Let’s Review"

Scenario: 04-Registration Review Page Verification
	Given the page is loaded
	When I access the table using tag "div" attribute type "class" attribute value "box"

Scenario Outline: 05-Review Page Verification Data
	Then table row number <Table Row Number> contains the values <Data> from the following table
	
	Examples: 
	| Table Row Number | Data |
	| 2                | Yes  |
    | 3                | Yes  |
    | 4                | No   |
	| 5                | No   |
	
Scenario: 06-Registration Review Page
	Given the page title is "E-Verify - Employer Registration - Let’s Review"
	When I click on the submit button labeled "Next"
	Then the page title is "E-Verify - Employer Registration - Organization Designation"
	
Scenario: 07-Set Organization Designation
	Given the page is loaded
	When I select the drop down text "State Government" using element id "ucCategory_vscCategory_SelectorDrop"
	And I click on the submit button labeled "Next"
	Then the page title is "E-Verify – Employer Registration – Memorandum of Understanding"

Scenario: 08-Switch to iFrame to verify MOU
	Given the page is loaded
	When I switch to iframe using element id "ucRegistrationTerms_frmMou"
	Then the page contains the text "MEMORANDUM OF UNDERSTANDING"
	And the page contains the text "FOR E-VERIFY EMPLOYER AGENTS"
	And I switch back to the body of the page
	
Scenario: 09-Memorandum of Understanding (MOU)
	Given the page title is "E-Verify – Employer Registration – Memorandum of Understanding"
	When I click on the radio button using element id "ucRegistrationTerms_radAccept"
	And I click on the submit button labeled "Next"
	Then the page title is "E-Verify – Employer Registration – MOU Signatory"
	
Scenario: 10-Set MOU Signatory
	Given the page is loaded
	When I set the text box using element id "ucMouPoc_ltLastName_TextBox" with the value "Test"
	And I set the text box using element id "ucMouPoc_ltFirstName_TextBox" with the value "Smith"
	And I set the text box using element id "ucMouPoc_scPhone_PhoneAreaCode" with the value "202"
	And I set the text box using element id "ucMouPoc_scPhone_PhonePrefixCode" with the value "123"
	And I set the text box using element id "ucMouPoc_scPhone_PhoneSuffixCode" with the value "9953"
	And I set the text box using element id "ucMouPoc_ltEmail_TextBox" with the value "automationtesting1988@gmail.com"
	And I set the text box using element id "ucMouPoc_ltEmail2_TextBox" with the value "automationtesting1988@gmail.com"
	And I select the drop down text "Yes" using element id "ucMouPoc_optAccess"
	And I click on the submit button labeled "Next"
	Then the page title is "E-Verify – Employer Registration – Company Information"
	
Scenario: 11-Enter Company Information
	Given the page is loaded
	When I set the text box using element id "ucCompanyInfo_txtEmpName_TextBox" with the value "Variq Employer Agent"
	And I set the text box using element id "ucCompanyInfo_txtAddress1_TextBox" with the value "500 New Automation Drive"
	And I set the text box using element id "ucCompanyInfo_txtCity_TextBox" with the value "Rockville"
	And I select the drop down text "MARYLAND" using element id "ucCompanyInfo_vssState_SelectorDrop"
	And I set the text box using element id "ucCompanyInfo_ltzZipCode_TextBox" with the value "20852"
	And I select the drop down text "MONTGOMERY" using element id "ucCompanyInfo_vscCounty_SelectorDrop"
	And I set the text box using element id "ucCompanyInfo_ltnEmployerId_TextBox" with the value "888888888"
	And I select the drop down text "1 to 4" using element id "ucCompanyInfo_vscNbrEmps_SelectorDrop"
	And I click on the submit button labeled "Next"
	Then the page title is "E-Verify – Employer Registration – NAICS Code"

Scenario: 12-Generate NAIC Code
	Given the page is loaded
	When I set the text box using element id "ucNaics_ltNaicsCode_TextBox" with the value "721"
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

Scenario: 15-Add a Second User E-Verify User
	Given the page is loaded
	When I set the text box using element id "ucRegContacts_rptContacts__ctl0_ltLastName_TextBox" with the value "Test-Smith"
	And I set the text box using element id "ucRegContacts_rptContacts__ctl0_ltFirstName_TextBox" with the value "Frist-Name"
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
	| TextOnPage                      |
	| Variq Employer Agent            |
	| 500 New Automation Drive        |
	| Rockville                       |
	| MD                              |
	| 20852                           |
	| MONTGOMERY                      |
	| 888888888                       |
	| 1 to 4                          |
	| State Government                |
	| 721 - ACCOMMODATION             |
	| MARYLAND                        |
	| Test-Smith                      |
	| Frist-Name                      |
	| (777) 888 - 9999                |
	| automationtesting1988@gmail.com |

Scenario: 17-Complete Enrollment to Register Agent
	Given the page title is "E-Verify – Employer Registration – Registration Review"
	When I set the checkbox with element id "ucSummary_chkAgree" to "true"
	And I click on the submit button labeled "Register Employer"
	Then the page title is "E-Verify – Employer Registration – You're Finished"
	And I close the current page

Scenario: 18-Navigate to E-Verify Registration Checklist page
	Given I navigate to the url for "registration" titled "E-Verify – Employer Registration – Start Page"
	When I set the checkbox with element id "cb_Iagree" to "true"
	And I click on the submit button labeled "Continue"
	Then the page title is "E-Verify – Employer Registration – Checklist"

Scenario: 19-Navigate to page E-Verify – Employer Registration – Start Here
	Given the page is loaded
	When I click on the submit button labeled "Begin E-Verify Enrollment"
	Then the page title is "E-Verify – Employer Registration – Start Here"

Scenario: 20-Set Employer Access-Y Agent-Y Corporate/Web Services-N
	Given the page is loaded
	When I click on the radio button using element id "radBpYes"
	And I click on the radio button using element id "radDaYes"
	And I click on the radio button using element id "radCorpNo"
	And I click on the radio button using element id "radWsNo"
	And I click on the submit button labeled "Next"
	Then the page title is "E-Verify - Employer Registration - Let’s Review"

Scenario: 21-Registration Review Page Verification
	Given the page is loaded
	When I access the table using tag "div" attribute type "class" attribute value "box"

Scenario Outline: 22-Review Page Verification Data
	Then table row number <Table Row Number> contains the values <Data> from the following table
	
	Examples: 
	| Table Row Number | Data |
	| 2                | Yes  |
    | 3                | Yes  |
    | 4                | No   |
	| 5                | No   |
	
Scenario: 23-Registration Review Page
	Given the page title is "E-Verify - Employer Registration - Let’s Review"
	When I click on the submit button labeled "Next"
	Then the page title is "E-Verify - Employer Registration - Organization Designation"
	
Scenario: 24-Set Organization Designation
	Given the page is loaded
	When I select the drop down text "State Government" using element id "ucCategory_vscCategory_SelectorDrop"
	And I click on the submit button labeled "Next"
	Then the page title is "E-Verify – Employer Registration – Memorandum of Understanding"

Scenario: 25-Switch to iFrame to verify MOU
	Given the page is loaded
	When I switch to iframe using element id "ucRegistrationTerms_frmMou"
	Then the page contains the text "MEMORANDUM OF UNDERSTANDING"
	And the page contains the text "FOR E-VERIFY EMPLOYER AGENTS"
	And I switch back to the body of the page
	
Scenario: 26-Memorandum of Understanding (MOU)
	Given the page title is "E-Verify – Employer Registration – Memorandum of Understanding"
	When I click on the radio button using element id "ucRegistrationTerms_radAccept"
	And I click on the submit button labeled "Next"
	Then the page title is "E-Verify – Employer Registration – MOU Signatory"
	
Scenario: 27-Set MOU Signatory
	Given the page is loaded
	When I set the text box using element id "ucMouPoc_ltLastName_TextBox" with the value "Test"
	And I set the text box using element id "ucMouPoc_ltFirstName_TextBox" with the value "Smith"
	And I set the text box using element id "ucMouPoc_scPhone_PhoneAreaCode" with the value "202"
	And I set the text box using element id "ucMouPoc_scPhone_PhonePrefixCode" with the value "123"
	And I set the text box using element id "ucMouPoc_scPhone_PhoneSuffixCode" with the value "9953"
	And I set the text box using element id "ucMouPoc_ltEmail_TextBox" with the value "automationtesting1988@gmail.com"
	And I set the text box using element id "ucMouPoc_ltEmail2_TextBox" with the value "automationtesting1988@gmail.com"
	And I select the drop down text "Yes" using element id "ucMouPoc_optAccess"
	And I click on the submit button labeled "Next"
	Then the page title is "E-Verify – Employer Registration – Company Information"
	
Scenario: 28-Enter Company Information
	Given the page is loaded
	When I set the text box using element id "ucCompanyInfo_txtEmpName_TextBox" with the value "Variq Employer Agent"
	And I set the text box using element id "ucCompanyInfo_txtAddress1_TextBox" with the value "500 New Automation Drive"
	And I set the text box using element id "ucCompanyInfo_txtCity_TextBox" with the value "Rockville"
	And I select the drop down text "MARYLAND" using element id "ucCompanyInfo_vssState_SelectorDrop"
	And I set the text box using element id "ucCompanyInfo_ltzZipCode_TextBox" with the value "20852"
	And I select the drop down text "MONTGOMERY" using element id "ucCompanyInfo_vscCounty_SelectorDrop"
	And I set the text box using element id "ucCompanyInfo_ltnEmployerId_TextBox" with the value "888888888"
	And I select the drop down text "1 to 4" using element id "ucCompanyInfo_vscNbrEmps_SelectorDrop"
	And I click on the submit button labeled "Next"
	Then the page title is "E-Verify – Employer Registration – NAICS Code"

Scenario: 29-Generate NAIC Code
	Given the page is loaded
	When I set the text box using element id "ucNaics_ltNaicsCode_TextBox" with the value "721"
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

Scenario: 32-Add a Second User E-Verify User
	Given the page is loaded
	When I set the text box using element id "ucRegContacts_rptContacts__ctl0_ltLastName_TextBox" with the value "Test-Smith"
	And I set the text box using element id "ucRegContacts_rptContacts__ctl0_ltFirstName_TextBox" with the value "Frist-Name"
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
	| TextOnPage                      |
	| Variq Employer Agent            |
	| 500 New Automation Drive        |
	| Rockville                       |
	| MD                              |
	| 20852                           |
	| MONTGOMERY                      |
	| 888888888                       |
	| 1 to 4                          |
	| State Government                |
	| 721 - ACCOMMODATION             |
	| MARYLAND                        |
	| Test-Smith                      |
	| Frist-Name                      |
	| (777) 888 - 9999                |
	| automationtesting1988@gmail.com |

Scenario: 34-Complete Enrollment to Register Agent
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
	And I set the text box using element id "txtEmployer_TextBox" with the value "Variq Employer Agent"
	And I click on the submit button labeled "Display Company Summary List"
	Then the page title is "Company Summary List"

Scenario: 37-Navigate to company details
	Given the page is loaded
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

Scenario: 39-Set MOU Signed Date to Activate Users
	Given the page title is "IIP Match Review"
	When I click on the submit button labeled "Return to Maintain Company"
	And the page title is "Company Details"
	And I access table number "6" using tag "table" attribute type "id" attribute value "structure"
	And I click on the button labeled "View / Edit" in row number "2"
	And the page title is "Company Details"
	And I set the text box using element id "ucCompanyAccess_cdtMOUDate_dateTextBox" with the value "01/02/2016"
	And I click on the submit button labeled "Submit Information"
	And I access table number "4" using tag "table" attribute type "id" attribute value "tblAddress"
	Then table row number "10" column number "2" contains the value "Total Active Users:"
	And table row number "10" column number "3" contains the value "2"

Scenario: 40- Edit Active User and Save User ID
	Given the page title is "Company Details"
	When I click on the button labeled "View / Edit" in row number "10"
	And the page title is "Employer User Summary"
	And I access the table using element id "dgCpsUsers"
	And I save the data from table row number "3" column number "2" into the variable "userid" 
	And I click on table row number "3" in column number "2"
	Then the page title is "User Details - View / Modify User Information"

Scenario: 41- Edit User, Set Tutorial Complete and Set Temp Password
	Given the page is loaded
	When I set the checkbox with element id "ucCpsUserModEmployer_chkTutorialComplete" to "true"
	And I set the text box using element id "ucCpsUserModEmployer_ltbNewPwd_TextBox" with the value "Welcome1!"
	And I set the text box using element id "ucCpsUserModEmployer_ltbConfPwd_TextBox" with the value "Welcome1!"
	And I click on the submit button labeled "Submit User Modifications"
	Then the page title is "User Details - User Confirmation"
	
Scenario: 42-Logon to eVerify for creating new clients
	Given I navigate to the url for "everify" titled "E-Verify: Login"
	When I click on the submit button containing the text "I agree"
	And I set the text box using element id "MainContentPlaceHolder_UserIdTextBox_TextBox" with the value stored in the variable "userid"
	And I set the text box using element id "MainContentPlaceHolder_PasswordTextBox_TextBox" with the value "Welcome1!"
	And I click on the submit button labeled "Log In"
	Then the page title is "E-Verify: Change Password"

Scenario: 43-Submit New Password and Security Questions
	Given the page is loaded
	When I set the text box using element id "MainContentPlaceHolder_ltbOldPwd_TextBox" with the value "Welcome1!"
	And I set the text box using element id "MainContentPlaceHolder_ltbNewPwd_TextBox" with the value "Password1!"
	And I set the text box using element id "MainContentPlaceHolder_ltbValidatePwd_TextBox" with the value "Password1!"
	And I select the drop down text "What is the name of the first school you attended?" using element id "MainContentPlaceHolder_ucPwdChallengeAnswers_lstQuestion1"
	And I set the text box using element id "MainContentPlaceHolder_ucPwdChallengeAnswers_txtAnswer1_TextBox" with the value "abcde"
	And I select the drop down text "What is the name of your first pet?" using element id "MainContentPlaceHolder_ucPwdChallengeAnswers_lstQuestion2"
	And I set the text box using element id "MainContentPlaceHolder_ucPwdChallengeAnswers_txtAnswer2_TextBox" with the value "test"
	And I select the drop down text "What is your father's middle name?" using element id "MainContentPlaceHolder_ucPwdChallengeAnswers_lstQuestion3"
	And I set the text box using element id "MainContentPlaceHolder_ucPwdChallengeAnswers_txtAnswer3_TextBox" with the value "name"
	And I click on the submit button labeled "Submit"
	Then the page title is "E-Verify: Update User Profile"

Scenario: 44-Verify User Profile and logon to eVerify
	Given the page is loaded
	Then the text box using element id "MainContentPlaceHolder_ucEvProfileInfoUpdate_ptbPhoneNumber_PhoneAreaCode" contains the value "777"
	Then the text box using element id "MainContentPlaceHolder_ucEvProfileInfoUpdate_ptbPhoneNumber_PhonePrefixCode" contains the value "888"
	Then the text box using element id "MainContentPlaceHolder_ucEvProfileInfoUpdate_ptbPhoneNumber_PhoneSuffixCode" contains the value "9999"
	Then the text box using element id "MainContentPlaceHolder_ucEvProfileInfoUpdate_lteUserEmail_TextBox" contains the value "testuser@test.com"
	When I click on the submit button labeled "Submit User Profile Changes"
	Then the page title is "E-Verify: Home Page"
	
Scenario: 45-Navigate to Clients > Add New Client
	Given the page is loaded
	When I click on the link using element id "anch_7"
	And I click on the link using element id "anch_8"
	Then the page title is "E-Verify: Client Wizard - Organization Designation"

Scenario: 46- Set Organization Designation to Local Government
	Given the page is loaded
	When I select the drop down text "Local Government" using element id "MainContentPlaceHolder_ClientCategory1_ddlCategory"
	And I click on the submit button labeled "Next"
	Then the page title is "E-Verify: Client Wizard - Company Information"

Scenario: 47-Add Client Information
	Given the page is loaded
	When I set the text box using element id "MainContentPlaceHolder_CompanyInformation1_txtEmpName_TextBox" with the value "Auto Test Client"
	And I set the text box using element id "MainContentPlaceHolder_CompanyInformation1_txtAddress1_TextBox" with the value "123 Client Dr"
	And I set the text box using element id "MainContentPlaceHolder_CompanyInformation1_txtCity_TextBox" with the value "Rockville"
	And I select the drop down text "MARYLAND" using element id "MainContentPlaceHolder_CompanyInformation1_ddlState"
	And I set the text box using element id "MainContentPlaceHolder_CompanyInformation1_ltzZipCode_TextBox" with the value "00000"
	And I select the drop down text "MONTGOMERY" using element id "MainContentPlaceHolder_CompanyInformation1_ddlCounty"
	And I set the text box using element id "MainContentPlaceHolder_CompanyInformation1_ltnEmployerId_TextBox" with the value "888888889"
	And I select the drop down text "100 to 499" using element id "MainContentPlaceHolder_CompanyInformation1_ddlTotalEmployeeRange"
	And I click on the submit button labeled "Next"
	Then the page title is "E-Verify: Client Wizard - Enter NAICS Code"

Scenario: 48-Add NAIC Code for New Client
	Given the page is loaded
	When I set the text box using element id "MainContentPlaceHolder_Naics_ltNaicsCode_TextBox" with the value "722"
	And I click on the submit button labeled "Accept NAICS Code"
	Then the page title is "E-Verify: Client Wizard - How Many Hiring Sites?"

Scenario: 49-Hiring Sites
	Given the page is loaded
	When I click on the submit button labeled "Single Site Verification"
	Then the page title is "E-Verify: Client Wizard - Enter Program Administrator"

Scenario: 50-Enter Program Administrator information
	Given the page is loaded
	When I set the text box using element id "MainContentPlaceHolder_ucContacts_ltaLastName_TextBox" with the value "Test Client-LN"
	And I set the text box using element id "MainContentPlaceHolder_ucContacts_ltaFirstName_TextBox" with the value "Test Client-FN"
	And I set the text box using element id "MainContentPlaceHolder_ucContacts_ptbPhoneNumber_PhoneAreaCode" with the value "301"
	And I set the text box using element id "MainContentPlaceHolder_ucContacts_ptbPhoneNumber_PhonePrefixCode" with the value "888"
	And I set the text box using element id "MainContentPlaceHolder_ucContacts_ptbPhoneNumber_PhoneSuffixCode" with the value "9999"
	And I set the text box using element id "MainContentPlaceHolder_ucContacts_lteEmailAddress_TextBox" with the value "clientemail@variq.com"
	And I click on the submit button labeled "Next"
	Then the page title is "E-Verify: Client Wizard - Points of Contact Summary List"

Scenario: 51-Verify POC Summary
	Given the page is loaded
	When I access the table using element id "MainContentPlaceHolder_ucContacts_ContactsGrid"
	Then table row number "3" column number "1" contains the value "Test Client-LN"
	And table row number "3" column number "2" contains the value "Test Client-FN"
	And table row number "3" column number "4" contains the value "(301) 888 - 9999"
	And table row number "3" column number "6" contains the value "clientemail@variq.com"
	
Scenario: 52-Navigate to Company Information
	Given the page title is "E-Verify: Client Wizard - Points of Contact Summary List"
	When I click on the submit button labeled "Next"
	Then the page title is "E-Verify: Client Wizard - Company Information"

Scenario Outline: 53-Verify Company Information
	Given the page is loaded
	Then the page contains the text <TextOnPage> from the following table

	Examples: 
	| TextOnPage                |
	| Auto Test Client          |
	| 123 Client Dr             |
	| Rockville                 |
	| MD                        |
	| 00000                     |
	| MONTGOMERY                |
	| 888888889                 |
	| 100 to 499                |
	| Local Government          |
	| 722 - FOOD SERVICES AND DRINKING PLACES (722) |

Scenario: 54-Register Client
	Given the page title is "E-Verify: Client Wizard - Company Information"
	When I click on the submit button labeled "Register Client"
	Then the page title is "E-Verify: Client Wizard - Thank you for registering for E-Verify"

Scenario: 55: Navigate to Newly Registered Client
	Given the page is loaded
	When I click on the link using element id "anch_7"
	And I click on the link using element id "anch_9"
	And I click on the submit button labeled "Search"
	Then the page title is "E-Verify: Search Results"
	
Scenario Outline: 56: Verify newly created RWD Client
	Given the page is loaded
	When I access the table using element id "MainContentPlaceHolder_ClientCompanyGrid"
	Then table row number <Table Row Number> contains the values <Data> from the following table
	
	Examples: 
	| Table Row Number | Data              |
	| 3                | Auto Test Client  |
    | 3                | 123 Client Dr     |
    | 3                | Rockville         |
	| 3                | MD                |
	| 3                | PENDING           |

Scenario: 57-Logon to WebHQ and search for new client
	Given I navigate to the url for "webhq" titled "Login"
	When I set the checkbox with element id "cb_Iagree" to "true"
	And I click on the button using element id "btnContinue1"
	And I set the text box using element id "txtUserID" with the value for "webhq-username"
	And I set the text box using element id "txtUserPassword" with the value for "webhq-password"
	And I click on the submit button labeled "Login"
	And the page title is "Web-HQ: Home"
	And I click on the link containing the text "Maintain Company"
	And the page title is "Company Search"
	And I set the text box using element id "txtEmployer_TextBox" with the value "Auto Test Client"
	And I click on the submit button labeled "Display Company Summary List"
	Then the page title is "Company Summary List"

Scenario: 58-Set MOU date for new client
	Given the page is loaded
	When I access the table using tag "table" attribute type "class" attribute value "ControlText"
	And I save the table row number containing the data "PENDING" in column number "11" into the variable "tableRowNumber"
	And I click on the button labeled "Edit" in the table row number saved in the variable "tableRowNumber"
	And the page title is "Client Company"
	And I access table number "5" using tag "table" attribute type "id" attribute value "tblAddress"
	And I click on the button labeled "View / Edit" in row number "2"
	And I set the text box using element id "ucCompanyAccess_cdtMOUDate_dateTextBox" with the value "01/03/2016"
	And I click on the submit button labeled "Submit Information"
	Then table row number "2" column number "3" contains the value "01/03/2016"

Scenario: 59-Finally logon to eVerify and validate new client activation
	Given I navigate to the url for "everify" titled "E-Verify: Login"
	When I click on the submit button containing the text "I agree"
	And I set the text box using element id "MainContentPlaceHolder_UserIdTextBox_TextBox" with the value stored in the variable "userid"
	And I set the text box using element id "MainContentPlaceHolder_PasswordTextBox_TextBox" with the value "Password1!"
	And I click on the submit button labeled "Log In"
	And I click on the link using element id "anch_7"
	And I click on the link using element id "anch_9"
	And I click on the submit button labeled "Search"
	And I access the table using element id "MainContentPlaceHolder_ClientCompanyGrid"
	Then table row number "3" column number "6" contains the value "ACTIVE"
	And table row number "3" column number "2" contains the value "Auto Test Client"
	And I click on the link containing the text "LOG OUT"
	And I close the current page