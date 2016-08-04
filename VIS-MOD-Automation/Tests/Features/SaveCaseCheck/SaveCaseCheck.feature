Feature: SaveCaseCheck
	Verify Case numbers generated from the SAVE app

Scenario: Navigate to Save Case Check and verify title
	Given I navigate to the url "https://stage.save.uscis.gov/CaseCheck/" titled "SAVE Case Check : Login Agreement"
	When I set the checkbox with element id "ctl00_MainContentPlaceHolder_chkIAgree" to "true"
	And I click on the button using element id "ctl00_MainContentPlaceHolder_btnNext"
	Then the page title is "SAVE Case Check : Search Cases"

Scenario: Verify Case Summary List
	Given the page title is "SAVE Case Check : Search Cases"
	When I select the drop down text "Verification Case Number" using element id "ctl00_MainContentPlaceHolder_selSearchIdType_SelectorDrop"
	And I set the text box using element id "ctl00_MainContentPlaceHolder_txtCaseNumber_TextBox" with the value "2016139143745QR"
	And I set the text box using element id "ctl00_MainContentPlaceHolder_txtDob_dateTextBox" with the value "08/26/1946"
	And I click on the button using element id "ctl00_MainContentPlaceHolder_btnSubmit"
	Then the page title is "SAVE Case Check : Case Summary List"

Scenario: View Case
	Given the page title is "SAVE Case Check : Case Summary List"
	When I click on the button using element id "ctl00_MainContentPlaceHolder_CasesGrid_ctl02_btnView"
	Then the page contains the text "Case Returned to Agency"
	And the page contains the text "SAVE has returned your case to A Agency to Test Web3."
	And I close the current page
	