Feature:    Create feedback bubble
    Scenario: when a meeting has ended and new bubble is clicked
        Given I have "newBubbleButton" and user is logged in
        When I tap the "newBubbleButton" button
        Then I should have "NewBubblePage" on screen

    Scenario: Actually create feedback bubble
        Given that attendee Manuel is on the "NewBubblePage"
        When they choose "Appreciations" from the "CategoriesDropdown"
        And they "uncheck" the "IsAnonymousField"
        And they fill out the "TitleField" with "Food"
        And they fill out the "FeedbackTextField" with "I enjoyed the food"
        And they tap the "NewBubbleButton"
        Then the app uploads the feedback they just wrote