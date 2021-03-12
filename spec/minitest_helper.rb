require 'coverage_helper'
require 'minitest/autorun'
require 'minitest/colorin'
require 'pry-nav'
require 'rasti-enum'

module Colors

  extend Rasti::Enum

  module Common
    def red?
      false
    end

    def green?
      false
    end

    def blue?
      false
    end
  end

  class Red < Rasti::Enum::Value
    include Common

    def red?
      true
    end
  end

  class Green < Rasti::Enum::Value
    include Common

    def green?
      true
    end
  end

  class Blue < Rasti::Enum::Value
    include Common

    def blue?
      true
    end
  end

end