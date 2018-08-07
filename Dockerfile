FROM ruby:2.5.1

# Install apt based dependencies required to run Rails as
# well as RubyGems. As the Ruby image itself is based on a
# Debian image, we use apt-get to install those.
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        build-essential \
        nodejs \
        supervisor \
        inotify-tools \
        postgresql-client


# Configure the main working directory. This is the base
# directory used in any further RUN, COPY, and ENTRYPOINT
# commands.
RUN mkdir -p /app
WORKDIR /app

COPY Rakefile Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install --jobs 20

CMD rm -f /app/tmp/pids/server.pid && rails server -p 3000 -b '0.0.0.0'
