# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def decorate
    decorator = "#{self.class.name}Decorator".constantize

    decorator.new(self)
  end
end
