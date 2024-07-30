# Check Maybe Div By Zero for Gleam

[![Package Version](https://img.shields.io/hexpm/v/check_maybe_div_by_zero)](https://hex.pm/packages/check_maybe_div_by_zero)
[![Hex Docs](https://img.shields.io/badge/hex-docs-ffaff3)](https://hexdocs.pm/check_maybe_div_by_zero/)

Gleam does not crash on division by zero.

In effect any literal division by zero in gleam returns a zero. You may opt to
use the stdlib's `int.divide`, `int.modulo`, `int.remainder`, `float.divide` and
`float.modulo` to catch errors instead of assmuing 0.

See following explanations why and what happens:
- <https://tutorial.ponylang.io/gotchas/divide-by-zero.html>
- <https://www.hillelwayne.com/post/divide-by-zero/>

# Installation

```sh
gleam add check_maybe_div_by_zero@1
```

# Usage

```sh
gleam run --module check_maybe_div_by_zero
# or explicitly define the src dir to check:
gleam run --module check_maybe_div_by_zero -- src
```

Further documentation can be found at <https://hexdocs.pm/check_maybe_div_by_zero>.

## CI Integration

You may run `gleam run --module check_maybe_div_by_zero` which returns `exit(0)`
if no potential division by zero is found, and `exit(1)` if a potential division
by zero is found. It should thus stop the CI in case a divison by zero is found.

## Development

```sh
gleam test  # Run the tests
```
