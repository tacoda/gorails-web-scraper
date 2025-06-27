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
