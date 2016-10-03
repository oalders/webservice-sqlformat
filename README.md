# NAME

WebService::SQLFormat - Format SQL via the sqlformat.org API

[![Build Status](https://travis-ci.org/oalders/webservice-sqlformat.png?branch=master)](https://travis-ci.org/oalders/webservice-sqlformat)

# VERSION

version 0.000007

# SYNOPSIS

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

# DESCRIPTION

BETA BETA BETA.  Subject to change.

This module is a thin wrapper around [https://sqlformat.org](https://sqlformat.org)

# AUTHOR

Olaf Alders <olaf@wundercounter.com>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2016 by Olaf Alders.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
