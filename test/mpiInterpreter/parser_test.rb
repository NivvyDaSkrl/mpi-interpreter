require File.expand_path('../test_helper')
require 'pp'

class MpiInterpreter::ParserTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::MpiInterpreter::VERSION
  end

  def test_it_does_something_useful
    parser = MpiInterpreter::Parser.new
    # just run some MPI through and make sure it doesn't explode
    pp parser.parse('{watheader}{with:numfurs,0,{parse:roomlist,{list:rooms,this},{if:{gt:{count:{contents:{&roomlist},Player}},0},{roominfo}{if:{and:{eq:{prop:_locked,{&roomlist}},yes},{eq:{prop:_hidden,{&roomlist}},yes}},,{foreach:person,{contents:{&roomlist},Player},{null:{set:numfurs,{add:{&numfurs},1}}}{furinfowat}}}}}{watfooter}}')
    pp parser.parse('hello')
    pp parser.parse('{hello:What the hell do you think you\'re doing?}Hello!')
    pp parser.parse('{null:{tell:{left:Location,16}{left:Lk,3}{left:Name,16}{left:Role,8}{left:Species,16}{left:Gender,9}{left:Status,10}{nl}{center:,78,-}}}')
  end
end