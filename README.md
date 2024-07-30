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

## What does this do

This helper checks gleam code for potential(!) literal division by zero.
It may be 100% fine to run `1 / a` if you know that `a` is never zero.
It may also be fine to run `1 / a` where `a` equals `0` depending on your
requirements.

This checker is for when this is not fine. It allows you to check a code
repository for POTENTIAL literal divison by zero in gleam-land (it does NOT
check Erlang or JS FFI).

## Installation

```sh
gleam add check_maybe_div_by_zero@1
```

## Usage

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

```
jobs:
  test-and-no-div-zero:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: erlef/setup-beam@v1
        with:
          otp-version: "27.0.1"
          gleam-version: "1.3.2"
          rebar3-version: "3"
      - run: gleam deps download
      - run: gleam format --check src test
      - run: gleam test
      - run: gleam run --module check_maybe_div_by_zero -- src
      - run: gleam test --target javascript
      - run: gleam run --module check_maybe_div_by_zero --target javascript -- src
```

## Targets

- Erlang
- NodeJS
- Deno

## Development

```sh
gleam test  # Run the tests
```
