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

    Scenario: Notebook deletion
      Given I am logged in as 'user1' using password '1234'
      When I visit '/notebooks' page
      Then I see '.notebook-title' element that contains text 'Health and fitness'
      When I click on it
      Then I see 'notebook-more-actions-dropdown-menu' element
      When I click on it
      Then I see 'a' element that contains text 'Delete this notebook'
      When I click on it
      Then I am redirected to '/notebooks' page
      And I do not see '.notebook-title' element that contains text 'Health and fitness'