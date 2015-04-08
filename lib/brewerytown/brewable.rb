require "active_support/all"

module Brewerytown
  module Brewable
    extend ActiveSupport::Concern

    included do
      class_attribute :ingredients
      self.ingredients = []
    end

    attr_accessor :current_ingredients

    def add_ingredient(ingredient)
      @current_ingredients ||= []
      raise "Bad Ingredient" unless self.class.ingredients.include?(ingredient)
      raise "Duplicate" if current_ingredients.include?(ingredient)
      @current_ingredients << ingredient
    end

    def is_ready?
      return @current_ingredients.sort == self.class.ingredients.sort
    end

    module ClassMethods
      def brew_ingredients(*ingredients)
        self.ingredients = ingredients
      end
    end
  end
end
