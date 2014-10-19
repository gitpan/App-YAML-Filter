package App::YAML::Filter::Marpa;
$App::YAML::Filter::Marpa::VERSION = '0.012';
use App::YAML::Filter::Base;
use boolean qw( :all );
use Marpa::R2;

my $source = <<'...';
:default ::= action => [ name, values ]
lexeme default = latm => 1

    Program         ::= Program Comb Statement | Statement

    Statement       ::= Conditional | Expr

    Conditional     ::= 'if' Expr 'then' Expr
                      | 'if' Expr 'then' Expr 'else' Expr

    Expr            ::= FunctionCall | Hash | Array | Binop | Filter | QuoteString | Number | Word

    Filter          ::= FilterPart+

    FilterPart      ::= '.' | ('.') Word | ('.') '[' Number ']' | ('.') '[]'

    Binop           ::= Expr Op Expr

    FunctionCall    ::= FunctionName | FunctionName Arguments

    Hash            ::= '{' PairList '}'

    PairList        ::= Pair+ separator => Comma

    Array           ::= '[' ExprList ']'

    Arguments       ::= '(' ExprList ')'

    ExprList        ::= Expr+ separator => Comma

    Pair            ::= Key ':' Expr

    Key             ::= Filter | QuoteString | Word

    QuoteString     ::= Quote NonQuote Quote

    Number          ::= Binnum | Hexnum | Octnum | Float

    Binnum          ::= '0b' Bindigits

    Bindigits       ~ [01]+

    Hexnum          ::= '0x' Hexdigits
    Hexdigits       ~ [0-9A-Fa-f]+

    Octnum          ::= '0' Octdigits
    Octdigits       ~ [0-7]+

    Float           ::= Int '.' Decdigits | Int '.' Decdigits 'e' Int

    Int             ::= Decdigits | '-' Decdigits

    Decdigits       ~ [0-9]+

    Word            ~ [\w]+

    Quote           ~ ['"]

    NonQuote        ~ [^'"]+

    FunctionName    ::= 'empty' | 'select' | 'grep' | 'group_by' | 'keys' | 'length' | 'sort'

    Op              ::= 'eq' | 'ne' | '==' | '!=' | '>=' | '>' | '<=' | '<'

    Comb            ::= ',' | '|'

    Comma           ::= ','

:discard ~ whitespace
whitespace ~ [\s]+

...

my $grammar = Marpa::R2::Scanless::G->new({ source => \$source });
my $parser = Marpa::R2::Scanless::R->new({ grammar => $grammar });

sub filter {
    my ( $class, $filter, $doc, $scope ) = @_;
    $parser->read( \$filter );
    my $value = $parser->value;
    use Data::Dumper;
    print Dumper $$value;
    exit;
}

1;

__END__

=pod

=head1 NAME

App::YAML::Filter::Marpa

=head1 VERSION

version 0.012

=head1 AUTHOR

Doug Bell <preaction@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Doug Bell.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
