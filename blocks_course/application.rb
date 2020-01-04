class Application
  attr_accessor :environment

  def initialize
    @environment = :development
  end

  def connect_to_database
    puts "Connecting to #{@environment} database..."
  end

  def handle_request
    puts "Handling #{@environment} request..."
  end

  def write_to_log
    puts "Writing to #{@environment} log file..."
  end

  def in_environment(env)
    last_env = @environment
    @environment = env
    yield
  rescue StandardError => e
    puts e.message
  ensure
    @environment = last_env
    puts "Reset the environment to #{@environment}"
  end
end

app = Application.new

app.in_environment(:production) do
  app.connect_to_database
  app.handle_request
  raise 'Boom!'
  app.write_to_log
end

app.in_environment(:test) do
  app.connect_to_database
  raise 'Boom!'
  app.handle_request
  app.write_to_log
end
