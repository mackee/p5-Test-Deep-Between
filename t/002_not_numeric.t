#!perl -w
use strict;
use Test::Tester;
use Test::More;

use Test::Deep;
use Test::Deep::Between;

my $check_hash = {
    hoge => 'one',
};

check_test(
    sub {
        cmp_deeply $check_hash, {
            hoge => between(0, 10),
        };
    },
    {
        actual_ok => 0,
        diag => '$data->{"hoge"} is not a number.',
    },
    'got is not a number.'
);

done_testing;
