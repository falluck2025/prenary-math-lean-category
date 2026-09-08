import Mathlib

-- Day16-02 态射留差 + 复合留差
-- 态射 = ℝ 上的缩放 f(x)=a*x，偏元态射留差 f_ε(x)=a*x+ε
def prenary_mor (a ε x : ℝ) : ℝ := a * x + ε

-- 恒等态射偏移 id_ε(x)=x+ε
def prenary_id (ε x : ℝ) : ℝ := x + ε

-- 定理1：态射退化锚（ε=0 回经典缩放 a*x）
theorem mor_degenerate (a x : ℝ) : prenary_mor a 0 x = a * x := by
  unfold prenary_mor
  ring

-- 定理2：恒等态射退化锚（ε=0 回精确恒等 x）
theorem id_degenerate (x : ℝ) : prenary_id 0 x = x := by
  unfold prenary_id
  ring

-- 定理3：复合留差 = a*εg + εf（★核心新发现：内层留差被外层斜率 a 放大）
theorem comp_residue (a b εf εg x : ℝ) :
    prenary_mor a εf (prenary_mor b εg x) = (a * b) * x + (a * εg + εf) := by
  unfold prenary_mor
  ring

-- 定理4：复合退化锚（εf=εg=0 时复合回经典 a*b*x）
theorem comp_degenerate (a b x : ℝ) :
    prenary_mor a 0 (prenary_mor b 0 x) = (a * b) * x := by
  unfold prenary_mor
  ring

-- 定理5：恒等态射复合（外层恒等不放大内层留差，留差 = εf+ε）
theorem id_comp_residue (a ε εf x : ℝ) :
    prenary_id ε (prenary_mor a εf x) = a * x + (εf + ε) := by
  unfold prenary_id prenary_mor
  ring

-- 定理6：结合律保持（三态射复合，留差线性变形后仍结合）
theorem comp_assoc (a b c εf εg εh x : ℝ) :
    prenary_mor a εf (prenary_mor b εg (prenary_mor c εh x))
    = prenary_mor (a * b) (a * εg + εf) (prenary_mor c εh x) := by
  unfold prenary_mor
  ring
