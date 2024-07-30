import glance
import gleam/io
import gleam/list
import gleam/string
import simplifile
import argv

pub fn main() -> Nil {
  case argv.load().arguments {
    [path] ->
      run(in: path)
    _ ->
      run(in: "src")
  }
}

pub fn run(in path: String) -> Nil {
  let number_of_matches = mods_with_literal_div(in: path)

  case number_of_matches {
    0 -> halt(0)
    _n -> halt(1)
  }
}

pub fn mods_with_literal_div(in src_dir: String) -> Int {
  let assert Ok(files_in_src_dir) = src_dir |> simplifile.get_files()
  let mods_with_literal_div =
    files_in_src_dir
    |> list.filter(fn(filepath) {
      filepath |> string.ends_with(".gleam") && filepath |> has_mod_literal_div
    })

  case mods_with_literal_div != [] {
    True -> {
      "Warning: Detected potential division by zero in modules:" |> io.println_error

      mods_with_literal_div
      |> string.join("\n")
      |> io.println_error

      mods_with_literal_div |> list.length
    }
    False -> 0
  }
}

pub fn has_mod_literal_div(filepath: String) -> Bool {
  let assert Ok(code) = simplifile.read(from: filepath)
  let assert Ok(parsed) = glance.module(code)
  let parsed_string = parsed |> string.inspect

  parsed_string |> string.contains("DivInt")
  || parsed_string |> string.contains("DivFloat")
  || parsed_string |> string.contains("RemainderInt")
}

@external(erlang, "erlang", "halt")
@external(javascript, "./check_maybe_div_by_zero_ffi.mjs", "halt")
fn halt(a: Int) -> Nil
