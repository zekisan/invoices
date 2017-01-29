FROM ruby:2.4.0

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev postgresql-client nodejs

RUN mkdir -p /app

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN gem install bundler

RUN bundle install

COPY . ./

EXPOSE 3000

ENTRYPOINT ["bundle", "exec"]

CMD ["rails", "server", "-b", "0.0.0.0"]
