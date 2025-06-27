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
