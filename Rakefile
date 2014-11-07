require 'bundler'
Bundler::GemHelper.install_tasks

require 'rspec/core/rake_task'
require 'spree/testing_support/extension_rake'

RSpec::Core::RakeTask.new

task :default do
  if Dir["spec/dummy"].empty?
    Rake::Task[:test_app].invoke
    Dir.chdir("../../")
  end
  Rake::Task[:spec].invoke
end

desc 'Generates a dummy app for testing'
task :test_app do
  ENV['LIB_NAME'] = 'spree_checkout'
  Rake::Task['extension:test_app'].invoke
end

desc 'Generates ember app for production'
task :ember_build do
  Dir.chdir("ember-checkout")
  `ember build --environment production`
  `cp dist/assets/vendor.js ../app/assets/javascripts/spree/frontend/ember_checkout_vendor.js`
  `cp dist/assets/ember-checkout.js ../app/assets/javascripts/spree/frontend/ember_checkout.js`
  `cp dist/assets/vendor.css ../app/assets/stylesheets/spree/frontend/ember_checkout_vendor.css`
  `cp dist/assets/ember-checkout.css ../app/assets/stylesheets/spree/frontend/ember_checkout.css`
end
