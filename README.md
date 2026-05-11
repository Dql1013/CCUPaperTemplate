# 长春大学本科生毕业论文（设计）LaTeX 模板

非官方的长春大学本科生毕业论文 LaTeX 模板，符合现行格式规范要求。

## ✨ 特性

- 自动生成封面、摘要、目录
- 支持图、表、公式、代码块、子图
- 参考文献自动管理（GB/T 7714-2015）
- 页眉页脚自动处理（罗马/阿拉伯页码）
- 装订线预留
- VS Code + LaTeX Workshop 开箱即用

## 🚀 快速开始

### 环境

- TeX 发行版：[TeX Live](https://tug.org/texlive/) 或 [MiKTeX](https://miktex.org/)
- 编辑器：VS Code + [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) 插件
- 中文字体：Windows 系统自带即可（其他系统参见 [Fonts/README.md](Fonts/README.md)）

### 开始写论文

```bash
# 1. 复制示例文件
cp Example.tex my-thesis.tex

# 2. 编辑 my-thesis.tex，填写个人信息并编写正文

# 3. 编译（三件套）
xelatex my-thesis.tex
bibtex my-thesis
xelatex my-thesis.tex
xelatex my-thesis.tex
```

在 VS Code 中打开此目录，使用 **xelatex → bibtex → xelatex×2** 配方一键编译。

## 📁 文件说明

| 文件 | 说明 |
|------|------|
| `Example.tex` | **主模板文件**，包含完整论文结构和格式示例，请以此为基础编写你的论文 |
| `ccu_thesis.cls` | 文档类文件，定义了封面、页眉页脚、章节标题、图表编号等全部格式规则 |
| `CcuTitle.png` | 长春大学校名图片，用于封面渲染 |
| `gbt7714-2005.bst` | GB/T 7714-2005 参考文献格式定义（旧版国标） |
| `gbt7714-2015.bst` | GB/T 7714-2015 参考文献格式定义（新版国标，推荐） |
| `LICENSE` | MIT 开源许可证 |
| `README.md` | 本文件，项目说明与使用指南 |
| `.gitignore` | Git 忽略规则，排除编译产物（aux/log/pdf 等）和字体文件 |
| `.gitattributes` | Git 属性配置，统一换行符与 diff 规则 |
| `.vscode/settings.json` | VS Code LaTeX Workshop 插件配置，含编译工具链和自动清理规则 |
| `Bibs/mybib.bib` | 示例参考文献库（BibTeX 格式），可替换为你自己的引用 |
| `Figures/1.1.png` | 示例图片，演示 `\includegraphics` 用法 |
| `Figures/README.md` | 图片目录使用说明 |
| `Fonts/README.md` | 中文字体安装说明（字体文件不入 Git） |

## 📐 格式速查

| 项目 | 规范 |
|------|------|
| 纸张 | A4 |
| 正文 | 宋体小四号，英文/数字 Times New Roman |
| 行距 | 固定值 20 磅 |
| 页边距 | 左 3cm，右/上/下 2.5cm |
| 参考文献 | GB/T 7714-2015，至少 15 篇 |

## 📄 许可证

MIT License — 详见 [LICENSE](LICENSE)

## 🙏 致谢

Fork from [latexstudio/CUSTPaperTemp](https://github.com/latexstudio/CUSTPaperTemp)，针对CCU现行毕业要求进行了调整优化。
