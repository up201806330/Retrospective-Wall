Feature: Seeing list of bubbles of a certain category
    Scenario: Seeing bubbles in their categories
        Given that attendee Manuel is on the "HomePage"
        When they tap the "AppreciationsButton"
        Then they will see all bubbles grouped in that category