require File.expand_path('../test_helper')
require 'pp'

class MpiInterpreter::TransformerTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::MpiInterpreter::VERSION
  end

  def test_it_does_something_useful
    parser = MpiInterpreter::Parser.new
    transformer = MpiInterpreter::Transformer.new
    mpi = ' {null:{if:{eq:{prop:_lockable?,here},yes},{clearflags}{store:pageus,_currstatus,here}{otell:The room is now set to Page us to join!,here,#-1},{tell:You can\'t set that flag in public areas.}}}'
    puts mpi
    puts '--------------------'
    ptree = parser.parse(mpi)
    pp ptree
    puts '--------------------'
    transformer.apply(ptree)
    puts ''
    puts ''
    transformer.apply(parser.parse('{watheader}{with:numfurs,0,{parse:roomlist,{list:rooms,this},{if:{gt:{count:{contents:{&roomlist},Player}},0},{roominfo}{if:{and:{eq:{prop:_locked,{&roomlist}},yes},{eq:{prop:_hidden,{&roomlist}},yes}},,{foreach:person,{contents:{&roomlist},Player},{null:{set:numfurs,{add:{&numfurs},1}}}{furinfowat}}}}}{watfooter}}'))
  end
end