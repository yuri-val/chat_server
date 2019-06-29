FROM ruby:2.6.3-alpine

RUN apk update && apk add bash build-base postgresql-dev postgresql-client tzdata

ARG RAILS_ENV=production
ENV RAILS_ENV="${RAILS_ENV}"

WORKDIR /app

COPY Gemfile* ./
COPY entrypoint.sh ./
RUN bundle install --without development test

COPY . .

EXPOSE 8000

CMD ["puma", "-C", "config/puma.rb"]
