Feature: Corporate Admin Enrollment
	1. Enroll an Corporate Admin
	2. Employer Registration Page & Review (Scenarios 01-06) 
	3. Add Company Informations, Corporate Administrator Information, Registration Review & Enroll (Scenarios 07-10)                                                                                                                                                                                                                                                                                                                                                                                                    
	4. Use WebHQ - search for agent to edit and validate company, set MOU activation date, save Program Administrator ID, Set Tutorial Complete/Temp Password for Program Admin (Scenarios 21-27)
	5. Login to everify as an Agent Program Administrator, Set New Password, Security Questions and Verify User Profile (Scenarios 28-30)
	6. Add a new Company location, Organization Designation, Client Informations, Point of Contact(POC), Review & Register (Scenarios 31-44)
	7. Verify newly added Company location (Scenarios 45-46)
	8. Use WebHQ - search for Company location to edit and validate - Set Mou date for new Company location (Scenarios 47-50)
	9. Login to eVerify as an Agent Program Administrator and validate new Company location activation (Scenario 51)

Scenario: 01-Navigate to Agent Registration page
	Given I navigate to the url for "registration" titled "E-Verify – Employer Registration – Start Page"
	When I set the checkbox with element id "cb_Iagree" to "true"
	And I click on the submit button labeled "Continue"
	Then the page title is "E-Verify – Employer Registration – Checklist"

Scenario: 02-Navigate to page E-Verify – Employer Registration – Start Here
	Given the page is loaded
	When I click on the submit button labeled "Begin E-Verify Enrollment"
	Then the page title is "E-Verify – Employer Registration – Start Here"

Scenario: 03-Employer Access-N Agent-N Corporate-Y Web Services-N
	Given the page is loaded
	When I click on the radio button using element id "radBpNo"
	And I click on the radio button using element id "radDaNo"
	And I click on the radio button using element id "radCorpYes"
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
	| 2                | No   |
    | 3                | No   |
    | 4                | Yes  |
	| 5                | No   |
	
Scenario: 06-Registration Review Page
	Given the page title is "E-Verify - Employer Registration - Let’s Review"
	When I click on the submit button labeled "Next"
	Then the page title is "E-Verify – Employer Registration – Company Information"
	
Scenario: 07-Enter Company Information
	Given the page is loaded
	When I set the text box using element id "ucCAAddressAdmin_txtParentName_TextBox" with the value "Variq Corporate Admin"
	And I set the text box using element id "ucCAAddressAdmin_txtAddress1_TextBox" with the value "900 New Test Drive"
	And I set the text box using element id "ucCAAddressAdmin_txtCity_TextBox" with the value "Rockville"
	And I select the drop down text "MARYLAND" using element id "ucCAAddressAdmin_vssState_SelectorDrop"
	And I set the text box using element id "ucCAAddressAdmin_ltzZipCode_TextBox" with the value "20853"
	And I select the drop down text "MONTGOMERY" using element id "ucCAAddressAdmin_vscCounty_SelectorDrop"
	And I click on the submit button labeled "Next"
	Then the page title is "E-Verify – Employer Registration - Corporate Administrator Users"

Scenario: 08-Add Corporate Administrator User Information
	Given the page is loaded
	When I set the text box using element id "ucCorpPocs_rptContacts__ctl0_ltLastName_TextBox" with the value "Last-Name"
	And I set the text box using element id "ucCorpPocs_rptContacts__ctl0_ltFirstName_TextBox" with the value "First-Smith"
	And I set the text box using element id "ucCorpPocs_rptContacts__ctl0_scPhone_PhoneAreaCode" with the value "301"
	And I set the text box using element id "ucCorpPocs_rptContacts__ctl0_scPhone_PhonePrefixCode" with the value "222"
	And I set the text box using element id "ucCorpPocs_rptContacts__ctl0_scPhone_PhoneSuffixCode" with the value "9999"
	And I set the text box using element id "ucCorpPocs_rptContacts__ctl0_ltEmail_TextBox" with the value "automationtesting1988@gmail.com"
	And I set the text box using element id "ucCorpPocs_rptContacts__ctl0_ltEmail2_TextBox" with the value "automationtesting1988@gmail.com"
	And I click on the submit button labeled "Next"

