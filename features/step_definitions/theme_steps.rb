Given /^I symlink this repo to "([^\"]*)"$/ do |target|
  source = File.expand_path('../../..', __FILE__)
  in_current_dir do
    target = File.expand_path(target)
    FileUtils.ln_s(source, target)
  end
end

Given /^I have no layouts$/ do
  in_current_dir do
    FileUtils.rm_rf("app/views/layouts")
  end
end

Given /^I have no stylesheets$/ do
  in_current_dir do
    FileUtils.rm_rf("public/stylesheets")
  end
end

Then /^I should not have any layouts$/ do
  in_current_dir do
    layouts_count.should == 0
  end
end

Then /^the layout "([^\"]*)" should have "([^\"]*)" as page title$/ do |layout, title|
  layout_title(layout).should == title
end
