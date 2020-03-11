FROM ruby:2.6.5
WORKDIR /opt/app

COPY Gemfile* ./
RUN gem install bundler:1.17.2
RUN bundle install

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y nodejs
