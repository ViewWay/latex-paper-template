# LaTeX 学术论文模板

完整的学术论文 LaTeX 模板，支持中英文混排。

## 功能特性

- ✅ 中英文混排支持
- ✅ 图表自动编号和交叉引用
- ✅ 数学公式支持
- ✅ 代码高亮显示
- ✅ 算法伪代码
- ✅ 参考文献管理
- ✅ 术语表和缩写
- ✅ 一键编译脚本

## 快速开始

### 编译方式

#### 方式 1: 使用 Makefile（推荐）

```bash
# 完整编译（含参考文献）
make

# 使用 latexmk 自动编译
make auto

# 持续监视模式（文件改动自动重编译）
make watch

# 清理临时文件
make clean
```

#### 方式 2: 手动编译

```bash
xelatex main.tex
biber main
xelatex main.tex
xelatex main.tex
```

#### 方式 3: 使用 latexmk

```bash
latexmk -xelatex -pdf main.tex
```

## 文件结构

```
.
├── main.tex           # 主文档
├── references.bib     # 参考文献数据库
├── Makefile           # 编译脚本
└── README.md          # 说明文档
```

## 使用说明

### 1. 修改标题和作者

编辑 `main.tex` 文件的标题信息部分：

```latex
\title{你的论文标题}
\author{你的姓名}
```

### 2. 添加参考文献

在 `references.bib` 中添加参考文献：

```bibtex
@article{key,
    author = {作者},
    title = {标题},
    journal = {期刊},
    year = {年份},
}
```

### 3. 插入图片

```latex
\begin{figure}[H]
    \centering
    \includegraphics[width=0.8\textwidth]{figures/image.png}
    \caption{图片说明}
    \label{fig:label}
\end{figure}
```

### 4. 添加表格

```latex
\begin{table}[H]
    \centering
    \begin{tabular}{lccc}
        \toprule
        表头1 & 表头2 & 表头3 \\
        \midrule
        数据1 & 数据2 & 数据3 \\
        \bottomrule
    \end{tabular}
    \caption{表格说明}
    \label{tab:label}
\end{table}
```

### 5. 数学公式

```latex
% 行内公式
$E = mc^2$

% 行间公式
\begin{equation}
    \int_{a}^{b} f(x) dx
    \label{eq:label}
\end{equation}
```

### 6. 代码高亮

```latex
\begin{lstlisting}[language=Python]
def hello():
    print("Hello, World!")
\end{lstlisting}
```

### 7. 算法伪代码

```latex
\begin{algorithm}
    \SetAlgoLined
    \KwIn{输入}
    \KwOut{输出}
    算法步骤\;
    \caption{算法说明}
    \label{algo:label}
\end{algorithm}
```

## 常用交叉引用

```latex
% 引用章节
参见 \cref{sec:section}

% 引用图表
如 \cref{fig:figure} 所示
见 \cref{tab:table}

% 引用公式
根据 \cref{eq:equation}

% 引用算法
算法流程见 \cref{algo:algorithm}

% 引用文献
相关工作~\cite{key}
```

## 编译引擎

- **推荐**: XeLaTeX（中文支持最好）
- 备选: LuaLaTeX
- 不推荐: pdfLaTeX（中文支持需额外配置）

## 常见问题

### Q: 中文显示乱码？
A: 确保使用 XeLaTeX 编译，并安装了中文字体。

### Q: 参考文献不显示？
A: 运行完整编译流程：`xelatex -> biber -> xelatex -> xelatex`

### Q: 图片找不到？
A: 检查图片路径是否正确，支持格式：PDF, PNG, JPG, EPS。

## 扩展功能

### 更换期刊模板

```latex
% IEEE 期刊
\documentclass{IEEEtran}

% ACM 会议
\documentclass{acmart}

% 通用文章
\documentclass{article}
```

### 添加更多包

```latex
% 化学公式
\usepackage{mhchem}

% 音乐符号
\usepackage{musicography}

% 更多...
```

## 参考资源

- [LaTeX 在线编辑器](https://www.overleaf.com/)
- [CTAN 宏包库](https://ctan.org/)
- [TeX Stack Exchange](https://tex.stackexchange.com/)

## 许可证

MIT License
