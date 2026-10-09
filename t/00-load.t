use Test2::V0;
use SDL3 ':all';

my @missing = grep { !defined &{"SDL3::$_"} } @SDL3::EXPORT_OK;
is(\@missing, [], 'every exported symbol is defined');
ok(scalar @SDL3::EXPORT_OK > 0, 'something is exported');

my $null = SDL3::Pointer->new(0);
ok($null->is_null, 'null pointer object');
is($null->address, 0, 'address of null pointer');

done_testing;
