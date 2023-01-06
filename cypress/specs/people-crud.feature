Feature: People list handling

  Create/Read/Update/Delete people entries
  
    Scenario: Person entry creation
      Given I am logged in as 'user1' using password '1234'
      When I visit '/people' page
      Then I see 'add-person-button' element
      When I click on it
      Then I see 'add-person-name-input' element
      And I focus on it and type 'Justin Case'
      And I see 'add-person-email-input' element
      And I focus on it and type 'justin.case@gmail.com'
      And I press 'Enter' on keyboard
      Then I see 'td' element that contains text 'Justin Case'
      And I see 'td' element that contains text 'justin.case@gmail.com'

    Scenario: Person entry deletion
      Given I am logged in as 'user1' using password '1234'
      When I visit '/people' page
      Then I see 'td' element that contains text 'Justin Case'
      And I see a related 'person-actions-menu-button-{entityid}' element
      When I click on it
      Then I see a related 'action-delete-person-{entityid}' element
      When I click on it
      Then I do not see 'td' element that contains text 'Justin Case'