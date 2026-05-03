# LaTeX 论文编译脚本

# 主要文件
MAIN = main

# 编译工具
LATEX = xelatex
BIBER = biber

# 默认目标
all: $(MAIN).pdf

# 完整编译流程
$(MAIN).pdf: $(MAIN).tex references.bib
	$(LATEX) $(MAIN).tex
	$(BIBER) $(MAIN)
	$(LATEX) $(MAIN).tex
	$(LATEX) $(MAIN).tex

# 快速编译（不含参考文献）
quick:
	$(LATEX) $(MAIN).tex

# 使用 latexmk 自动编译
auto:
	latexmk -xelatex -pdf $(MAIN).tex

# 持续监视模式
watch:
	latexmk -xelatex -pdf -pvc $(MAIN).tex

# 清理临时文件
clean:
	rm -f *.aux *.log *.out *.toc *.lof *.lot *.bbl *.blg *.bcf *.run.xml *.fls *.fdb_latexmk *.synctex.gz

# 深度清理
distclean: clean
	rm -f $(MAIN).pdf

# 查看帮助
help:
	@echo "可用的编译目标："
	@echo "  make all      - 完整编译（含参考文献）"
	@echo "  make quick    - 快速编译"
	@echo "  make auto     - 使用 latexmk 自动编译"
	@echo "  make watch    - 持续监视模式"
	@echo "  make clean    - 清理临时文件"
	@echo "  make distclean - 深度清理（包括 PDF）"

.PHONY: all quick auto watch clean distclean help
