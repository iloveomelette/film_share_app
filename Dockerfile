FROM ruby:3.1.0

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    build-essential \
    mariadb-client \
    nodejs \
    vim \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /film_share_app

COPY Gemfile /film_share_app/Gemfile
COPY Gemfile.lock /film_share_app/Gemfile.lock

RUN gem install bundler
RUN bundle install
COPY . /film_share_app

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]