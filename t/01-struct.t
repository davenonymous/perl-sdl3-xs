use Test2::V0;
use SDL3;


my $object = SDL3::AssertData->new(trigger_count => 42);
isa_ok($object, 'SDL3::AssertData', 'SDL3::Struct');
is($object->trigger_count, 42, 'field set through the constructor');
is($object->trigger_count(7)->trigger_count, 7, 'setter chains and stores');
is(length($object->bytes), $object->sizeof, 'bytes match sizeof');
ok($object->address > 0, 'owned memory has an address');
like(dies { SDL3::AssertData->new(no_such_field => 1) }, qr/no field/, 'unknown field fails loudly');


done_testing;
