class LogginLoggerJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    puts "Sidekiq recebeu um login do usuário #{user_id}"
  end
end
