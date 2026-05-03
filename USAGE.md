# LaTeX 论文模板使用指南

## 快速开始

### 创建新论文项目

```bash
paper my-new-paper
cd my-new-paper
make watch
```

### 编译论文

```bash
# 完整编译（含参考文献）
make

# 快速编译
make quick

# 自动编译（推荐）
make auto

# 持续监视模式
make watch
```

## VS Code 配置

1. 安装 LaTeX Workshop 插件
2. 打开论文项目文件夹
3. 编辑 .tex 文件时自动编译
4. PDF 预览会自动更新

## Git 工作流

```bash
# 初始化仓库（已完成）
git init

# 添加文件
git add .

# 提交更改
git commit -m "描述你的更改"

# 推送到 GitHub
git remote add origin <your-repo-url>
git push -u origin main
```

## GitHub Actions

推送代码到 GitHub 后，自动编译 PDF：

```bash
git push origin main
```

编译好的 PDF 会自动发布到 GitHub Releases。

## 常用命令

### 字数统计
```bash
tex-helper count
```

### 清理临时文件
```bash
tex-helper clean
# 或
make clean
```

### 检查拼写
```bash
tex-helper spell
```

## 模板结构

```
.
├── main.tex              # 主文档
├── references.bib        # 参考文献
├── Makefile              # 编译脚本
├── README.md             # 说明文档
├── USAGE.md              # 本文档
├── .gitignore            # Git 忽略规则
├── .github/              # GitHub Actions 配置
│   └── workflows/
│       └── compile-pdf.yml
└── figures/              # 图片目录
```

## 中文支持

模板已配置中文字体：
- 宋体 (Songti SC)
- 黑体 (Heiti SC)
- 苹方 (PingFang SC)

使用 XeLaTeX 编译以获得最佳中文支持。

## 参考文献管理

### 使用 Zotero

1. 安装 Zotero: `brew install --cask zotero`
2. 安装 Better BibTeX 插件
3. 在 Zotero 中管理文献
4. 导出为 .bib 格式
5. 放入 references.bib

### 手动管理

在 references.bib 中添加：

```bibtex
@article{key,
    author = {作者},
    title = {标题},
    journal = {期刊},
    year = {年份},
}
```

## 常见问题

### Q: 编译失败？
A: 检查是否使用 XeLaTeX，确保中文字体已安装

### Q: 参考文献不显示？
A: 运行完整编译：`make` 或手动 `xelatex -> biber -> xelatex*2`

### Q: 图片不显示？
A: 确保图片在 figures/ 目录，支持 PDF/PNG/JPG 格式

### Q: Git 追踪了临时文件？
A: 检查 .gitignore 是否正确配置

## 进阶功能

### 多人协作

使用 GitHub + Overleaf：
1. 在 GitHub 创建仓库
2. 导入 Overleaf
3. 双向同步

### 自动化

使用 GitHub Actions 自动编译：
- 推送代码自动生成 PDF
- 发布到 Releases
- 下载最新版本

### 备份

```bash
# 备份到 GitHub
git push origin main

# 备份到其他地方
rsync -av ~/github/latex-paper-template/ ~/backup/papers/
```

## 资源链接

- [LaTeX Workshop 文档](https://github.com/James-Yu/LaTeX-Workshop/wiki)
- [TeX Live 宏包搜索](https://ctan.org/)
- [Overleaf 在线编辑](https://www.overleaf.com/)
- [Zotero 参考管理](https://www.zotero.org/)
