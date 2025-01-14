[![Actions Status](https://github.com/lizmat/ValuePair/actions/workflows/linux.yml/badge.svg)](https://github.com/lizmat/ValuePair/actions) [![Actions Status](https://github.com/lizmat/ValuePair/actions/workflows/macos.yml/badge.svg)](https://github.com/lizmat/ValuePair/actions) [![Actions Status](https://github.com/lizmat/ValuePair/actions/workflows/windows.yml/badge.svg)](https://github.com/lizmat/ValuePair/actions)

NAME
====

ValuePair - Provide an immutable Pair value type

SYNOPSIS
========

```raku
use ValuePair;

my $a = ValuePair.new("a",42);
my $b = ValuePair.new( key => "a", value => 42);
my $c = ValuePair.new( (a => 42) );

set($a, $b, $c);  # elems == 1
```

DESCRIPTION
===========

Raku provides a semi-immutable `Pair` datatype, where the value of a `Pair` object can be a container, and thus mutable. Therefore, a standard `Pair` object is **not** a value type.

The `ValuePair` class provided by this module, is a subclass of `Pair`, and does not allow a mutable value. And thus it can be a value type.

The `.new` method either accepts two positional arguments (key and value), or `key` and `value` named arguments, or an existing `Pair`.

AUTHOR
======

Elizabeth Mattijsen <liz@raku.rocks>

Source can be located at: https://github.com/lizmat/ValuePair . Comments and Pull Requests are welcome.

If you like this module, or what I’m doing more generally, committing to a [small sponsorship](https://github.com/sponsors/lizmat/) would mean a great deal to me!

COPYRIGHT AND LICENSE
=====================

Copyright 2022, 2024, 2025 Elizabeth Mattijsen

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

