# syntax=docker/dockerfile:1
FROM ruby:3
# add nodejs and yarn dependencies for the frontend
RUN sh -c "$(curl -fsSL https://deb.nodesource.com/setup_lts.x | bash -)"
# install depedencies
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client && npm install -g yarn && yarn set version berry

# make 'docker logs' work
ENV RAILS_LOG_TO_STDOUT=true

ENV INSTALL_PATH /app
WORKDIR $INSTALL_PATH
COPY Gemfile $INSTALL_PATH/Gemfile
COPY Gemfile.lock $INSTALL_PATH/Gemfile.lock
RUN bundle install

# Add a script to be executed every time the container starts.
COPY bin/entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]
