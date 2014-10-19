package App::YAML::Filter::Base;
# ABSTRACT: Base module for App::YAML::Filter
$App::YAML::Filter::Base::VERSION = '0.012';
use strict;
use warnings;
use base 'Import::Base';

sub modules {
    my ( $class, %args ) = @_;
    return (
        strict => [],
        warnings => [],
        feature => [qw( :5.10 )],
    );
}

1;

__END__

=pod

=head1 NAME

App::YAML::Filter::Base - Base module for App::YAML::Filter

=head1 VERSION

version 0.012

=head1 AUTHOR

Doug Bell <preaction@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Doug Bell.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