Scenario Outline: 09-Registration Review-Verify Registration Details
	Given the page title is "E-Verify – Employer Registration – Registration Review"
	Then the page contains the text <TextOnPage> from the following table

	Examples: 
	| TextOnPage                        |
	| Variq Corporate Admin             |
	| 900 New Test Drive                |
	| Rockville                         |
	| MD                                |
	| 20853                             |
	| MONTGOMERY                        |                                
	| Last-Name                         | 
	| First-Smith                       |
	| (301) 222 - 9999                  |
	| automationtesting1988@gmail.com   |

Scenario: 10-Complete Enrollment to Register Corporate Admin
	Given the page is loaded
	When I set the checkbox with element id "ucCAAddressAdminRegResults_chkAgree" to "true"
	And I click on the submit button labeled "Register Company"
	Then the page title is "E-Verify – Employer Registration – You're Finished"
	And I close the current page

Scenario: 11-Navigate to Agent Registration page
	Given I navigate to the url for "registration" titled "E-Verify – Employer Registration – Start Page"
	When I set the checkbox with element id "cb_Iagree" to "true"
	And I click on the submit button labeled "Continue"
	Then the page title is "E-Verify – Employer Registration – Checklist"

Scenario: 12-Navigate to page E-Verify – Employer Registration – Start Here
	Given the page is loaded
	When I click on the submit button labeled "Begin E-Verify Enrollment"
	Then the page title is "E-Verify – Employer Registration – Start Here"

Scenario: 13-Employer Access-N Agent-N Corporate-Y Web Services-N
	Given the page is loaded
	When I click on the radio button using element id "radBpNo"
	And I click on the radio button using element id "radDaNo"
	And I click on the radio button using element id "radCorpYes"
	And I click on the radio button using element id "radWsNo"
	And I click on the submit button labeled "Next"
	Then the page title is "E-Verify - Employer Registration - Let’s Review"

Scenario: 14-Registration Review Page Verification
	Given the page is loaded
	When I access the table using tag "div" attribute type "class" attribute value "box"

Scenario Outline: 15-Review Page Verification Data
	Then table row number <Table Row Number> contains the values <Data> from the following table
	
	Examples: 
	| Table Row Number | Data |
	| 2                | No   |
    | 3                | No   |
    | 4                | Yes  |
	| 5                | No   |
	
Scenario: 16-Registration Review Page
	Given the page title is "E-Verify - Employer Registration - Let’s Review"
	When I click on the submit button labeled "Next"
	Then the page title is "E-Verify – Employer Registration – Company Information"
	
Scenario: 17-Enter Company Information
	Given the page is loaded
	When I set the text box using element id "ucCAAddressAdmin_txtParentName_TextBox" with the value "Variq Corporate Admin"
	And I set the text box using element id "ucCAAddressAdmin_txtAddress1_TextBox" with the value "900 New Test Drive"
	And I set the text box using element id "ucCAAddressAdmin_txtCity_TextBox" with the value "Rockville"
	And I select the drop down text "MARYLAND" using element id "ucCAAddressAdmin_vssState_SelectorDrop"
	And I set the text box using element id "ucCAAddressAdmin_ltzZipCode_TextBox" with the value "20853"
	And I select the drop down text "MONTGOMERY" using element id "ucCAAddressAdmin_vscCounty_SelectorDrop"
	And I click on the submit button labeled "Next"
	Then the page title is "E-Verify – Employer Registration - Corporate Administrator Users"

Scenario: 18-Add Corporate Administrator User Information
	Given the page is loaded
	When I set the text box using element id "ucCorpPocs_rptContacts__ctl0_ltLastName_TextBox" with the value "Last-Name"
	And I set the text box using element id "ucCorpPocs_rptContacts__ctl0_ltFirstName_TextBox" with the value "First-Smith"
	And I set the text box using element id "ucCorpPocs_rptContacts__ctl0_scPhone_PhoneAreaCode" with the value "301"
	And I set the text box using element id "ucCorpPocs_rptContacts__ctl0_scPhone_PhonePrefixCode" with the value "222"
	And I set the text box using element id "ucCorpPocs_rptContacts__ctl0_scPhone_PhoneSuffixCode" with the value "9999"
	And I set the text box using element id "ucCorpPocs_rptContacts__ctl0_ltEmail_TextBox" with the value "automationtesting1988@gmail.com"
	And I set the text box using element id "ucCorpPocs_rptContacts__ctl0_ltEmail2_TextBox" with the value "automationtesting1988@gmail.com"
	And I click on the submit button labeled "Next"

