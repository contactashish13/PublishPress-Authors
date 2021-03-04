Feature: Users deletion
  In order to delete users on different scenarios
  As an admin
  I need to be able to choose what to do with the author terms and content owned by the user before the user is deleted

  Background:
    Given the user "admin_user_deletion" exists with role "administrator"
    And I am logged in as "admin_user_deletion"
    And following users exist
      | user_login | user_role |
      | john       | author    |
      | peter      | author    |
      | mary       | author    |
      | jack       | author    |
      | lucy       | author    |
      | oprah      | author    |
      | patrick    | author    |
      | jonatan    | author    |
      | erick      | author    |
    And I open the users admin page

  Scenario: See correct form when selected one user which has no content and is not an author
    When I click on the Delete row action for the user "john"
    Then I see the text "action=delete" in the current URL
    And I see the user ID for "john" in the deletion list
    And I see the text "john"
    And I see the text "You have specified this user for deletion"
    And I see input button with value "Confirm Deletion"
    But I don't see the text "What should be done with content owned by this user"
    And I don't see the text "Attribute all content to"
    And I don't see element "#delete_option_author_wrapper"

  Scenario: See correct form when selected multiple users which have no content and are not authors
    Given the user "peter" is selected
    And the user "mary" is selected
    When I select and apply the bulk action "delete"
    Then I see the text "action=delete" in the current URL
    And I see the user ID for "peter" in the deletion list
    And I see the user ID for "mary" in the deletion list
    And I see the text "peter"
    And I see the text "mary"
    And I see the text "You have specified these users for deletion"
    And I see input button with value "Confirm Deletion"
    But I don't see the text "What should be done with content owned by these users"
    And I don't see the text "Attribute all content to"
    And I don't see element "#delete_option_author_wrapper"

  Scenario: User is deleted when selected one user which has no content and is not an author
    When I click on the Delete row action for the user "jack"
    And I click on the submit button
    Then I see the text "User deleted"
    And I don't see the text "jack"

  Scenario: Users are deleted when selected multiple users which has no content and are not authors
    Given the user "lucy" is selected
    And the user "oprah" is selected
    When I select and apply the bulk action "delete"
    And I click on the submit button
    Then I see the text "Users deleted"
    And I don't see the text "lucy"
    And I don't see the text "oprah"

  Scenario: See option to delete author or convert to guest author when selected user has no content but is an author
    Given the user "patrick" is selected
    When I click on the Delete row action for the user "patrick"
    Then I see the user ID for "patrick" in the deletion list
    And I see the text "patrick"
    And I see the text "What should be done with the Author term?"
    And I see the text "Delete the author term"
    And I see the text "Convert to a guest author"

  Scenario: See option to delete authors or convert to guest authors when selected users have no content but at least one is an author
    Given the user "jonatan" is selected
    And the user "erick" is selected
    When I select and apply the bulk action "delete"
    Then I see the user ID for "jonatan" in the deletion list
    Then I see the user ID for "erick" in the deletion list
    And I see the text "jonatan"
    And I see the text "erick"
    And I see the text "At least one of those users is an author. What should be done with the author terms"
    And I see the text "Delete the author terms"
    And I see the text "Convert to guest authors"

  Scenario: User and author are deleted when selected the option to delete author for user which has no content but is an author

  Scenario: User but not author is deleted when selected the option to delete author for user which has no content but is an author

  Scenario: Users and authors are deleted when selected the option to delete author for multiple users which have no content but at least one is an author

  Scenario: Users but not authors are deleted when selected the option to delete authors for multiple users which have no content but at least one is an author


