# lita-gifme

I wrote a Giphy bot a while back and my friends loved it. It sends a search request to Giphy,that displays a completely random response, so you never know exactly what you're going to get. Re-wrote it for Lita so I could switch the bot so something more extensible.

## Installation

Add lita-gifme to your Lita instance's Gemfile:

``` ruby
gem "lita-gifme"
```

## Configuration

Giphy requires an [API key registered to you](https://developers.giphy.com "Giphy Developer Portal"). It's needed so you can do a request for a list of gifs based on the search request. 

Add it to your lita_config file

```
config.handlers.gifme.api_key = ""
```

## Usage

Request:
```
lita gifme kids falling down
```
Potential response from Giphy?:
```
giphy.com/kid_rock_falling_over
```
