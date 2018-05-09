# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'admin@bpf.farm'
  layout 'mailer'
end