Scenario Outline: 19-Registration Review-Verify Registration Details
	Given the page title is "E-Verify – Employer Registration – Registration Review"
	Then the page contains the text <TextOnPage> from the following table

	Examples: 
	| TextOnPage                        |
	| Variq Corporate Admin             |
	| 900 New Test Drive                |
	| Rockville                         |
	| MD                                |
	| 20853                             |
	| MONTGOMERY                        |                                
	| Last-Name                         | 
	| First-Smith                       |
	| (301) 222 - 9999                  |
	| automationtesting1988@gmail.com   |

Scenario: 20-Complete Enrollment to Register Corporate Admin
	Given the page is loaded
	When I set the checkbox with element id "ucCAAddressAdminRegResults_chkAgree" to "true"
	And I click on the submit button labeled "Register Company"
	Then the page title is "E-Verify – Employer Registration – You're Finished"
	And I close the current page

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
	And I set the text box using element id "txtEmployer_TextBox" with the value "Variq Corporate Admin"
	And I click on the submit button labeled "Display Company Summary List"
	Then the page title is "Company Summary List"

Scenario: 23-Navigate to company details
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
	
Scenario: 25-Set MOU Signed Date to Activate Users
	Given the page title is "IIP Match Review"
	When I click on the submit button labeled "Return to Maintain Company"
	And the page title is "ParentSummary"
	And I click on the button using element id "btnAccessInfo"
	And I set the text box using element id "cdtStartDate_dateTextBox" with the value "04/02/2015"
	And I click on the submit button labeled "Submit Company Information"
	Then the page title is "ParentSummary"

Scenario: 26-Edit Active User and Save User ID
	Given the page is loaded
	When I click on the button using element id "btnUser"
	And the page title is "Employer User Summary List"
	And I access the table using element id "dgCpsUsers"
	And I save the data from table row number "3" column number "2" into the variable "userid" 
	And I click on table row number "3" in column number "2"
	Then the page title is "User Details - View / Modify User Information"

Scenario: 27-Edit User, Set Tutorial Complete and Set Temp Password
	Given the page is loaded
	When I set the checkbox with element id "ucCpsUserModEmployer_chkTutorialComplete" to "true"
	And I set the text box using element id "ucCpsUserModEmployer_ltbNewPwd_TextBox" with the value "Welcome1!"
	And I set the text box using element id "ucCpsUserModEmployer_ltbConfPwd_TextBox" with the value "Welcome1!"
	And I click on the submit button labeled "Submit User Modifications"
	Then the page title is "User Details - User Confirmation"

Scenario: 28-Logon to eVerify to create new Location
	Given I navigate to the url for "everify" titled "E-Verify: Login"
	When I click on the submit button containing the text "I agree"
	And I set the text box using element id "MainContentPlaceHolder_UserIdTextBox_TextBox" with the value stored in the variable "userid"
	And I set the text box using element id "MainContentPlaceHolder_PasswordTextBox_TextBox" with the value "Welcome1!"
	And I click on the submit button labeled "Log In"
	Then the page title is "E-Verify: Change Password"

Scenario: 29-Submit New Password and Security Questions
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

Scenario: 30-Verify User Profile and logon to eVerify
	Given the page is loaded
	Then the text box using element id "MainContentPlaceHolder_ucEvProfileInfoUpdate_ptbPhoneNumber_PhoneAreaCode" contains the value "301"
	Then the text box using element id "MainContentPlaceHolder_ucEvProfileInfoUpdate_ptbPhoneNumber_PhonePrefixCode" contains the value "222"
	Then the text box using element id "MainContentPlaceHolder_ucEvProfileInfoUpdate_ptbPhoneNumber_PhoneSuffixCode" contains the value "9999"
	Then the text box using element id "MainContentPlaceHolder_ucEvProfileInfoUpdate_lteUserEmail_TextBox" contains the value "automationtesting1988@gmail.com"
	When I click on the submit button labeled "Submit User Profile Changes"
	Then the page title is "E-Verify: Home Page"
	
Scenario: 31-Navigate to Company Lacations > Add New Company Location
	Given the page is loaded
	When I click on the link using element id "anch_3"
	And I click on the link using element id "anch_4"
	Then the page title is "E-Verify: Employer Wizard - Organization Designation"

Scenario: 32-Set Organization Designation
	Given the page is loaded
	When I select the drop down text "None of these categories apply" using element id "MainContentPlaceHolder_EmployerCategory1_ddlCategory"
	And I click on the submit button labeled "Next"
	Then the page title is "E-Verify: Employer Wizard - MOU Notice"

