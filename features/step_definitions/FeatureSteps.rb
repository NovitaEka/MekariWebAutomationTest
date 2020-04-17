require 'selenium-webdriver'

Selenium::WebDriver::Firefox::Binary.path='C:/Program Files/Mozilla Firefox/firefox.exe'

driver = Selenium::WebDriver.for :firefox


Given(/^user is present on Amazon website$/) do
  driver.get 'https://www.amazon.com/'
end


When(/^user click button Sign In$/) do
  if  driver.find_element(:id, 'nav-link-accountList').displayed?
    driver.find_element(:id, 'nav-link-accountList').click
  end
end

And(/^user click button Create your Amazon Account$/) do
  if  driver.find_element(:id, 'auth-create-account-link').displayed?
    driver.find_element(:id, 'auth-create-account-link').click
  end
end

And(/^enter name field with "([^"]*)"$/) do |arg|
  if  driver.find_element(:id, 'ap_customer_name').displayed?
    name = driver.find_element(:id, 'ap_customer_name')
    driver.action.send_keys(name, arg).perform
  end
end

And(/^enter email field with "([^"]*)"$/) do |arg|
  if  driver.find_element(:id, 'ap_email').displayed?
    email = driver.find_element(:id, 'ap_email')
    driver.action.send_keys(email, arg).perform
  end
end

And(/^enter password field with "([^"]*)"$/) do |arg|
  if  driver.find_element(:id, 'ap_password').displayed?
    password = driver.find_element(:id, 'ap_password')
    driver.action.send_keys(password, arg).perform
  end
end

And(/^enter repassword field with "([^"]*)"$/) do |arg|
  if  driver.find_element(:id, 'ap_password_check').displayed?
    repassword = driver.find_element(:id, 'ap_password_check')
    driver.action.send_keys(repassword, arg).perform
  end
end

And(/^click button Create your Amazon account$/) do
  if  driver.find_element(:id, 'continue').displayed?
    driver.find_element(:id, 'continue').click
  end
end

And(/^user enter "([^"]*)" in the "([^"]*)" field$/) do |arg1, arg2|
  # email = driver.find_element(:id, "ap_email")
  # driver.action.send_keys(email, "ekanovita1207@gmail.com").perform
  if arg2.equal?('ap_customer_name')
    name = driver.find_element(:id, arg2)
    driver.action.send_keys(name, arg1).perform
  else
    assert('cannot find the field')
  end
end


And(/^click button continue$/) do
  if  driver.find_element(:id, 'continue').displayed?
    driver.find_element(:id, 'continue').click
  end
end

Then(/^user will see error message that email is not valid$/) do
  # auth-error-message-box
  if  driver.find_element(:id, 'auth-error-message-box').displayed?
    sleep 5
    driver.quit
  end
end

Then(/^user will see error message that email has been registered$/) do

end

And(/^open email to get OTP and input email field with "([^"]*)" and password field with "([^"]*)" and click Next$/) do |email, pass|
  sleep 3
  driver.execute_script( "window.open()" )

  driver.switch_to.window( driver.window_handles.last )

  driver.get 'http://gmail.com/'

  user_email = driver.find_element(:id, 'identifierId')
  driver.action.send_keys(user_email, email).perform

  driver.find_element(:id, 'identifierNext').click

  sleep 3
  if driver.find_element(:name, 'password').displayed?
    user_password =  driver.find_element(:name, 'password')
    driver.action.send_keys(user_password, pass).perform
  end

  driver.find_element(:id, 'passwordNext').click

  sleep 5
   driver.find_element(:xpath, '//div [@class="y6"]/span[contains(., "Amazon Authentication")]').click

  sleep 3

  driver.switch_to.active_element


  if driver.find_element(:xpath, '//p[contains(@class, "otp")]')
    gvar = driver.find_element(:xpath, '//p[contains(@class, "otp")]').text
    puts gvar
  end


end

And(/^enter OTP code and click button create account$/) do
  driver.close()

  # sleep(3)
  #
  # driver.switch_to.window(driver.window_handles[0])
  #
  # if  driver.find_element(:name, 'code').displayed?
  #   co =  driver.find_element(:name, 'code')
  #   driver.action.send_keys(co, gvar).perform
  # end
  #
  # driver.find_element(:id, 'a-autoid-0-announce').click
end


And(/^user click button continue to get OTP$/) do
  if  driver.find_element(:id, 'continue').displayed?
    driver.find_element(:id, 'continue').click
  end
end

And(/^user click button Sign In to login$/) do
  if  driver.find_element(:id, 'signInSubmit').displayed?
    driver.find_element(:id, 'signInSubmit').click
  end
end

And(/^open email to verify account and input email field with "([^"]*)" and password field with "([^"]*)" and click Next$/) do |email, pass|
  sleep 3
  driver.execute_script( "window.open()" )

  driver.switch_to.window( driver.window_handles.last )

  driver.get 'http://gmail.com/'

  user_email = driver.find_element(:id, 'identifierId')
  driver.action.send_keys(user_email, email).perform

  driver.find_element(:id, 'identifierNext').click

  sleep 3
  if driver.find_element(:name, 'password').displayed?
    user_password =  driver.find_element(:name, 'password')
    driver.action.send_keys(user_password, pass).perform
  end

  driver.find_element(:id, 'passwordNext').click

  sleep 5
  driver.find_element(:xpath, '//div [@class="y6"]/span[contains(., "Verify your new Amazon")]').click

  sleep 3

  driver.switch_to.active_element


  if driver.find_element(:xpath, '//p[contains(@class, "otp")]')
    gvar = driver.find_element(:xpath, '//p[contains(@class, "otp")]').text
  end

end

And(/^open email to verify account email with "([^"]*)" and password field with "([^"]*)" and enter the OTP code$/) do |email, pass|
  sleep 3
  driver.execute_script( "window.open()" )

  driver.switch_to.window( driver.window_handles.last )

  driver.get 'http://gmail.com/'

  user_email = driver.find_element(:id, 'identifierId')
  driver.action.send_keys(user_email, email).perform

  driver.find_element(:id, 'identifierNext').click

  sleep 3
  if driver.find_element(:name, 'password').displayed?
    user_password =  driver.find_element(:name, 'password')
    driver.action.send_keys(user_password, pass).perform
  end

  driver.find_element(:id, 'passwordNext').click

  sleep 3
  driver.switch_to.active_element

  driver.find_element(:xpath, '//tr[1]//td[6]//div[1]//div[1]//div[1]//span[1]//span[1]').click
  sleep 3

  driver.switch_to.active_element

  if driver.find_element(:xpath, '//p[contains(@class, "otp")]')
    gvar = driver.find_element(:xpath, '//p[contains(@class, "otp")]').text
  end

  driver.close()

  sleep(3)

  driver.switch_to.window(driver.window_handles[0])

  if  driver.find_element(:name, 'code').displayed?
    co =  driver.find_element(:name, 'code')
    driver.action.send_keys(co, gvar).perform
  end

  driver.find_element(:xpath, '//html//body//div//div//div//div//div//div//div//div//form//div//span//span//input').click
  sleep 5
end

Then(/^user access the website successfully$/) do
   if driver.find_element(:xpath, '//span[contains(text(),"s Amazon.com")]').displayed?
     sleep 5
   end
   driver.close
end