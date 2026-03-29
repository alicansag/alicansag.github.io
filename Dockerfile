# Use a standard Ruby image
FROM ruby:3.2-slim

# Install essential Linux packages for building native Ruby gems (like nokogiri)
RUN apt-get update -qq && apt-get install -y build-essential git

# Set the working directory inside the container
WORKDIR /srv/jekyll

# Copy the Gemfile and Gemfile.lock (if it exists)
COPY Gemfile* ./

# Install the gems specified in your Gemfile
RUN bundle install

# The command to run when the container starts
# --host 0.0.0.0 is critical in Docker to expose the server to your host machine
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0", "--livereload"]