Feature: To test Sign Up feature for Amazon
  Scenario: User registers from header successfully
    Given user is present on Amazon website
    When user click button Sign In
    And user click button Create your Amazon Account
    And enter name field with "Eka"
    And enter email field with "ekatesting1704@gmail.com"
    And enter password field with "testing1704"
    And enter repassword field with "testing1704"
    And click button Create your Amazon account
    And open email to verify account email with "ekatesting1704@gmail.com" and password field with "testing1704" and enter the OTP code
    Then user access the website successfully

    Scenario: User registers with registered email
      Given user is present on Amazon website
      When user click button Sign In
      And user click button Create your Amazon Account
      And enter name field with "Eka Testing"
      And enter email field with "ekatestingautomation17@gmail.com"
      And enter password field with "testing1504"
      And enter repassword field with "testing1504"
      And click button Create your Amazon account
      Then user will see error message that email has been registered
