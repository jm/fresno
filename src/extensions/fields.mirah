package org.fresnoframework.extensions.fields

# Add the ability to have fields a la attr_accessor in Ruby
# Implementation based on: http://www.mirah.org/wiki/Macros
#
#   class Robot
#     implements Fields
#
#     field :name, :string
#     field :team, :int
#   end
#   
#   r = Robot.new
#   r.name = "Mr. Awesometron 9000"
#   puts r
#   # => "Mr. Awesometron 9000"
#
interface Fields do
  macro def field(name_node, type)
    name = name_node.string_value

    quote do
      def `name`
        @`name`
      end

      def `"#{name}_set"`(value:`type`)
        @`name` = value
      end
    end
  end
end