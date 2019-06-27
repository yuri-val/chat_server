FROM ruby:2.6.3-alpine

RUN apk update && apk add build-base postgresql-dev tzdata

ARG RAILS_ENV=production
ENV RAILS_ENV="${RAILS_ENV}"

WORKDIR /app

COPY Gemfile* ./
RUN bundle install --without development test

COPY . .

EXPOSE 8000

CMD ["bundle", "exec", "rails", "db:create", "db:migrate", "&&", "puma", "-C", "config/puma.rb"]
