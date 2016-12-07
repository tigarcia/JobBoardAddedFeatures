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

The feature adds a search bar in the navigation that allows the user to search through the job title or job description for a job.

__app/models/job.rb__

In the job model, added a model method to search.  Make sure to mention sql injection and why the `?` is important

```rb
class Job < ActiveRecord::Base

  def self.search(term)
    # Make sure to discuss 
    term = "%#{term}%"
    where("LOWER(title) LIKE LOWER(?) or LOWER(description) LIKE LOWER(?)", term, term)
  end
end
```

__app/controllers/jobs_controller.rb__

In the jobs controller, modified the index action to handle a query parameter of `search`.  If search is present, then the job results are filtered:

```rb
  def index
    if params[:search]
      @jobs = Job.search(params[:search])
      @title_text = "Results for #{params[:search]}:"
    else
      @jobs = Job.all
      @title_text = "Jobs!!"
    end
  end
```

__app/views/jobs/index.html.erb__

Display the title text from the index action:

```rb
<h2><%= @title_text %></h2>

<% @jobs.each do |job| %>
  <h3><%= job.title %></h3>
  <p><%= job.description %></p>
  <h5><%= link_to "Edit Posting", edit_job_path(job)%></h5>
  <h5><%= link_to 'Delete Posting', job, method: :delete %></h5>
<% end %>
```

__app/views/layouts/application.html.erb__

Adds a form in the nav bar for searching.  Also, a css class was added to make the list items inline.  Notice the method for the form is a get:

```rb
      <ul class="list-inline">
        <li><%= link_to "Home", jobs_path %></li>
        <li>
          <%= form_tag({controller: "jobs", action: "index"}, method: "get") do%>
              <%= text_field_tag(:search, nil, {placeholder: "Search for jobs"}) %>
          <%end%>
        </li>
      </ul>
```

__app/assets/stylesheets/nav.scss__

Applying the `list-inline` style to each list item

```css
.list-inline > li {
  display: inline-block;
  padding: 4px 15px 4px 15px;
}
```
