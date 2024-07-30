import gleam/float
import gleam/int

pub fn wibble() {
  let assert Error(_) = 1 |> int.divide(0)
  let assert Error(_) = 1 |> int.remainder(0)

  let assert Error(_) = 1.0 |> float.divide(0.0)

  let i0 = 0
  let assert Error(_) = 1 |> int.divide(i0)
  let assert Error(_) = 1 |> int.remainder(i0)

  let f0 = 0.0
  let assert Error(_) = 1.0 |> float.divide(f0)
}
