package App::YAML::Filter::Test;
# ABSTRACT: Base module for App::YAML::Filter tests
$App::YAML::Filter::Test::VERSION = '0.012';
use strict;
use warnings;
use base 'App::YAML::Filter::Base';

sub modules {
    my ( $class, %args ) = @_;
    my @modules = $class->SUPER::modules( %args );
    return (
        @modules,
        qw( Test::More Test::Deep Test::Exception Test::Differences ),
        FindBin => [ '$Bin' ],
        boolean => [':all'],
    );
}

1;

__END__

=pod

=head1 NAME

App::YAML::Filter::Test - Base module for App::YAML::Filter tests

=head1 VERSION

version 0.012

=head1 AUTHOR

Doug Bell <preaction@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Doug Bell.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
