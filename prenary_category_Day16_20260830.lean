import Mathlib

/- ================================================================
   偏元数学 · 范畴论 Day16（恒等态射偏移 · 范畴论的偏元手术第一步）
   核心：范畴论的对象不动，态射（箭头）留 ε；恒等态射 id_ε(x)=x+ε 不再是精确恒等。
   这是"ε 平移特殊元素"铁律在范畴论的落地（恒等态射 = 态射的"单位元"，偏移了）。
   注：随机过程（随机 ε）是"随机动作留差"（概念推广），进迷雾储物箱。
   ================================================================ -/

noncomputable section

-- 偏元态射：态射 f 作用后留 ε
noncomputable def prenary_morphism (f : ℝ → ℝ) (x ε : ℝ) : ℝ :=
  f x + ε

-- 偏元恒等态射：id_ε(x) = x + ε（恒等态射留差）
noncomputable def prenary_identity (x ε : ℝ) : ℝ :=
  x + ε

-- 退化：ε=0 → 精确恒等
theorem prenary_identity_degenerate (x : ℝ) :
    prenary_identity x 0 = x := by
  unfold prenary_identity
  rw [add_zero]

-- 非平凡（核心）：偏元恒等态射不是精确恒等（id_ε ≠ id）
theorem prenary_identity_not_exact (x : ℝ) {ε : ℝ} (hε : ε ≠ 0) :
    prenary_identity x ε ≠ x := by
  unfold prenary_identity
  intro h
  have hε0 : ε = 0 := by linarith
  exact hε hε0

-- 复合不精确（核心）：偏元恒等态射复合不保持（id_ε ∘ f ≠ f）
theorem prenary_identity_compose_not_exact (f : ℝ → ℝ) (x : ℝ) {ε : ℝ} (hε : ε ≠ 0) :
    prenary_identity (f x) ε ≠ f x := by
  unfold prenary_identity
  intro h
  have hε0 : ε = 0 := by linarith
  exact hε hε0

end
