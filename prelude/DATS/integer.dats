implement SHL_make {x, n} () =
let
  prval [expn: int] pf_exp = EXP2_istot {n} ()
  prval pf_mul = mul_istot {x, expn} ()
  prval () = mul_nat_nat_nat pf_mul
  prval () = EXP2_ispos pf_exp
in (pf_exp, pf_mul) end

implement shl_le {x, n1, n2, y1, y2} (pf1, pf2) =
let
  prval (pf_exp1, pf_mul1) = pf1
  prval (pf_exp2, pf_mul2) = pf2
  prval () = EXP2_monotone (pf_exp1, pf_exp2)
  prval () = mul_nat_nat_nat (mul_distribute (mul_negate2 (pf_mul1), pf_mul2))
in () end

implement SHR_make {x, n} () =
let
  prval [expn: int] (pf_exp: EXP2 (n, expn))  = EXP2_istot {n} ()
  prval () = EXP2_ispos pf_exp
  prval pf_div: [y: nat] DIV (x, expn, y) = divmod_istot {x, expn} ()
  prval () = EXP2_ispos pf_exp
in (pf_exp, pf_div) end
