require "active_support/all"

module Brewerytown
  module Brewable
    extend ActiveSupport::Concern

    included do
    end

    attr_accessor :current_ingredients

    def add_ingredient(ingredient)
    end

    def is_ready?
    end

    module ClassMethods
      def brew_ingredients(*ingredients)
      end
    end
  end
end
