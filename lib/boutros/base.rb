module Boutros
  class Base
    attr_accessor :attrs

    def self.with_attributes(*attrs)
      attrs.each do |attribute|
        class_eval do
          define_method attribute do
            @attrs[attribute.to_s]
          end
        end
      end
    end

    def self.new_from_array(items, client=nil)
      if items.nil?
        return []
      end

      if items.kind_of? Hash
        if items.values.first.kind_of?(Array)
          return items.values.first.map do |item|
            new(item, client)
          end
        else
          return [new(items.values.first, client)]
        end
      end
    end

    # Initializes a new Base object
    #
    # @param attrs [Hash]
    # @return [Boutros::Base]
    def initialize(attrs={}, client=nil)
      # @attrs = attrs.dup
      @attrs = attrs
      @client = client
      attrs.each do |k,v|
        name = k.match(/^\@/) ? k : "@#{k}"
        instance_variable_set(name, v) unless v.nil?
      end
    end

  end
end