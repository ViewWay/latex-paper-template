# 论文管理架构：本地源码 + GitHub Actions CI/CD

## 可行性评估

### ✅ 优势

1. **版本控制**
   - 完整的修改历史
   - 易于回滚
   - 分支管理
   - 协作编辑

2. **自动化**
   - 推送即编译
   - 自动生成 PDF
   - 发布到 Releases
   - 跨平台兼容

3. **备份安全**
   - 云端存储
   - 多副本
   - 灾难恢复

4. **可复现性**
   - 固定编译环境
   - Docker 镜像
   - 一键复现

### ⚠️ 挑战

1. **编译时间**
   - GitHub Actions: 1-2分钟
   - 本地编译: 1-2秒
   - 解决: 混合模式

2. **中文支持**
   - GitHub Actions 缺少中文字体
   - 解决: 使用 pdfLaTeX 或预装字体

3. **隐私问题**
   - 公开仓库 = 公开研究
   - 解决: 私有仓库（需付费）

4. **实验资源**
   - GitHub Actions 资源有限
   - 大型实验不适用
   - 解决: 仅编译，实验本地运行

## 推荐方案：混合模式

### 本地开发

```bash
# 快速迭代
cd ~/research-paper
make watch  # 实时预览
```

### 云端备份

```bash
# 推送代码
git push origin main

# 自动触发
# - GitHub Actions 编译 PDF
# - 发布到 Releases
# - 生成 DOI（可选）
```

## 实施步骤

### 1. 创建项目结构

```bash
mkdir -p ~/research-paper/{paper,experiments,data}
cd ~/research-paper
git init
```

### 2. 配置 GitHub Actions

创建 `.github/workflows/paper.yml`:

```yaml
name: Build Paper

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  build:
    runs-on: ubuntu-latest
    
    steps:
    - uses: actions/checkout@v4
    
    # 编译 LaTeX
    - name: Compile PDF
      uses: xu-cheng/latex-action@v3
      with:
        root_file: paper/main.tex
        compiler: pdflatex
        
    # 发布 PDF
    - name: Release PDF
      uses: softprops/action-gh-release@v2
      with:
        files: paper/main.pdf
        tag_name: v${{ github.run_number }}
```

### 3. 本地开发脚本

```makefile
# Makefile
PAPER_DIR = paper
EXP_DIR = experiments

all: paper experiment

paper:
	cd $(PAPER_DIR) && make

experiment:
	cd $(EXP_DIR) && python run_all.py

watch:
	cd $(PAPER_DIR) && make watch

clean:
	cd $(PAPER_DIR) && make clean
	cd $(EXP_DIR) && make clean
```

## 工作流示例

### 场景 1：日常写作

```bash
# 1. 本地编辑
vim paper/main.tex

# 2. 本地预览（1-2秒）
make watch

# 3. 推送备份
git add paper/main.tex
git commit -m "update introduction"
git push

# 4. 1-2分钟后，GitHub 自动发布 PDF
# 下载: https://github.com/user/repo/releases
```

### 场景 2：实验 + 论文

```bash
# 1. 运行实验
cd experiments
python experiment.py
# 生成 results/fig1.png

# 2. 更新论文
cd ../paper
# 添加图表
# 引用实验结果

# 3. 一起推送
cd ..
git add experiments/ paper/
git commit -m "add experiment results"
git push

# 4. GitHub Actions:
# - 编译论文（包含实验图表）
# - 自动发布
```

### 场景 3：协作审阅

```bash
# 1. 创建分支
git checkout -b review/feedback

# 2. 修改论文
vim paper/main.tex

# 3. 推送分支
git push origin review/feedback

# 4. GitHub Actions 自动编译分支 PDF
# 5. 创建 Pull Request
# 6. 合并后自动发布到主分支
```

## 高级功能

### 1. 自动 DOI

集成 Zenodo:
```yaml
- name: Create DOI
  uses: zenodo/action_create_doi@v0.1.0
  with:
    zenodo_token: ${{ secrets.ZENODO_TOKEN }}
```

### 2. 自动化测试

```yaml
- name: Run experiments
  run: |
    cd experiments
    python test_all.py
    
- name: Validate references
  run: |
    cd paper
    bibtex-checker references.bib
```

### 3. 生成多版本

```yaml
- name: Build versions
  run: |
    # arXiv 版本
    make arxiv
    
    # 期刊版本
    make journal
    
    # 会议版本
    make conference
```

## 成本对比

| 方案 | 成本 | 说明 |
|------|------|------|
| 完全本地 | $0 | 需要自己备份 |
| 混合模式 | $0 | 推荐 |
| 完全云端 | $0-7/月 | 私有仓库需付费 |

## 总结

**推荐方案：混合模式**

- 本地: LaTeX 源码 + 实验代码
- 云端: GitHub Actions 自动编译
- 优势: 快速迭代 + 自动备份 + 版本控制
- 可行性: ✅ 高度可行

**开始实施：**

1. 创建 GitHub 仓库
2. 配置 GitHub Actions
3. 本地安装 LaTeX + Git
4. 开始写作！

