# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'gallery@example.com'
  layout 'mailer'
end