Scenario: 33-Set Memorandum of Understanding (MOU)
	Given the page is loaded
	When I click on the radio button using element id "MainContentPlaceHolder_MouNotice_radAccept"
	And I click on the submit button labeled "Next"
	Then the page title is "E-Verify: Employer Wizard - Company Information"

Scenario: 34-Input Company Information
	Given the page is loaded
	When I set the text box using element id "MainContentPlaceHolder_CompanyInformation1_txtEmpName_TextBox" with the value " Auto Test Company"
	And I set the text box using element id "MainContentPlaceHolder_CompanyInformation1_txtAddress1_TextBox" with the value "123 New Dr"
	And I set the text box using element id "MainContentPlaceHolder_CompanyInformation1_txtCity_TextBox" with the value "Rockville"
	And I select the drop down text "MARYLAND" using element id "MainContentPlaceHolder_CompanyInformation1_ddlState"
	And I set the text box using element id "MainContentPlaceHolder_CompanyInformation1_ltzZipCode_TextBox" with the value "20853"
	And I select the drop down text "MONTGOMERY" using element id "MainContentPlaceHolder_CompanyInformation1_ddlCounty"
	And I set the text box using element id "MainContentPlaceHolder_CompanyInformation1_ltnEmployerId_TextBox" with the value "888888899"
	And I select the drop down text "1 to 4" using element id "MainContentPlaceHolder_CompanyInformation1_ddlTotalEmployeeRange"
	And I click on the submit button labeled "Next"
	Then the page title is "E-Verify: Employer Wizard - Enter NAICS Code"

Scenario: 35-Add NAIC Code for Comany Location
	Given the page is loaded
	When I set the text box using element id "MainContentPlaceHolder_Naics_ltNaicsCode_TextBox" with the value "521"
	And I click on the submit button labeled "Accept NAICS Code"
	Then the page title is "E-Verify: Employer Wizard - How Many Hiring Sites?"

Scenario: 36-Hiring Sites
	Given the page is loaded
	When I click on the submit button labeled "Multiple Sites Verification"
	Then the page title is "E-Verify: Employer Wizard - Hiring Sites"

Scenario: 37-Add New Hiring Sites
	Given the page is loaded
	When I click on the button using element id "MainContentPlaceHolder_HiringSites_btnAdd"
	And I select the drop down text "GEORGIA" using element id "MainContentPlaceHolder_HiringSites_ddlState"
	And I set the text box using element id "MainContentPlaceHolder_HiringSites_lntNoOfSites_TextBox" with the value "1"
	And I click on the button using element id "MainContentPlaceHolder_HiringSites_btnSubmit"
	Then the page title is "E-Verify: Employer Wizard - Hiring Sites"

Scenario Outline: 38-Verify Hiring Sites
	Given the page is loaded
	When I access the table using tag "div" attribute type "class" attribute value "visGridView responsive-xs"
	Then table row number <Table Row Number> contains the values <Data> from the following table
	
	Examples: 
	| Table Row Number | Data       |
	| 3                | GEORGIA    |
    | 4                | MARYLAND   |

Scenario: 39: Verify Hiring Sites
	Given the page title is "E-Verify: Employer Wizard - Hiring Sites"
	When I click on the button using element id "MainContentPlaceHolder_HiringSites_btnListNext"
	Then the page title is "E-Verify: Employer Wizard - Enter Program Administrator"

Scenario: 40-Enter Program Administrator information
	Given the page is loaded
	When I set the text box using element id "MainContentPlaceHolder_ucContacts_ltaLastName_TextBox" with the value "JOEET"
	And I set the text box using element id "MainContentPlaceHolder_ucContacts_ltaFirstName_TextBox" with the value "JOHN"
	And I set the text box using element id "MainContentPlaceHolder_ucContacts_ptbPhoneNumber_PhoneAreaCode" with the value "301"
	And I set the text box using element id "MainContentPlaceHolder_ucContacts_ptbPhoneNumber_PhonePrefixCode" with the value "888"
	And I set the text box using element id "MainContentPlaceHolder_ucContacts_ptbPhoneNumber_PhoneSuffixCode" with the value "9999"
	And I set the text box using element id "MainContentPlaceHolder_ucContacts_lteEmailAddress_TextBox" with the value "clientemail@variq.com"
	And I click on the submit button labeled "Next"
	Then the page title is "E-Verify: Employer Wizard - Points of Contact Summary List"

