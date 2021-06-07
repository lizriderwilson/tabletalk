# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (User (as GM) has_many Campaigns) 
- [x] Include at least one belongs_to relationship (A Campaign belongs_to GM)
- [x] Include at least two has_many through relationships (User has_many campaigns_as_player through Characters, Campaign has_many players (users) through Characters, User has_many Seshions through Campaigns)
- [x] Include at least one many-to-many relationship (User has_many campaigns_as_player through Characters, Campaign has_many players (users) through Characters)
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (User has_many campaigns_as_player through Characters; Characters have their own attributes)
- [x] Include reasonable validations for simple model objects (User, Character, Campaign all validate presence of name (or username))
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature (User.gms - users/gms)
- [x] Include signup
- [x] Include login
- [x] Include logout
- [x] Include third party signup/login (Google OAuth 2)
- [x] Include nested resource show or index (campaigns/:id/seshions)
- [x] Include nested resource "new" form (campaigns/:id/seshions/new)
- [x] Include form display of validation errors (/signup, /users/:id/edit, etc)

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate
