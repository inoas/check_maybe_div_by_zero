# ➗0️⃣❓ Check Maybe Div By Zero for Gleam

[![Downloads](https://img.shields.io/hexpm/dt/check_maybe_div_by_zero)](https://hex.pm/packages/check_maybe_div_by_zero)
[![Erlang-compatible](https://img.shields.io/badge/target-erlang-b83998)](https://www.erlang.org/)
[![JavaScript Compatible](https://img.shields.io/badge/target-javascript-f3e155)](https://en.wikipedia.org/wiki/JavaScript)
[![Hex Docs](https://img.shields.io/badge/hex-docs-ffaff3)](https://hexdocs.pm/check_maybe_div_by_zero/)
[![Package <a href="https://github.com/inoas/check_maybe_div_by_zero/releases"><img src="https://img.shields.io/github/release/inoas/check_maybe_div_by_zero" alt="GitHub release"></a> Version](https://img.shields.io/hexpm/v/check_maybe_div_by_zero)](https://hex.pm/packages/check_maybe_div_by_zero)
[![CI Test](https://github.com/inoas/check_maybe_div_by_zero/actions/workflows/test.yml/badge.svg?branch=main&amp;event=push)](https://github.com/inoas/check_maybe_div_by_zero/actions/workflows/test.yml)
[![License](https://img.shields.io/hexpm/l/check_maybe_div_by_zero)](https://github.com/inoas/check_maybe_div_by_zero/blob/main/LICENCE)
[![Discord](https://img.shields.io/discord/768594524158427167?label=discord%20chat&amp;color=5865F2)](https://discord.gg/Fm8Pwmy)

<br>
<br>

**Gleam does not crash on division by zero.**

In effect any literal division by zero in Gleam returns a `0`. You may opt to
use Gleam stdlib's `int.divide`, `int.modulo`, `int.remainder`, `float.divide`
and `float.modulo` to catch errors instead of assuming `0`.

See following explanations why and what happens:

- <https://tutorial.ponylang.io/gotchas/divide-by-zero.html>
- <https://www.hillelwayne.com/post/divide-by-zero/>

## What does this utility do

This helper checks Gleam code for potential(!) literal division by zero.

1. It may be 100% fine to run `1 / a` if you know that `a` is never zero.
2. It may also be fine to run `1 / a` where `a` equals `0` depending on your
logical requirements.
3. This checker is for when this is not fine. It allows you to check a code
repository for POTENTIAL literal division by zero in Gleam-land (it does NOT
check Erlang or JS FFI).

### Caveats

- No checks in Erlang, Elixir, JavaScript, or TypeScript FFI-land.
- This checker may detect false positives where your business code makes certain
for variable divisors to not be binding to zero.
- It also, so far, does not replace divisor constants but assumes that they are
  variables. PRs are welcome.

## Installation

```sh
gleam add check_maybe_div_by_zero@1
```

## Local usage

It is recommended to add this checker to your CI.

```sh
gleam run --module check_maybe_div_by_zero
# or explicitly define the src dir to check:
gleam run --module check_maybe_div_by_zero -- src
```

Further documentation can be found at <https://hexdocs.pm/check_maybe_div_by_zero>.

## CI Integration

You may run `gleam run --module check_maybe_div_by_zero` which returns `exit(0)`
if no potential division by zero is found, and `exit(1)` if a potential division
by zero is found. It should thus stop the CI in case a division by zero is found.

```yaml
jobs:
  test-and-no-div-zero:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: erlef/setup-beam@v1
        with:
          otp-version: "28.5"
          gleam-version: "1.16.0"
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
- NodeJS / Deno / Bun / etc.

## Development

```sh
gleam test # Run the tests on Erlang
gleam test --target javascript # Run the tests on JavaScript
```
