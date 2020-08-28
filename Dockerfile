FROM ruby:2.5.3
RUN apt-get update -qq && \
    apt-get install -y \
    nodejs \
    postgresql-client

ENV INSTALL_PATH /myapp
RUN mkdir $INSTALL_PATH
WORKDIR $INSTALL_PATH

COPY Gemfile Gemfile.lock "$INSTALL_PATH/"
RUN bundle install
COPY . $INSTALL_PATH 

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]

