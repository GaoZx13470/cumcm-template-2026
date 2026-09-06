# CUMCM 2026 论文模板

> 全国大学生数学建模竞赛（CUMCM）LaTeX 论文模板 · 一键生成唯一的彩色 main.pdf

[![LaTeX](https://img.shields.io/badge/LaTeX-XeLaTeX-blue?logo=latex)](https://www.latex-project.org/)
[![License](https://img.shields.io/badge/license-CC%20BY--NC--SA%204.0-green)](./LICENSE)
[![Fonts](https://img.shields.io/badge/fonts-OFL%201.1-orange)](./fonts/README.md)

---

## 📖 项目简介

本仓库提供 **全国大学生数学建模竞赛（CUMCM）** 的 LaTeX 论文模板，针对 2026 年赛制做了字体、版式与构建链的统一：

- **一份源文件，一份 PDF**：`main.tex` 始终生成彩色 `main.pdf`，文件名不带版本后缀。
- **零系统字体依赖**：所有西文、中文、数学与等宽字体均随仓库分发（`fonts/`），不依赖 TeX 系统字体或操作系统字体。
- **统一自动编译**：`build.sh` / `build.bat` 调用 `latexmk`，按需运行 XeLaTeX 与 BibTeX，直到参考文献和交叉引用稳定。
- **模块化正文**：所有章节、附录、参考文献、源代码均按文件拆分，便于版本管理与 AI 协作修改。
- **VSCode / TeXstudio 友好**：内置 `.latexmkrc`；LaTeX Workshop 保存时自动编译，始终更新同一个 `main.pdf`。

可与 [PaperFit](https://github.com/) 视觉排版优化工具链配合使用（视觉验收 + 列空洞检测 + 自动重编译）。

---

## ✨ 主要特性

| 特性 | 说明 |
|---|---|
| 编译器 | **XeLaTeX**（强制，模板含编译期校验） |
| 输出 | 仅生成彩色 `main.pdf` |
| 字号 / 纸张 | 12pt / A4 |
| 章节文件 | `sections/1abstract` … `sections/10Appendix` |
| 参考文献 | `bibtex` + `gbt7714-numeric`（GB/T 7714 顺序编码制） |
| 字体 | Noto Serif/Sans CJK SC、Libertinus Serif/Sans/Math、TeX Gyre Cursor |
| 表格 | `tabularx` + `booktabs`，并提供 `\csvtable{...}{...}{...}` 直接排版 CSV |
| 代码 | `listings` 提供 `Python` 风格；`\lstinputlisting` 一键插入附录源码 |
| 浮动体 | `graphicx` + `subcaption`（子图组合） |
| 数学 | `unicode-math` + `amsmath` + `amsthm`（定理环境） |
| 类选项 | `colorprint`（默认且唯一）、`notoc`（默认）/ `toc`、`draft` |

---

## 📁 目录结构

```
cumcm-template-2026/
├── main.tex              # 论文唯一入口；固定彩色输出 main.pdf
├── cumcmthesis.cls       # 模板类文件（选项、字体、版式、Caption 等）
├── build.sh              # Linux/macOS 一键彩色编译脚本
├── build.bat             # Windows 一键彩色编译脚本
├── .latexmkrc            # latexmk 配置（VSCode LaTeX Workshop 友好）
├── .gitignore            # 忽略 *.aux *.bbl *.log 等编译产物
├── ref.bib               # 论文参考文献 BibTeX 数据库
├── sections/             # 论文分章节源文件
│   ├── 1abstract.tex             # 摘要（含 \keywords）
│   ├── 2ProblemRestatement.tex   # 问题重述
│   ├── 3ProblemAnalysis.tex      # 问题分析
│   ├── 4AssumptionAndSign.tex    # 模型假设 + 符号说明
│   ├── 5MakeModel.tex            # 模型建立与求解（核心，最长）
│   ├── 6ErrorAnalysis.tex        # 误差分析 + 灵敏度
│   ├── 7ModelEvaluation.tex      # 模型评价
│   ├── 8AiDeclaration.tex        # AI 工具使用声明（二选一）
│   ├── 9Reference.tex            # 参考文献
│   └── 10Appendix.tex            # 附录：支撑材料 + 全部源代码
├── bib/
│   └── gbt7714-numeric.bst  # GB/T 7714 顺序编码制 BibTeX 样式
├── figures/               # 论文图片素材（自行放入）
├── code/                  # 论文附录源代码（q1.py / q2.py / q3.py）
├── data/                  # 原始数据 / 中间结果表（CSV）
└── fonts/                 # 模板自带字体（OFL 1.1）
    ├── README.md
    ├── download.sh        # 可选：联网下载字体脚本
    ├── NotoSerifCJKsc-*.otf
    ├── NotoSansCJKsc-*.otf
    ├── LibertinusSerif-*.otf
    ├── LibertinusSans-*.otf
    ├── LibertinusMath-Regular.otf
    └── texgyrecursor-*.otf
```

---

## 🚀 快速开始

### 1. 准备编译环境

需要本机已安装 TeX Live 2023+ 或 MiKTeX 2023+，并满足：

- `xelatex`（必须，模板拒绝其他编译器）
- `bibtex8`（参考文献；TeX Live / MiKTeX 提供）
- `latexmk`（构建脚本、命令行和 VSCode 共用；需可用的 Perl 运行时）

> Windows 用户推荐使用 **MiKTeX**；macOS 推荐 **MacTeX**；Linux 推荐 **TeX Live**。

### 2. 克隆仓库

```bash
git clone https://github.com/<your-account>/cumcm-template-2026.git
cd cumcm-template-2026
```

### 3. 编辑论文内容

打开 `main.tex`，修改：

- `\title{论文标题}`：论文实际标题（显示在摘要页顶部）。
- `sections/1abstract.tex`：摘要正文 + `\keywords{关键词1 \quad 关键词2 ...}`。
- `sections/2` – `sections/7`：按题目顺序填入正文。
- `sections/8AiDeclaration.tex`：保留 AI 声明 / 非 AI 声明二选一。
- `ref.bib`：参考文献条目。
- `figures/`：放入图片素材（`figures/fig1.png` 之类）。
- `code/`：附录源码。

### 4. 一键编译

Linux / macOS：

```bash
./build.sh
```

Windows（双击 `build.bat` 或在 cmd 中执行）：

```bat
build.bat
```

完成后将得到：

```
main.pdf        # 唯一的彩色 PDF
```

---

## 🔨 编译与自动编译

所有入口共用 `.latexmkrc`，仅以 `main.tex` 为入口，输出到项目根目录的 `main.pdf`：

- **Windows**：双击 `build.bat`，或在终端运行它。
- **Linux / macOS**：运行 `./build.sh`。
- **命令行**：在项目根目录运行 `latexmk` 或 `latexmk main.tex`。
- **VSCode**：安装 LaTeX Workshop 后打开项目文件夹；保存论文源文件即自动编译。手动构建也只提供“彩色 PDF (main.pdf)”一个配方。
- **持续监听**：在项目根目录运行 `latexmk -pvc main.tex`，按 `Ctrl+C` 停止。

`latexmk` 按需运行 XeLaTeX、`bibtex8` 及后续 XeLaTeX，直到参考文献、页码与交叉引用稳定。未修改文件时不会重复编译；编译失败会返回非零状态，构建脚本不会误报成功。

`.aux`、`.bbl`、`.log`、`.synctex.gz` 等为辅助文件；最终 PDF 只有 `main.pdf`。需要清理辅助文件时，在项目根目录运行 `latexmk -c`（保留 PDF）。

---

## 🎨 彩色输出

`main.tex` 直接加载彩色模板：

```latex
\documentclass[colorprint, notoc]{cumcmthesis}
```

模板固定保留代码高亮、TikZ 彩色填充和图片原始配色；内部链接与网址使用深蓝色，文献引用使用深红色。`colorprint` 是默认选项，省略后仍输出彩色。

---

## ✍️ 自定义指南

### 修改标题

`main.tex` 中：

```latex
\title{你的论文标题}
```

<!-- ### 修改作者信息

`cumcmthesis.cls` 中由编译选项控制。如需自定义，可在 `main.tex` 的 `\maketitle` 之前：

```latex
\author{队员1 \quad 队员2 \quad 队员3}
\date{\today}
``` -->

### 添加章节

1. 在 `sections/` 下新增 `6xxx.tex`。
2. 在 `main.tex` 中按序 `\input{sections/6xxx}`。

### 排版 CSV 表格

附录提供 `\csvtable` 宏（详见 `sections/10Appendix.tex`）：

```latex
\csvtable{data/示例结果表.csv}{表标题}{tab:label}
```

CSV 必须为 **UTF-8 编码**。

### 源代码放置（Python / Matlab）

附录通过 `\lstinputlisting` 一键插入源代码，目录与命名约定如下：

**目录约定**

- **源代码**：放入 `code/`，按题号命名：
  - Python：`code/q1.py`、`code/q2.py`、`code/q3.py`（题数自定）
  - Matlab：`code/q1.m`、`code/q2.m`、`code/q3.m`
- **辅助模块**：若单文件过长（建议 ≤ 300 行），拆分为 `code/q1_main.py` + `code/q1_utils.py`；Matlab 同理。
- **数据 / 中间结果**：放入 `data/`，与源代码解耦（详见上一节）。

**插入附录**

在 `sections/10Appendix.tex` 中按需添加：

```latex
% 完整插入（适合短代码）
\lstinputlisting[language=Python, caption={问题 1 源代码}, label={lst:q1}]{code/q1.py}

% 节选插入（适合长代码，只展示关键片段）
\lstinputlisting[language=Python, caption={问题 1 关键函数},
                 label={lst:q1-core}, linerange={12-58}]{code/q1.py}
```

Matlab 用户只需把 `language=Python` 改为 `language=Matlab`。

**注意事项**

- 源文件必须为 **UTF-8 编码**（含中文注释）；Python 建议加 `# -*- coding: utf-8 -*-`。
- 单文件建议 ≤ **300 行**；超出请拆分后只展示关键函数。
- 提交前请删除调试用的 `print` 与 `breakpoint()`，以及硬编码的本地路径。

### 替换字体

1. 将新字体文件放入 `fonts/`，文件名需与 `cumcmthesis.cls` 中 `Path`/`UprightFont` 字段保持一致。
2. 修改 `cumcmthesis.cls` 中对应 `\setmainfont` / `\setCJKmainfont` 行。

详见 [`fonts/README.md`](./fonts/README.md)。如需联网下载字体，可执行 `bash fonts/download.sh`。

### 与 PaperFit 协同

仓库已为 PaperFit 视觉排版优化工具预留：

- `data/pages/`、`data/backups/` 已加入 `.gitignore`。
- `.gitignore` 注释中已说明约定。

可在 PaperFit 中执行：

```bash
paperfit render main.pdf --output data/pages --dpi 220
paperfit run scripts/detect_column_void.py data/pages --glob 'page_*.png' \
  -o data/reports/column_void_r1.json
```

---

## ❓ 常见问题

**Q1：编译报 `! LaTeX Error: File 'cumcmthesis.cls' not found`？**
A：必须在仓库根目录执行编译，不要切换到 `sections/` 等子目录。

**Q2：编译报 `请使用 XeLaTeX 编译，而非 pdflatex/latex`？**
A：模板强制 XeLaTeX。请切换编译器，不要使用 pdfLaTeX / LuaLaTeX。

**Q3：参考文献列表为空？**
A：运行 `build.sh` / `build.bat` 或 `latexmk main.tex`，由 latexmk 自动补齐参考文献编译步骤。

**Q4：`bibtex8` 在 Windows 下闪退？**
A：MiKTeX 推荐使用 `bibtex8`；若仍异常，将 `.latexmkrc` 中的 `bibtex8` 替换为 `bibtex`，所有编译入口会同步生效。

**Q5：中文显示为方框或缺失？**
A：检查 `fonts/` 下中文字体是否存在且文件名大小写正确。`cumcmthesis.cls` 默认从 `fonts/` 加载，不依赖系统字体。

**Q6：如何强制重新编译？**

在项目根目录执行，仍然只更新彩色 `main.pdf`：

```bash
latexmk -g main.tex
```

---

## 📜 许可证

本仓库为**多协议共存**结构，三类资产各自适用对应协议：

- **模板源码**（`cumcmthesis.cls`、`*.tex`、`build.sh`、`build.bat`、`.latexmkrc`、本文档等）：[CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/)。允许在**非商业用途**下复制、修改与再分发；派生作品须保留署名并以**相同协议**再分发。
- **字体**（`fonts/*`）：[SIL Open Font License 1.1 (OFL 1.1)](./fonts/README.md)，独立许可，与上方 CC 协议解耦。
- **BibTeX 样式**（`bib/gbt7714-numeric.bst`）：[LPPL 1.3c](https://www.latex-project.org/lppl/lppl-1-3c/)，Copyright (c) [zepinglee](https://github.com/zepinglee/gbt7714-bibtex-style)。**该文件不在 CC BY-NC-SA 4.0 范围内**，如需修改请遵循 LPPL 重命名或备注改动。

详细协议范围见 [`LICENSE`](./LICENSE)。

使用本模板参赛即视为接受上述条款。请勿在论文中声明对模板源码的版权。

---

## 🙏 致谢

- 字体：[Noto CJK](https://github.com/notofonts/noto-cjk) · [Libertinus](https://github.com/alerque/libertinus) · [TeX Gyre](https://www.gust.org.pl/projects/e-foundry/tex-gyre)
- 参考文献样式：[GB/T 7714](https://github.com/zepinglee/gbt7714-bibtex-style)
- 视觉排版优化：[PaperFit](https://github.com/)

---

<p align="center">
  祝各位比赛顺利！
</p>