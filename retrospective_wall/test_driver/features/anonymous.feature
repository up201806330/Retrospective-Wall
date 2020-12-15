Feature: Give feedback anonymously
    Scenario: Register the feedback as anonymous
        Given that attendee Manuel is on the "NewBubblePage"
        When they "check" the "IsAnonymousField"
        And they fill out the "TitleField" with "Random text"
        And they fill out the "FeedbackTextField" with "More random text"
        And they tap the "NewBubbleButton"
        Then the app will register the new bubble without the user's information
