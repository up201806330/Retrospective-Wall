Feature:    Create feedback bubble
    Scenario: when a meeting has ended and new bubble is clicked
        Given I have "newBubbleButton" and user is logged in
        When I tap the "newBubbleButton" button
        Then I should have "NewBubblePage" on screen