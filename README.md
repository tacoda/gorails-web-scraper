# Web Scraper

# Notes


## Creating the app

```sh
r new gorails-web-scraper
```

## Add Scraper Model

- Add `app/models/scraper.rb`

```sh
r c
```

```ruby
Scraper.text("https://www.adafruit.com/product/5803")
response = _
response.include?("In stock")
reload!
Scraper.text("https://www.adafruit.com/product/5803")
document = _
document.at_css("[itemprop='aviailability']").text
```


## Add Page and Result Models

```sh
r g scaffold Page url check_type selector match_text
r g model Result page:belongs_to success:boolean
r db:migrate
r s
```

- Update root route
- Update form to use a select for the check_type
- Add validation to Page model
- Add run_check! to Page model
- Add Result association to Page model

## Add Scraper UI Controllers & Actions

- Add results to pages show view
- Create a result partial
- Add check resource to routes
- Create checks controller
- Add button on show page to trigger controller action

## Updating the UI

- Install tailwind gem

```sh
bundle add tailwindcss-rails
r tailwindcss:install
bin/dev
```

- Update views with new styling
- Add migration to name urls

```sh
r g migration AddNameToPages name
r db:migrate
```

- Add name to form
- Add name to permitted params in pages controller
- Add validation to page model
- Update records with names
- Add page name to partial
- Grab check and x icon from heroicons and ascii character for chevron as part of these changes
- Adjust view UI, including headers, breadcrumbs, and forms
- Add last result to index page
- Add migration to cache last result (to eliminate N+1)

```sh
r g migration AddLastResultToPages last_result_id:integer
r db:migrate
```

- Add relation to page model
- Add it to the update action
- Update the view
- Update the index action to include the last result
- Backfill the data

```sh
r c
```

```ruby
Page.find_each { |page| page.update(last_result: page.results.order(created_at: :desc).first) }
```
