import Mathlib

-- Day16-02 第二刀：复合留差 = 链式法则的"留差版"
-- 态射 f(x)=a*x，斜率 a 即导数 f'(x)=a（线性函数导数恒为 a）
def prenary_mor (a ε x : ℝ) : ℝ := a * x + ε
def prenary_id (ε x : ℝ) : ℝ := x + ε

-- 定理1：复合态射斜率 = a*b（链式法则线性版，也是 ε=0 退化锚）
theorem comp_slope (a b x : ℝ) :
    prenary_mor a 0 (prenary_mor b 0 x) = prenary_mor (a * b) 0 x := by
  unfold prenary_mor
  ring

-- 定理2：复合留差 = a*εg + εf（★内层留差 εg 的放大系数 a = 外层斜率 = 外层导数）
theorem comp_residue_slope (a b εf εg x : ℝ) :
    prenary_mor a εf (prenary_mor b εg x) = prenary_mor (a * b) (a * εg + εf) x := by
  unfold prenary_mor
  ring

-- 定理3：恒等态射斜率 = 1（id'(x)=1）
theorem id_slope_one (x : ℝ) : prenary_id 0 x = 1 * x := by
  unfold prenary_id
  ring

-- 定理4：恒等复合留差 = εf + ε（恒等斜率=1 不放大内层留差，故简单相加）
theorem id_comp_residue (a ε εf x : ℝ) :
    prenary_id ε (prenary_mor a εf x) = prenary_mor a (εf + ε) x := by
  unfold prenary_id prenary_mor
  ring
