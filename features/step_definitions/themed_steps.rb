Given /^a model "([^\"]*)"$/ do |model_name|
  Given %{I successfully run "ruby script/generate model #{model_name} title:string"}
  And %{I successfully run "rake db:migrate"}
end