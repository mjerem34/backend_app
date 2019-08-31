# frozen_string_literal: true

class ApplicationDecorator < SimpleDelegator
  include Rails.application.routes.url_helpers

  def model
    __getobj__
  end
  alias object model

  def helpers
    @helpers ||= ApplicationController.new.view_context
  end
  alias h helpers
end
