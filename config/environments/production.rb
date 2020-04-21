Rails.application.configure do

  config.action_mailer.default_url_options = { host: 'project-practise.herokuapp.com' }
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.default :charset => "utf-8"
  config.action_mailer.smtp_settings = {
    :address => "smtp.gmail.com",
    :port => "587",
    :user_name => "123shashank2019@gmail.com",
    :domain => 'gmail.com',
    :password => "btksortvbbsxozbt",
    :authentication => 'plain',
    :enable_starttls_auto => true
  }
  config.public_file_server.enab
  if ENV['RAILS_LOG_TO_STDOUT'].present?
    logger           = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger = ActiveSupport::TaggedLogging.new(logger)
  end
  config.active_record.dump_schema_after_migration = false
end
