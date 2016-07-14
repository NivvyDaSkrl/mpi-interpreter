require 'parslet'

module MpiInterpreter
  class Parser < Parslet::Parser
    # single character rules
    rule(:space)      {match('\s').repeat(1)}
    rule(:space?)     {space.maybe}

    rule(:lcurly)     {str('{') >> space?}
    rule(:rcurly)     {str('}') >> space?}
    rule(:colon)      {str(':') >> space?}
    rule(:comma)      {str(',') >> space?}

    # things
    rule(:integer)    {match['0-9'].repeat(1).as(:int) >> space?}
    rule(:identifier) {match['&'].maybe >> match['a-zA-Z0-9!'].repeat(1) >> space?}
    rule(:dbref)      {match['#'] >> match['0-9'].repeat(1) >> space?}
    rule(:string)     {match['^{},'].repeat(1).as(:string) >> space?}

    # grammar statements
    rule(:arglist)    {expressions.maybe >> (comma >> expressions.maybe).repeat}
    rule(:funcall)    {lcurly >> identifier.as(:funcall) >> (colon >> arglist.as(:arglist)).maybe >> rcurly}
    rule(:literal)    {lcurly >> str('lit') >> colon >> match['^}'].repeat(1).as(:string) >> rcurly}

    rule(:expression) {funcall | integer | string}
    rule(:expressions){expression.repeat(1)}
    root :expressions
  end
end