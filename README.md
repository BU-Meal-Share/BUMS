Binghamton-University-Meal-Share
===

This is the repo for the class project of Binghamton-University-Meal-Share

Setup
----
To get the latest master branch in your C9 workspace:

```sh
$ git clone git@github.com:BU-Meal-Share/BUMS.git
```

To setup the test enviroment in your C9 workspace:

```sh
$ cd BUMS/
$ gem install bundler
$ bundle install --without production
$ bundle exec rake db:migrate
$ rake db:migrate RAILS_ENV=test
```

Running Tests
----

To successfully run Cucumber, ensure you are in the BUMS folder (Note rake db:test:prepare is needed if rspec is ran):

```sh
$ rake db:test:prepare
$ cucumber
```

To successfully run rspec, ensure you are in the BUMS folder (Note: if rake db:test:prepare is run, rspec will need to be ran twice to pass due to Omniauth)

```sh
$ rspec
```

To run the application on Rails:

```sh
$ rails s -p $PORT -b $IP
```

Additional Information
----

To follow our procedure for contributing by creating branchs and pull request:
https://www.agileventures.org/projects/binghamton-university-meal-share/documents/creating-and-pushing-a-branch

Our Production Website that is updated when the Master is Merged:
https://bums.herokuapp.com/
