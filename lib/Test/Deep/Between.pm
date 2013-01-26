package Test::Deep::Between;
use 5.008_001;
use strict;
use warnings;

our $VERSION = '0.01';

use Test::Deep::Cmp;
use Exporter::Lite;

our @EXPORT = qw(between);

sub between {
    my ($from, $to) = @_;
    __PACKAGE__->new($from, $to);
}

sub init {
    my $self = shift;
    my ($from, $to) = @_;

    $self->{from} = $from;
    $self->{to} = $to;

    $self->{matcher} = sub {
        my $got = shift;
        return $from <= $got && $got <= $to;
    };
}

sub descend {
    my ($self, $got) = @_;
    return $self->{matcher}->($got);
}

sub diagnostics {
    my ($self, $got) = @_;
    return sprintf $got.' is not in '.$self->{from}.' to '.$self->{to}.'.';
}

1;
__END__

=head1 NAME

Test::Deep::Between - Number is the range expected

=head1 VERSION

This document describes Test::Deep::Between version 0.01.

=head1 SYNOPSIS

    use Test::Deep;
    use Test::Deep::Between;

    cmp_deeply $hash_ref, { data => between(0, 100) };

=head1 DESCRIPTION

# TODO

=head1 INTERFACE

=head2 Functions

=head3 C<< between($from, $to) >>

$expected is in $from to $to.

=head1 DEPENDENCIES

Perl 5.8.1 or later.

=head1 BUGS

All complex software has bugs lurking in it, and this module is no
exception. If you find a bug please either email me, or add the bug
to cpan-RT.

=head1 SEE ALSO

L<perl>

=head1 AUTHOR

Makoto Taniwaki E<lt>macopy123@gmail.com E<gt>

=head1 LICENSE AND COPYRIGHT

Copyright (c) 2013, Makoto Taniwaki. All rights reserved.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
