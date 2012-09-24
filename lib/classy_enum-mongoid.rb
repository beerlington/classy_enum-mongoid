require "classy_enum-mongoid/version"
require 'classy_enum'

module ClassyEnum
  class Base
    class << self
      def demongoize(object)
        build(object)
      end

      def mongoize(object)
        object.to_s
      end

      def evolve(object)
        object.to_s
      end
    end
  end
end

Mongoid::Fields.option :enum do |model, field, value|
  model.classy_enum_attr(field.name, value)
end

module Mongoid
  module ClassyEnum
    extend ActiveSupport::Concern

    module ClassMethods
      def classy_enum_field(attribute, options={})
        self.field(attribute, type: String)
        self.classy_enum_attr(attribute, options)
      end    
    end
  end
end

module Mongoid
  module Document
    include Mongoid::ClassyEnum

    included do
      extend ::ClassyEnum::ActiveRecord      
    end
  end
end