Scenario: 41-Verify POC Summary
	Given the page is loaded
	When I access the table using element id "MainContentPlaceHolder_ucContacts_ContactsGrid"
	Then table row number "3" column number "1" contains the value "JOEET"
	And table row number "3" column number "2" contains the value "JOHN"
	And table row number "3" column number "4" contains the value "(301) 888 - 9999"
	And table row number "3" column number "6" contains the value "clientemail@variq.com"

Scenario: 42-Navigate to Company Information
	Given the page title is "E-Verify: Employer Wizard - Points of Contact Summary List"
	When I click on the submit button labeled "Next"
	Then the page title is "E-Verify: Employer Wizard - Company Information"

Scenario Outline: 43-Verify Company Information
	Given the page is loaded
	Then the page contains the text <TextOnPage> from the following table

	Examples: 
	| TextOnPage                |
	| Auto Test Company         |
	| 123 New Dr                |
	| Rockville                 |
	| MD                        |
	| 20853                     |
	| MONTGOMERY                |
	| 888888899                 |
	| 1 to 4                    |
	| None of these categories apply          |
	| 521 - MONETARY AUTHORITIES - CENTRAL BANK (521) |

Scenario: 44-Register Employer
	Given the page title is "E-Verify: Employer Wizard - Company Information"
	When I click on the submit button labeled "Register Employer"
	Then the page title is "E-Verify: Employer Wizard - Thank you for registering for E-Verify"

Scenario: 45: Navigate to Newly Registered Company Location
	Given the page is loaded
	When I click on the link using element id "anch_3"
	And I click on the link using element id "anch_5"
	And I click on the submit button labeled "Search"
	Then the page title is "E-Verify: Search Results"
	
Scenario Outline: 46: Verify newly created RWD Location
	Given the page is loaded
	When I access the table using element id "MainContentPlaceHolder_EmployerGrid"
	Then table row number <Table Row Number> contains the values <Data> from the following table
	
	Examples: 
	| Table Row Number | Data              |
	| 3                | Auto Test Company |
    | 3                | 123 New Dr        |
    | 3                | Rockville         |
	| 3                | MD                |
	| 3                | PENDING           |

Scenario: 47-Logon to WebHQ and search for new Location
	Given I navigate to the url for "webhq" titled "Login"
	When I set the checkbox with element id "cb_Iagree" to "true"
	And I click on the button using element id "btnContinue1"
	And I set the text box using element id "txtUserID" with the value for "webhq-username"
	And I set the text box using element id "txtUserPassword" with the value for "webhq-password"
	And I click on the submit button labeled "Login"
	And the page title is "Web-HQ: Home"
	And I click on the link containing the text "Maintain Company"
	And the page title is "Company Search"
	And I set the text box using element id "txtEmployer_TextBox" with the value "Auto Test Company"
	And I click on the submit button labeled "Display Company Summary List"
	Then the page title is "Company Summary List"

Scenario: 48-Search Company
	Given the page is loaded
	When I access the table using tag "table" attribute type "class" attribute value "ControlText"
	And I save the table row number containing the data "PENDING" in column number "11" into the variable "tableRowNumber"
	And I click on the button labeled "Edit" in the table row number saved in the variable "tableRowNumber"
	Then the page title is "Company Details"

Scenario: 49-Validate and Match Company
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
	
Scenario: 50-Set MOU Signed Date to Activate Users
	Given the page title is "IIP Match Review"
	When I click on the submit button labeled "Return to Maintain Company"
	And the page title is "Company Details"
	And I click on the button using element id "ucSummary_btnAccessInfo"
    And I set the text box using element id "ucCompanyAccess_cdtMOUDate_dateTextBox" with the value "01/03/2016"
	And I click on the submit button labeled "Submit Information"
	Then the page title is "Company Details"

Scenario: 51-Finally logon to eVerify and validate new location activation
	Given I navigate to the url for "everify" titled "E-Verify: Login"
	When I click on the submit button containing the text "I agree"
	And I set the text box using element id "MainContentPlaceHolder_UserIdTextBox_TextBox" with the value stored in the variable "userid"
	And I set the text box using element id "MainContentPlaceHolder_PasswordTextBox_TextBox" with the value "Password1!"
	And I click on the submit button labeled "Log In"
	And I click on the link using element id "anch_3"
	And I click on the link using element id "anch_5"
	And I click on the submit button labeled "Search"
	And I access the table using element id "MainContentPlaceHolder_EmployerGrid"
	Then table row number "3" column number "7" contains the value "ACTIVE"
	And table row number "3" column number "2" contains the value "Auto Test Company"
	And I click on the link containing the text "LOG OUT"
	And I close the current page
