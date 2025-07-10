# Speakerline

[![Build Status](https://travis-ci.org/nodunayo/speakerline.svg?branch=master)](https://travis-ci.org/nodunayo/speakerline)
[![Depfu](https://badges.depfu.com/badges/5515ef52032873777824e0923cd8258f/overview.svg)](https://depfu.com/github/nodunayo/speakerline)

> Showcasing speakers' proposals and timelines in an effort to demystify the CFP process and help new speakers get started

## Contents

* [Where did the idea come from?](#where-did-the-idea-come-from)
* [Goals of Speakerline](#goals-of-speakerline)
* [Using the Speakerline website](#using-the-speakerline-website)
* [Setting up for local development](#setting-up-for-local-development)
  * [Getting started with Ruby and Postgres](#getting-started-with-ruby-and-postgres)
  * [Getting the Rails app running](#getting-the-rails-app-running)
    * [Environment variables](#environment-variables)
    * [Seeding the development database](#seeding-the-development-database)
    * [Starting the Rails server](#starting-the-rails-server)
  * [Running the tests](#running-the-tests)
 * [Setting up with Docker](#setting-up-with-docker)
* [Contributing to Speakerline](#contributing-to-speakerline)
* [Credits](#credits)
* [Copyright](#copyright)

## Where did the idea come from?

[Ruby Central](http://rubycentral.org/) typically run Opportunity Scholarship programmes at their conferences.
This is where people who would not normally attend conferences get a free ticket and get paired with a Guide.
Guides are there to help their Scholars to settle in quickly at the conference, meet new people, and have
someone to help them choose which talks to go to. A high proportion of Guides tend to be conference speakers.

For RailsConf 2016, I took part in the Opportunity Scholarship programme as a Guide. One day, in the Slack org that had been set up
for us, one of the Scholars asked if any of the speaking Guides would be open to sharing their accepted proposal. What happened next was very interesting:

* Many more Scholars expressed interest in seeing the accepted proposals
* Many Guides were quick to share their accepted proposals
* Many Guides shared multiple proposals — not only the proposal that had been accepted, but many which had been rejected.

This got me thinking: there are a bunch of people who want to see proposals and there are a bunch of people who are keen to share their proposals. Why don't we have a space to do that more easily?

## Goals of Speakerline

At its most basic level, Speakerline is a place where you can see a range of proposals that have been submitted to conferences, and the outcome of those submissions.

As Speakerline develops, hopefully it will:

* highlight what makes a successful proposal
* help to show what doesn't tend to work in a proposal
* show that many good proposals get rejected
  * maybe the proposal didn't suit the conference
  * maybe there were many submissions on the same topic
  * maybe there were so many good proposals that inevitably some good ones had to be rejected
  * maybe the speaker already had one talk accepted at that conference!
* give aspiring conference speakers the confidence to submit to any conference they wish to speak at.

## Using the Speakerline website

* [Explore proposals](http://speakerline.io/speakers)
* [Add a speaker](http://speakerline.io/speakers/new)
* [Add a proposal](http://speakerline.io/proposals/new)

## Setting up for local development

### Getting started with Ruby and Postgres

First, you'll need to install Ruby 3.1.2. I like to use [chruby](https://github.com/postmodern/chruby) and [ruby-install](https://github.com/postmodern/ruby-install) to manage my Ruby versions.

Another popular alternative is using [rbenv](https://github.com/rbenv/rbenv) and [ruby-build](https://github.com/rbenv/ruby-build).

Next, you'll need to have PostgreSQL installed. This can be done on OSX using [Homebrew](http://mxcl.github.io/homebrew/)
or by using [http://postgresapp.com](http://postgresapp.com).

Have a look at these [further instructions for installing Postgres via Homebrew](http://www.mikeball.us/blog/setting-up-postgres-with-homebrew/):

```bash
brew install postgres
```

On Debian-based Linux distributions you can use apt-get to install Postgres:

```bash
sudo apt-get install postgresql postgresql-contrib libpq-dev
```

On Windows, you can use the [Chocolatey package manager](http://chocolatey.org/) to install Postgres:

```bash
choco install postgresql
```

### Getting the Rails app running

Once Ruby and Postgres are installed, we need to install the gems used by the app:

```bash
bundle install
```

Once all the gems are installed, we'll need to create the databases and tables used by the app:

```bash
bin/rails db:create db:migrate
```

#### Configuration

Now we need to set up the application configuration using Rails 8 encrypted credentials.

Currently, the admin endpoint is authenticated using basic access authentication.

The credentials are stored in the `config/credentials` directory. To edit, run:

```bash
bin/rails credentials:edit --environment development
```

To get reCAPTCHA keys, visit [https://www.google.com/recaptcha/admin](https://www.google.com/recaptcha/admin) and choose the 'Register a new site' option. Select 'reCAPTCHA V2' and add 'localhost' to the list of domains.

#### Seeding the development database

To seed the development database with some fake speaker, event, proposal, and submission data, run:

```bash
bin/rails db:setup
```

Be aware: this will overwrite any development data you have previously saved.

#### Starting the Rails server

All we have to do now is start up the Rails server and point our browser to <http://localhost:3000>

```bash
bin/rails s
```

### Running the tests

RSpec and Cucumber are used for [test-driven](https://en.wikipedia.org/wiki/Test-driven_development) and
[behaviour-driven](https://en.wikipedia.org/wiki/Behavior-driven_development) development.

All of the tests can be run with:

```bash
bin/rails spec
```

or to run only the failing (Rspec) examples

```bash
bundle exec rspec --only-failures
```

To set up the test environment, run:

```bash
bin/rails db:test:prepare
```

This will create the test database and populate its schema.

## Setting up with Docker

Alternatively, you can run Speakerline using Docker.

To start the server run:

```
docker-compose up
```

All commands can be run inside the app container, e.g. to run the tests:

```
docker-compose run app bundle exec rspec
```

## Contributing to Speakerline

I'd love any help with this project. Have a look at our [Contributing Guide](CONTRIBUTING.md)
for more information on how you can get involved.

Please note that this project is released with a [Contributor Code of Conduct](CODE_OF_CONDUCT.md). By participating
in this project you agree to abide by its terms.

## Credits

* Thank you to [Andrew Nesbitt](https://twitter.com/teabass) for being patient and answering all of my Open Source questions.
* Thank you to [24 Pull Requests](https://github.com/24pullrequests/24pullrequests). This README was heavily inspired by theirs!

## Copyright

Copyright (c) 2019 Nadia Odunayo. See [LICENSE](https://github.com/nodunayo/speakerline/blob/master/LICENSE) for details.
