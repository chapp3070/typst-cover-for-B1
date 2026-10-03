# Typst 表紙テンプレート (東京農工大学 知能情報システム工学科向け)

本リポジトリは、東京農工大学（TUAT）知能情報システム工学科の実験・演習用レポート表紙を **Typst** で作成するためのテンプレートです。

`cover-type` を指定することで、授業や提出形式に応じた表紙レイアウトを簡単に切り替えて利用できます。

---

## 表紙テンプレートの使い分け

特に「プログラミングⅠ演習」などのプログラミング演習科目では、**毎授業で課される演習課題** と **定期的に課される本レポート** で提出フォーマットが異なります。本テンプレートでは以下のように使い分けます。

| 表紙種別 | `cover-type` | 対象・用途 |
| :--- | :--- | :--- | 
| **プログラミング演習課題**<br>(毎回の演習課題 / pre-report) | `"programming-practice"`<br>(エイリアス: `"programming-exercise"`, `"programming-pre-report"`) | 毎回の授業で提出する演習課題・小レポート | 
| **プログラミング定期レポート**<br>(本レポート / periodic report) | `"programming-report"`<br>(エイリアス: `"programming-main-report"`, `"programming-periodic-report"`) | 定期的に課される本格的なレポート課題 | 
| **工学基礎実験レポート** | `"basic-engineering"`<br>(エイリアス: `"basic"`) | 工学基礎実験のレポート | 

---

## インストール（OS別・Git不要）

Typst をインストールした上で、お使いの環境に応じたワンライナーコマンドを実行してください（Git のインストールは不要です）。

### Linux、macOS、WSL

ターミナルで以下のコマンドを実行します：

```bash
curl -fsSL https://raw.githubusercontent.com/chapp3070/typst-cover-for-B1/main/scripts/install.sh | sh
```

### Windows (PowerShell)

PowerShell で以下のコマンドを実行します：

```powershell
iwr https://raw.githubusercontent.com/chapp3070/typst-cover-for-B1/main/scripts/install.ps1 | iex
```

---

## 使い方

インストール後、任意の場所の `.typ` ファイルから `@local/typst-cover-for-B1:0.1.0` として読み込んで利用できます。（本リポジトリ内で直接試す場合は `#import "lib.typ": tuat-report` でも動作します）

### 1. プログラミング定期レポート (`programming-report`) の場合

定期的に課される本レポートで使用します。

```typst
#import "@local/typst-cover-for-B1:0.1.0": tuat-report

#show: tuat-report.with(
  cover-type: "programming-report",
  department: "知能情報システム工学科",
  report-title: "レポート",
  tasks: (
    (num: "1", date: "2026/06/03", summary: ""),
    (num: "2", date: "", summary: ""),
    (num: "3", date: "", summary: ""),
    (num: "4", date: "", summary: ""),
  ),
  submissions: (
    (type: "初", date: "2026/06/03", deadline: "2026/06/8"),
    (type: "再", date: "", deadline: ""),
  ),
  eval-instruction: "",
  subject: "プログラミングⅠ演習",
  teacher: "演習 太郎",
  grade: "1",
  semester: "前期",
  credits: "2",
  theme-number: "第１回レポート課題",
  theme: "（1 約数の出力，2 素数の出力）",
  student-id: "12345678",
  author: "農工 太郎",
)

= 目的
ここからレポート本文を記述します...
```

---

### 2. プログラミング演習課題 (`programming-practice`) の場合

毎授業で提出する演習課題（pre-report / 平常課題）で使用します。

```typst
#import "@local/typst-cover-for-B1:0.1.0": tuat-report

#show: tuat-report.with(
  cover-type: "programming-practice",
  department: "知能情報システム工学科",
  subject: "プログラミングⅠ演習",
  document-type: "演習課題",
  class-name: "A-P2",
  content: "第10回　文字列と文字列操作",
  teacher: "演習 太郎",
  student-id: "12345678",
  author: "農工 太郎",
)

= 課題1
ここから課題の解答やソースコードを記述します...
```

---

### 3. 工学基礎実験レポート (`basic-engineering`) の場合

```typst
#import "@local/typst-cover-for-B1:0.1.0": tuat-report

#show: tuat-report.with(
  cover-type: "basic-engineering",
  department: "知能情報システム工学科",
  report-title: "工学基礎実験レポート",
  experiments: (
    (num: "1", date: "2026/06/19", collaborator: "農工 花子"),
    (num: "2", date: "", collaborator: "小金井 次郎"),
    (num: "3", date: "", collaborator: "府中 三郎"),
    (num: "", date: "", collaborator: "国分寺 四郎"),
  ),
  submissions: (
    (type: "初", date: "2026/06/25", deadline: "2026/06/26"),
    (type: "再", date: "2026/06/29", deadline: "2026/07/03"),
  ),
  class-name: "A-A2",
  group-number: 4,
  theme: "太陽電池実験",
  teacher: "指導 太郎",
  student-id: "12345678",
  author: "農工 太郎",
)

= 目的
ここからレポート本文を記述します...
```

---

