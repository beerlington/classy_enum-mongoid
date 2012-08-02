require "classy_enum-mongoid/version"
require 'classy_enum'

module Mongoid
  module Document
    included do
      extend ClassyEnum::ActiveRecord
    end
  end
end
