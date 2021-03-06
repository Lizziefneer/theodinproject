Feature: Mark a lesson as complete

  In order to save my progress
  As a curious learner
  I want to mark/unmark a lesson as complete/incomplete

Background: Adding data to the database

  Given a course named 'Introduction to Web Development' exists
  And a section named 'About Web developers' exists
  And the following lessons exist in 'About Web developers' section:
  | lesson_name |
  | What a web developer does |
  | Tools of the trade |
  | Web Development Communities |
  | The Best Web Developers |

@javascript
Scenario: Marking a lesson complete
  Given I am logged in
  And I go to the 'Introduction to Web Development' course
  And no lessons are completed
  When I mark the lesson 'What a web developer does'
  Then my progress should be saved
  
@javascript
Scenario: Marking a lesson incomplete
  Given I am logged in
  And I go to the 'Introduction to Web Development' course
  And the lesson 'What a web developer does' is completed
  When I unmark the lesson 'What a web developer does'
  Then my progress should be declined

@javascript
Scenario: Marking all the lessons complete
  Given I am logged in
  And I go to the 'Introduction to Web Development' course
  When I mark all the lessons as completed
  Then I should see 'Course Completed!' in the progress bar
  When I go back
  Then I should find the course 'Introduction to Web Development' completed