Feature: Signin flow

  I want to sign in into Notes App

    Scenario: Sucessful sign in for user1 (via single-page app)
      When I visit '/' page
      Then I see 'user-login' element
      And I focus on it and type 'user1'
      And I see 'user-password' element
      And I focus on it and type '1234'
      And I press 'Enter' on keyboard
      Then I see 'user-menu-greeting' element
      And it has inner text of 'Signed in as user1.'
      And I see 'signout-link' element
      When I click on it
      Then I see 'user-login' element
      And I do not see 'sign-out-link' element
      And I do not see 'user-greeting' element