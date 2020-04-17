Feature: To test Sign In feature for Amazon
  Scenario: User login from header sucessfully
    Given user is present on Amazon website
    When user click button Sign In
    And enter email field with "ekatesting1704@gmail.com"
    And click button continue
    And enter password field with "testing1704"
    And user click button Sign In to login
    And user click button continue to get OTP
    And open email to verify account email with "ekatesting1704@gmail.com" and password field with "testing1704" and enter the OTP code
    Then user access the website successfully

    Scenario: User login from header with unregistered email (enter email that unregistered before)
      Given user is present on Amazon website
      When  user click button Sign In
      And enter email field with "ekapangaribuan12@gmail.com"
      And click button continue
      Then user will see error message that email is not valid