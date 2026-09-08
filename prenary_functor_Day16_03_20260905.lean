import Mathlib

-- Day16-03 函子留差
-- 态射 f_a(x)=a*x 由参数 a 编码；函子 F_ε 把态射 f_a 映到带留差 ε 的态射
def prenary_functor_map (a ε x : ℝ) : ℝ := a * x + ε

-- 定理1：函子退化锚（ε=0 时函子精确保复合）
theorem functor_comp_degenerate (a b x : ℝ) :
    prenary_functor_map (a * b) 0 x = prenary_functor_map a 0 (prenary_functor_map b 0 x) := by
  unfold prenary_functor_map
  ring

-- 定理2：函子保复合的精度损失 = a*ε（★函子留差：内层留差被外层斜率 a 放大）
theorem functor_comp_residue (a b ε x : ℝ) :
    prenary_functor_map a ε (prenary_functor_map b ε x)
    = prenary_functor_map (a * b) ε x + (a * ε) := by
  unfold prenary_functor_map
  ring

-- 定理3：函子保恒等的精度损失 = ε（函子把恒等态射 id 映成"偏移 ε 的恒等"）
theorem functor_id_residue (ε x : ℝ) :
    prenary_functor_map 1 ε x = x + ε := by
  unfold prenary_functor_map
  ring
