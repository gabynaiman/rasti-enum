require 'inflecto'
require_relative 'enum/version'

module Rasti
  module Enum

    class Value < String

      def initialize
        super Inflecto.underscore(Inflecto.demodulize(self.class.name)).upcase
      end

    end

    def values
      @values ||= included_classes.map(&:new)
    end

    def [](value)
      values.detect { |e| e == value.to_s } || raise("Invalid value #{value} for #{name}")
    end

    def include?(value)
      values.any? { |e| e == value.to_s }
    end

    private

    def class_constants
      constants.select { |c| const_get(c).is_a? Class }.sort
    end

    def included_classes
      @included_classes ||= class_constants.map { |c| const_get(c) }
    end

  end
end