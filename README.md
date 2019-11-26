# house-plant
House Plant Manager


This application allows the user to create and store a their house plants by name. Users can add and modify each plant on their account. Users can login using a Github account if they wish.


## Installation

1. Clone down this repository.
2. Run `bundle` to install all the required gem files.
3. Run `rake db:migrate` and `rake db:seed` to set up the database.
4. Run `rails s` from your terminal to get the app running locally.

If you wish to get the Github authentication part working you will need to create a key using Github. From your Github profile, go to settings then onto developer settings. Click new Oauth app. For Authorization callback URL enter https://localhost:3000/auth/github/callback. After set up you will be given key and secret. In the house-plant app, go to config/initializers/omniauth.rb, and paste the ID and Secret into their spots like so:

```
GITHUB_KEY: XXXXXXX
GITHUB_SECRET=XXXXX
```

## Contributing
Bug reports and pull requests are welcome on GitHub at https://github.com/'Cl3arglass'/house-plant. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the Contributor Covenant code of conduct.

## License
The gem is available as open source under the terms of the MIT License.

## Code of Conduct
Everyone interacting in the house-plant project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the code of conduct.
