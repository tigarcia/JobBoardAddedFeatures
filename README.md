# Job Board++

This application adds features to the [rails bridge job board](http://docs.railsbridge.org/job-board/).  The intended use for the application is to pair with students and work through problems that are not in the curriculum.

## Setup

Run the following commands in the root of your project directory

1. `bundle install`
2. `rake db:migrate`
3. `rails s`
4. `rspec`  - runs tests

## Change Log

The purpose of this section is to detail what has been added on top of the [rails bridge job board application](http://docs.railsbridge.org/job-board/).

This version of job board adds two new features:

1. Searching for jobs
2. Capybara testing

The implementation is detailed in each section below.

### Searching For Jobs

