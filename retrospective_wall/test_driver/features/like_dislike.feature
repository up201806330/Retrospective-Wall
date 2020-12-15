Feature: Like or Dislike feedback bubbles
    Scenario: Like feedback bubble
        Given that attendee Manuel is on a bubble's page
        When they tap the "LikeButton"
        Then the app updates the number of likes of the feedback
    
    Scenario: Dislike feedback bubble
        Given that attendee Manuel is on a bubble's page
        When they tap the "DislikeButton"
        Then the app updates the number of dislikes of the feedback