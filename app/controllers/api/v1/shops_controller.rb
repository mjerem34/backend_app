# frozen_string_literal: true

module Api
  module V1
    class ShopsController < ApiController
      def index
        @shops = Shop.all
        render :index
      end
    end
  end
end
