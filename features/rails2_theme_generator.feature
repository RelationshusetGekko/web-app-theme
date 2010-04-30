Feature: Rails 2 layout generation
  In order to create a great application
  I should be able to generate a layout with Web App Theme
  
  Background:
    Given I am using rvm "1.8.7"
    And I am using rvm gemset "web-app-theme-2.3.5"
    When I successfully run "rails rails-2-app"
    Then it should pass with:
      """
      create  README
      """
    And I cd to "rails-2-app"
    And I symlink this repo to "vendor/plugins/web-app-theme"
    And I have no layouts
    And I have no stylesheets
    
    Scenario: Generate a layout
      When I successfully run "ruby script/generate theme"
      Then the following files should exist:
        | app/views/layouts/application.html.erb |
        | public/stylesheets/web_app_theme.css   |
        | public/stylesheets/web_app_theme_override.css   |
        | public/stylesheets/themes/default/style.css |
        | public/images/web-app-theme/cross.png  |
        | public/images/web-app-theme/key.png  |
        | public/images/web-app-theme/tick.png  |
        | public/images/web-app-theme/application_edit.png  |
  
    Scenario: Generate a layout with a name
      When I successfully run "ruby script/generate theme admin"
      Then the following files should exist:
        | app/views/layouts/admin.html.erb |

    Scenario: Generate a layout choosing a theme
      When I successfully run "ruby script/generate theme --theme='drastic-dark'"
      Then the following files should exist:
        | public/stylesheets/themes/drastic-dark/style.css |
    
    Scenario: Generate only stylesheets without layout
      When I successfully run "ruby script/generate theme --theme='bec' --no-layout"
      Then the following files should exist:
        | public/stylesheets/themes/bec/style.css |
      And the following files should not exist:
        | app/views/layouts/application.html.erb |
    
    Scenario: Generate layout with application name
      When I successfully run "ruby script/generate theme --app_name='AppName'"
      And the following files should exist:
        | app/views/layouts/application.html.erb |
      Then the file "app/views/layouts/application.html.erb" should contain "<title>AppName</title>"
    
    Scenario: Generate layout for signin and signup
      When I successfully run "ruby script/generate theme --type=sign"
      Then the following files should exist:
        | app/views/layouts/sign.html.erb |
  