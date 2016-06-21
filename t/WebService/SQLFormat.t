use strict;
use warnings;

use Test2::Bundle::More;

use WebService::SQLFormat;

my $f = WebService::SQLFormat->new( debug_level => 11, reindent => 1, );
ok( $f, 'formatter compiles' );

ok( $f->url, 'url: ' . $f->url );

my $result = $f->format_sql('selecT * from foo');
use DDP;
diag np $result;

done_testing();
