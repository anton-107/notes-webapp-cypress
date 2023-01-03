Feature: Notebooks handling

  Create/Read/Update/Delete a notebook
  
    Scenario: Notebook creation
      Given I am logged in as 'user1' using password '1234'
      When I visit '/notebooks' page
      Then I see 'add-notebook-button' element
      When I click on it
      Then I see 'add-notebook-input' element
      And I focus on it and type 'Health and fitness'
      And I press 'Enter' on keyboard
      Then I see '.notebook-title' element that contains text 'Health and fitness'
