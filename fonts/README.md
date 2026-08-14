# fonts/ —— CUMCM 2026 模板字体目录

所有字体均按 **SIL Open Font License 1.1 (OFL)** 授权，可自由分发与商用。

## 字体清单

| 字体 | 用途 |
|---|---|
| Noto Serif CJK SC | 中文正文（思源宋体） |
| Noto Sans CJK SC | 中文无衬线（思源黑体，标题/粗体） |
| Libertinus Serif | 西文正文 |
| Libertinus Sans | 西文无衬线 |
| Libertinus Math | 数学公式 |
| TeX Gyre Cursor | 代码/等宽 |

## 来源

| 字体 | 仓库 | 许可证 |
|---|---|---|
| Noto Serif/Sans CJK SC | <https://github.com/notofonts/noto-cjk> | OFL 1.1 |
| Libertinus Serif/Math/Sans | <https://github.com/alerque/libertinus> | OFL 1.1 |
| TeX Gyre Cursor | <https://www.gust.org.pl/projects/e-foundry/tex-gyre> | GUST Font License |

## 自动下载

```bash
cd fonts
bash download.sh
```

## 字体替换

1. 把新字体文件放入 `fonts/`
2. 修改 `cumcmthesis.cls` 中对应的 `Path` / `UprightFont` / `BoldFont` 字段

文件名（含大小写、是否含空格）必须与 `fonts/` 下实际文件完全一致。
