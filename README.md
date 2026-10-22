# junior-school-physics

初中物理（Typst）。每个 `.typ` 文档独立成篇，共用根目录下的 `template.typ`
（由 [typst-notes](https://github.com/qiuzhanghua/typst-notes) 统一分发，勿手改）。

## 目录结构

```
template.typ                    文档模板（自动生成，请勿手工修改）
.template.conf                  生成配置：TAG / 公式编号 / 正文字号
sync-template.sh                从 typst-notes 重新生成 template.typ（bash）
sync-template.ps1               同上（Windows PowerShell）
template.yml 的副本见 .github/workflows/template.yml   CI 校验模板是否与源一致
8年级第2章同步小测试.typ          正文文档
assets/                         插图（从原始 Word/扫描件截出的 PNG）
build                           批量编译脚本（Linux / macOS / Git Bash）
build.ps1                       批量编译脚本（Windows PowerShell）
```

## 编译

需要先安装 [Typst](https://typst.app/)（macOS：`brew install typst`；Linux：见
[releases](https://github.com/typst/typst/releases) 或系统包管理器），并确保 `typst` 在 `PATH` 中。

```bash
./build                       # 编译目录下所有 .typ（自动跳过 template.typ）
./build 8年级第2章同步小测试    # 只编译指定文档（可省略 .typ）
./build -o dist               # 输出 PDF 到 dist/
```

PowerShell 下用 `./build.ps1`（参数为 `-Only 8年级第2章同步小测试`、`-OutputDir dist`）。

编译后 PDF 与源文件同目录（`.gitignore` 已忽略 `*.pdf`）。

## 模板同步

`template.typ` 是从 typst-notes 生成的副本，本仓的可变项写在 `.template.conf`：

```
TAG=v1.0.2          # 源仓版本
EQNUM='"(1)"'       # 公式编号格式（Typst 字面量）；none 表示不编号
TEXTSIZE=12pt       # 正文字号，本仓未写，用默认 12pt
```

- 改完 `.template.conf` 后跑 `./sync-template.sh` 重新生成并提交；
- `./sync-template.sh --check` 只校验（不一致时退出码 1，CI 用的就是这个）；
- 不要手工编辑 `template.typ`——CI 会逐字节比对，手改必然变红。

文档内**不要**再写 `#set text(font: ...)`、`#set page(...)`、`#set math.equation(...)`：
页面、字体列表（`New Computer Modern Math` + `Source Han Serif`）、公式编号都由模板统一提供，
单字体覆盖会让中文失去 CJK 回退。

## 字体依赖：思源宋体（Source Han Serif）

模板里正文字体是

```typst
#let text-fonts = ("New Computer Modern Math", "Source Han Serif")
```

缺字体时 Typst 不会报错，而是**静默回退**到系统其他中文字体，版面会变样。检查：

```bash
typst fonts | grep -i "source han serif"     # 列出 Noto Serif CJK 亦可
```

安装：Adobe <https://github.com/adobe-fonts/source-han-serif/releases>
或 Google `Noto Serif CJK SC` <https://github.com/notofonts/noto-cjk/releases>。

## 依赖

- [Typst](https://typst.app/) 0.15.1 实测通过
- 思源宋体（Source Han Serif），缺失时静默回退
- 本仓文档目前不引用任何 `@preview` 包，离线可编译

## 许可

[MIT](LICENSE)
