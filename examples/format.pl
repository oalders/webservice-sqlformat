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
