package App::YAML::Filter::Test;
{
  $App::YAML::Filter::Test::VERSION = '0.011';
}
# ABSTRACT: Base module for App::YAML::Filter tests

use strict;
use warnings;
use base 'App::YAML::Filter::Base';

sub modules {
    my ( $class, %args ) = @_;
    my @modules = $class->SUPER::modules( %args );
    return (
        @modules,
        FindBin => [ '$Bin' ],
        'Test::Most' => [],
        boolean => [':all'],
    );
}

1;

__END__

=pod

=head1 NAME

App::YAML::Filter::Test - Base module for App::YAML::Filter tests

=head1 VERSION

version 0.011

=head1 AUTHOR

Doug Bell <preaction@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Doug Bell.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
