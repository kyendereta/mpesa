Feature: User Sign Up
As a User
I want  so sign up
So that can have an account

Scenario: User successfully signup
    Given I am on the signup page
    Then I should see "First name"
    And I should see "Last name"
    And I should see "Id number"
    And I should see "Phone number"
    And I should see "Password"
    And I should see "Password confirmation"
    And I should see "Create Account" button
    When I fill in "First name" with "Jane"
    And I fill in "Last name" with "Doe"
    And I fill in "Id number" with "12345678"
    And I fill in "Phone number" with "0707065562"
    And I fill in "Password" with "Stronger*than123Usual"
    And I fill in "Password confirmation" with "Stronger*than123Usual"
    And I click Create Account
    Then I shoud be redirect to show page
    And I should see "First Name: Jane"
    And I should see "Last Name: Doe"
    And I should see "ID Number: 12345678"
    And I should see "Phone Number: 0707065562"
    And I should see "Pin: 1234"
    And I should see "Balance: 0.0"

Scenario: User unsuccessfully signs up; No first name
    Given I am on the signup page
    When I fill in "First name" with ""
    And I fill in "Last name" with "Doe"
    And I fill in "Id number" with "12345678"
    And I fill in "Phone number" with "0707065562"
    And I fill in "Password" with "Stronger*than123Usual"
    And I fill in "Password confirmation" with "Stronger*than123Usual"
    And I click Create Account
    Then I should see "First name can't be blank"

Scenario: User unsuccessfully signs up; Invalid first name
    Given I am on the signup page
    When I fill in "First name" with "more than the possible thirty characters"
    And I fill in "Last name" with "Doe"
    And I fill in "Id number" with "12345678"
    And I fill in "Phone number" with "0707065562"
    And I fill in "Password" with "Stronger*than123Usual"
    And I fill in "Password confirmation" with "Stronger*than123Usual"
    And I click Create Account
    Then I should see "First name is too long (maximum is 30 characters)"

Scenario: User unsuccessfully signs up; Invalid first name
    Given I am on the signup page
    When I fill in "First name" with "Jane4332!@#"
    And I fill in "Last name" with "Doe"
    And I fill in "Id number" with "12345678"
    And I fill in "Phone number" with "0707065562"
    And I fill in "Password" with "Stronger*than123Usual"
    And I fill in "Password confirmation" with "Stronger*than123Usual"
    And I click Create Account
    Then I should see "First name kindly input only letters"

Scenario: User unsuccessfully signs up; No last name
    Given I am on the signup page
    When I fill in "First name" with "Jane"
    And I fill in "Last name" with ""
    And I fill in "Id number" with "12345678"
    And I fill in "Phone number" with "0707065562"
    And I fill in "Password" with "Stronger*than123Usual"
    And I fill in "Password confirmation" with "Stronger*than123Usual"
    And I click Create Account
    Then I should see "Last name can't be blank"

Scenario: User unsuccessfully signs up; Invalid last name
    Given I am on the signup page
    When I fill in "First name" with "Jane"
    And I fill in "Last name" with "more than the possible thirty characters"
    And I fill in "Id number" with "12345678"
    And I fill in "Phone number" with "0707065562"
    And I fill in "Password" with "Stronger*than123Usual"
    And I fill in "Password confirmation" with "Stronger*than123Usual"
    And I click Create Account
    Then I should see "Last name is too long (maximum is 30 characters)"

Scenario: User unsuccessfully signs up; No phone number
    Given I am on the signup page
    When I fill in "First name" with "Jane"
    And I fill in "Last name" with "Doe"
    And I fill in "Id number" with "12345678"
    And I fill in "Phone number" with ""
    And I fill in "Password" with "Stronger*than123Usual"
    And I fill in "Password confirmation" with "Stronger*than123Usual"
    And I click Create Account
    Then I should see "Phone number can't be blank"  

Scenario: User unsuccessfully signs up; Existing phone number
    Given User with phone_number "00000000000" exists
    Given I am on the signup page
    When I fill in "First name" with "Jane"
    And I fill in "Last name" with "Doe"
    And I fill in "Id number" with "12345678"
    And I fill in "Phone number" with "00000000000"
    And I fill in "Password" with "Stronger*than123Usual"
    And I fill in "Password confirmation" with "Stronger*than123Usual"
    And I click Create Account
    Then I should see "Phone number has already been taken"  

