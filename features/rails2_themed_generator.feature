Feature: Theme generation
  In order to create a great application
  I should be able to creare theme after creating a layout
  
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
  
    Scenario: Creating CRUD views with controller path
      Given a model "Post"
      When I successfully run "ruby script/generate themed posts"
      Then the following files should exist:
        | app/views/posts/index.html.erb |
        | app/views/posts/new.html.erb |
        | app/views/posts/show.html.erb |
        | app/views/posts/edit.html.erb |

    Scenario: Creating CRUD views with controller path and model name
      Given a model "Post"
      When I successfully run "ruby script/generate themed items Post"
      Then the following files should exist:
        | app/views/items/index.html.erb |
        | app/views/items/new.html.erb |
        | app/views/items/show.html.erb |
        | app/views/items/edit.html.erb |
  
    Scenario: Creating CRUD views with controller path "admin/items" and model name
      Given a model "Post"
      When I successfully run "ruby script/generate themed admin/items Post"
      Then the following files should exist:
        | app/views/admin/items/index.html.erb |
        | app/views/admin/items/new.html.erb |
        | app/views/admin/items/show.html.erb |
        | app/views/admin/items/edit.html.erb |
  
    Scenario: Creating CRUD views with controller path "admin/gallery_pictures"
      And a model "GalleryPicture"
      When I successfully run "ruby script/generate themed admin/gallery_pictures"
      Then the following files should exist:
        | app/views/admin/gallery_pictures/index.html.erb |
        | app/views/admin/gallery_pictures/new.html.erb |
        | app/views/admin/gallery_pictures/show.html.erb |
        | app/views/admin/gallery_pictures/edit.html.erb |
  
    Scenario: Creating text theme
      When I successfully run "ruby script/generate themed homes --type=text"
      Then the following files should exist:
        | app/views/homes/show.html.erb |
        | app/views/homes/_sidebar.html.erb |