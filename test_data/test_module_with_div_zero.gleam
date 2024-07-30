pub fn wibble() {
  let assert 0 = 1 / 0
  let assert 0 = 1 % 0

  let assert 0.0 = 1.0 /. 0.0

  let i0 = 0
  let assert 0 = 1 / i0
  let assert 0 = 1 % i0

  let f0 = 0.0
  let assert 0.0 = 1.0 /. f0
}
