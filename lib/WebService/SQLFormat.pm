package WebService::SQLFormat;

use Moo;

use JSON::MaybeXS qw( decode_json );
use LWP::UserAgent ();
use Module::Runtime qw( use_module );
use Types::Standard qw( Bool InstanceOf Int Str );
use Types::URI qw( Uri );

has debug_level => (
    is      => 'ro',
    isa     => Int,
    default => 0,
);

has identifier_case => (
    is            => 'ro',
    isa           => Str,
    predicate     => '_has_identifier_case',
    documentation => q{'upper', 'lower' or 'capitalize'},
);

has keyword_case => (
    is            => 'ro',
    isa           => Str,
    predicate     => '_has_keyword_case',
    documentation => q{'upper', 'lower' or 'capitalize'},
);

has reindent => (
    is      => 'ro',
    isa     => Bool,
    default => 0,
);

has strip_comments => (
    is      => 'ro',
    isa     => Bool,
    default => 0,
);

has ua => (
    is      => 'ro',
    isa     => InstanceOf ['LWP::UserAgent'],
    lazy    => 1,
    builder => '_build_ua',
);

has url => (
    is      => 'ro',
    isa     => Uri,
    coerce  => 1,
    lazy    => 1,
    default => 'http://sqlformat.org/api/v1/format',
);

sub _build_ua {
    my $self = shift;
    my $ua   = LWP::UserAgent->new;
    return $ua unless $self->debug_level;

    use_module( 'LWP::ConsoleLogger::Easy', 0.000028 );
    LWP::ConsoleLogger::Easy::debug_ua( $ua, $self->debug_level );
    return $ua;
}

sub format_sql {
    my $self = shift;
    my $sql  = shift;

    my $res = $self->ua->post(
        $self->url,
        {
            (
                $self->_has_identifier_case
                ? ( identifier_case => $self->identifier_case )
                : ()
            ),
            (
                $self->_has_keyword_case
                ? ( keyword_case => $self->keyword_case )
                : ()
            ),
            reindent       => $self->reindent,
            sql            => $sql,
            strip_comments => $self->strip_comments,
        }
    );
    return decode_json( $res->decoded_content )->{result};
}

1;
__END__

# ABSTRACT: Format SQL via the sqlformat.org API

=head1 DESCRIPTION

BETA BETA BETA.  Subject to change.

This module is a thin wrapper around L<http://sqlformat.org>

=head1 SYNOPSIS

    use strict;
    use warnings;
    use feature qw( say );

    use WebService::SQLFormat;
    my $formatter = WebService::SQLFormat->new(
        identifier_case => 'upper',
        reindent        => 1,
    );

    my $sql = shift @ARGV;

    say $formatter->format_sql($sql);
