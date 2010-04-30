Given /^a model "([^\"]*)"$/ do |model_name|
  Given %{I successfully run "ruby script/generate model #{model_name} title:string"}
  And %{I successfully run "rake db:migrate"}
end

Given /^a rails 3 model "([^\"]*)"$/ do |model_name|
  Given %{I successfully run "rails g model #{model_name} title:string"}
  And %{I successfully run "rake db:migrate"}
end