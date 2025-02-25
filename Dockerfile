# Use official Ruby image
FROM ruby:3.3

# Install dependencies
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Set working directory
WORKDIR /app

# Copy Gemfile and Gemfile.lock first (for caching)
COPY Gemfile Gemfile.lock ./

# Install gems
RUN gem install bundler && bundle install

# Copy the rest of the app
COPY . .

# Expose port 3000 for Rails server
EXPOSE 3000

# Default command (can be overridden)
CMD ["rails", "server", "-b", "0.0.0.0"]