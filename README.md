# Home Assistant Add-on: Mopidy
[![Donate][donation-badge]](https://www.buymeacoffee.com/calhoward)
[![Donate][paypal-badge]](https://www.paypal.com/donate/?business=JXWQTX6EUJVBU&no_recurring=0&currency_code=USD)

[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20(no%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20with%20Paypal-0070BA?logo=paypal&style=flat&logoColor=white
[repository-badge]: https://img.shields.io/badge/Add%20repository%20to%20my-Home%20Assistant-41BDF5?logo=home-assistant&style=for-the-badge
[repository-url]: https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Fcalhoward%2Fhomeassistant-addons

## About

[Mopidy](https://mopidy.com/) is an extensible music server that plays music from various sources such as Spotify, Tidal, local files, and web radio. It supports a variety of frontends and extensions.

This addon is based on the docker image containing Mopidy and useful plugins for streaming.

## Installation

Installing this add-on is simple and follows the same process as installing any other add-on.

1. Add my add-ons repository to your home assistant instance (in supervisor addons store at top right, or click button below if you have configured my HA)
   
   [![Add repository on my Home Assistant][repository-badge]][repository-url]
2. Install this add-on.
3. Click the `Save` button to store your configuration.
4. Set the add-on options to your preferences
5. Start the add-on.


## Configuration

This add-on requires you to set up Mopidy-specific options like Spotify or Tidal credentials.

Example configuration for Spotify:

```yaml
spotify:
  username: "your_spotify_username"
  password: "your_spotify_password"
```

## Support

Create an issue on Github for help.