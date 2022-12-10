# Use nqp ops as if we are in the core
use nqp;

class ValuePair is Pair {
    proto method new(|) {*}
    multi method new(Pair:D $pair) { self.Pair::new($pair.key, $pair.value) }
    multi method new( $key,   $value ) { self.Pair::new($key, $value) }
    multi method new(:$key!, :$value!) { self.Pair::new($key, $value) }

    multi method WHICH(ValuePair:D:) {
        nqp::box_s(
          nqp::concat(
            nqp::if(
              nqp::eqaddr(self.WHAT,ValuePair),
              'ValuePair|',
              nqp::concat(self.^name,'|')
            ),
            nqp::sha1(
              nqp::concat(
                self.key.Str,
                nqp::concat(
                  '|',
                  self.value.Str
                )
              )
            )
          ),
          ValueObjAt
        )
    }

    multi method raku(ValuePair:D:) {
        self.^name ~ '.new(' ~ self.key.raku ~ ',' ~ self.value.raku ~ ')'
    }
}

sub EXPORT() {
    CORE::.EXISTS-KEY('ValuePair')
      ?? Map.new
      !! Map.new( (ValuePair => ValuePair) )
}

=begin pod

=head1 NAME

ValuePair - Provide an immutable Pair value type

=head1 SYNOPSIS

=begin code :lang<raku>

use ValuePair;

my $a = ValuePair.new("a",42);
my $b = ValuePair.new( key => "a", value => 42);
my $c = ValuePair.new( (a => 42) );

set($a, $b, $c);  # elems == 1

=end code

=head1 DESCRIPTION

The functionality provided by this module, will most likely be provided
in language level 6.e and higher.  If an implementation of ValuePair
is already available, loading this module becomes a no-op.

Raku provides a semi-immutable C<Pair> datatype, where the value of a Pair
object can be a container, and thus mutable.  Therefore, a standard Pair
is B<not> a value type.  The C<ValuePair> class provided by this module,
is a subclass of C<Pair>, and does not allow a mutable value.  And thus
it can be a value type.

The C<.new> method either accepts two positional arguments (key and value),
or C<key> and C<value> named arguments, or an existing C<Pair>.

=head1 AUTHOR

Elizabeth Mattijsen <liz@raku.rocks>

Source can be located at: https://github.com/lizmat/ValuePair .
Comments and Pull Requests are welcome.

If you like this module, or what I’m doing more generally, committing to a
L<small sponsorship|https://github.com/sponsors/lizmat/>  would mean a great
deal to me!

=head1 COPYRIGHT AND LICENSE

Copyright 2022 Elizabeth Mattijsen

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod

# vim: expandtab shiftwidth=4
