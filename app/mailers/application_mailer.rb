# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'admin@mccloskey.io'
  layout 'mailer'
end
