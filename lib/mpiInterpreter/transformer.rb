require 'parslet'

module MpiInterpreter
  class Transformer < Parslet::Transform
    rule(int: simple(:x)) {puts 'INT::' + x}
    rule(string: simple(:x)) {puts 'STRING::' + x}
    rule(funcall: simple(:x), arglist: sequence(:y)) {puts 'METHOD::' + x}
    rule(funcall: simple(:x)) {puts 'METHOD::' + x}
  end
end