Scenario: User unsuccessfully signs up; Invalid phone number
    Given I am on the signup page
    When I fill in "First name" with "Jane"
    And I fill in "Last name" with "Doe"
    And I fill in "Id number" with "12345678"
    And I fill in "Phone number" with "070000rfrwd0"
    And I fill in "Password" with "Stronger*than123Usual"
    And I fill in "Password confirmation" with "Stronger*than123Usual"
    And I click Create Account
    Then I should see "Phone number is not a number"

Scenario: User unsuccessfully signs up; Phone number too short
    Given I am on the signup page
    When I fill in "First name" with "Jane"
    And I fill in "Last name" with "Doe"
    And I fill in "Id number" with "12345678"
    And I fill in "Phone number" with "0700000"
    And I fill in "Password" with "Stronger*than123Usual"
    And I fill in "Password confirmation" with "Stronger*than123Usual"
    And I click Create Account
    Then I should see "Phone number is too short (minimum is 10 characters)"



Scenario: User unsuccessfully signs up; Phone number too long
    Given I am on the signup page
    When I fill in "First name" with "Jane"
    And I fill in "Last name" with "Doe"
    And I fill in "Id number" with "12345678"
    And I fill in "Phone number" with "0707065562000000"
    And I fill in "Password" with "Stronger*than123Usual"
    And I fill in "Password confirmation" with "Stronger*than123Usual"
    And I click Create Account
    Then I should see "Phone number is too long (maximum is 13 characters)"



Scenario: User unsuccessfully signs up; Id number already exists
    Given User with id_number "00000000" exists
    Given I am on the signup page
    When I fill in "First name" with "Jane"
    And I fill in "Last name" with "Doe"
    And I fill in "Id number" with "00000000"
    And I fill in "Phone number" with "0707065562"
    And I fill in "Password" with "Stronger*than123Usual"
    And I fill in "Password confirmation" with "Stronger*than123Usual"
    And I click Create Account
    Then I should see "Id number has already been taken"

Scenario: User unsuccessfully signs up; Invalid Id number
    Given I am on the signup page
    When I fill in "First name" with "Jane"
    And I fill in "Last name" with "Doe"
    And I fill in "Id number" with "123j5678"
    And I fill in "Phone number" with "070000rfrwd0"
    And I fill in "Password" with "Stronger*than123Usual"
    And I fill in "Password confirmation" with "Stronger*than123Usual"
    And I click Create Account
    Then I should see "Id number is not a number"

Scenario: User unsuccessfully signs up; Id number too long
    Given I am on the signup page
    When I fill in "First name" with "Jane"
    And I fill in "Last name" with "Doe"
    And I fill in "Id number" with "12345679878"
    And I fill in "Phone number" with "0707065562000000"
    And I fill in "Password" with "Stronger*than123Usual"
    And I fill in "Password confirmation" with "Stronger*than123Usual"
    And I click Create Account
    Then I should see "Id number is too long (maximum is 9 characters)"

Scenario: User unsuccessfully signs up; Id number too short
    Given I am on the signup page
    When I fill in "First name" with "Jane"
    And I fill in "Last name" with "Doe"
    And I fill in "Id number" with "123458"
    And I fill in "Phone number" with "0707065562000000"
    And I fill in "Password" with "Stronger*than123Usual"
    And I fill in "Password confirmation" with "Stronger*than123Usual"
    And I click Create Account
    Then I should see "Id number is too short (minimum is 7 characters)"

Scenario: User unsuccessfully signs up; Invalid password
    Given I am on the signup page
    When I fill in "First name" with "Jane"
    And I fill in "Last name" with "Doe"
    And I fill in "Id number" with "12345678"
    And I fill in "Phone number" with "0707065000"
    And I fill in "Password" with "Stronger*thanUsual"
    And I fill in "Password confirmation" with "Stronger*thanUsual"
    And I click Create Account
    Then I should see "please input a stronger password"


Scenario: User unsuccessfully signs up; password confirmation
    Given I am on the signup page
    When I fill in "First name" with "Jane"
    And I fill in "Last name" with "Doe"
    And I fill in "Id number" with "12345678"
    And I fill in "Phone number" with "07072000000"
    And I fill in "Password" with "Stronger*than123sual"
    And I fill in "Password confirmation" with "Stronger*than123Usual"
    And I click Create Account
    Then I should see "doesn't match Password"