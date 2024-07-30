import check_maybe_div_by_zero
import gleeunit
import gleeunit/should

pub fn main() {
  gleeunit.main()
}

pub fn detection_test() {
  check_maybe_div_by_zero.mods_with_literal_div(in: "test_data")
  |> should.equal(2)
}
