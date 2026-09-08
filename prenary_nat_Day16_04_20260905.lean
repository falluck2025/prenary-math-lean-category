import Mathlib

-- Day16-04 自然变换留差
-- 精确态射 f_a(x)=a*x；带留差函子 G(f_a)(x)=a*x+ε；自然变换 η(x)=x+δ
def prenary_mor (a x : ℝ) : ℝ := a * x
def prenary_functor_map (a ε x : ℝ) : ℝ := a * x + ε
def prenary_nat (δ x : ℝ) : ℝ := x + δ

-- 定理1：自然变换退化锚（ε=0 且 δ=0 时自然性精确交换）
theorem nat_degenerate (a x : ℝ) :
    prenary_nat 0 (prenary_mor a x) = prenary_functor_map a 0 (prenary_nat 0 x) := by
  unfold prenary_nat prenary_mor prenary_functor_map
  ring

-- 定理2：自然变换留差 = (a-1)*δ + ε（★自然性条件交换差，两层留差合成）
theorem nat_residue (a ε δ x : ℝ) :
    prenary_functor_map a ε (prenary_nat δ x)
    = prenary_nat δ (prenary_mor a x) + ((a - 1) * δ + ε) := by
  unfold prenary_functor_map prenary_nat prenary_mor
  ring

-- 定理3：恒等自然变换（δ=0）的自然性交换差 = ε（只有函子留差往上传）
theorem nat_id_residue (a ε x : ℝ) :
    prenary_functor_map a ε (prenary_nat 0 x)
    = prenary_nat 0 (prenary_mor a x) + ε := by
  unfold prenary_functor_map prenary_nat prenary_mor
  ring
