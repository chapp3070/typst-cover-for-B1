# Typst 表紙テンプレート (東京農工大学 知能情報システム工学科向け)

本リポジトリは、東京農工大学（TUAT）知能情報システム工学科の実験・演習用レポート表紙を **Typst** で作成するためのテンプレートです。

`cover-type` を指定することで、以下の2種類の表紙レイアウトを簡単に切り替えて利用できます。

1. **Basic Engineering Laboratory** (`basic-engineering`): 「工学基礎実験レポート」用表紙
2. **Programming Practice** (`programming-practice`): 「プログラミング演習課題」用表紙

---

##  インストール（OS別・Git不要）

Typst をインストールした上で、お使いの環境に応じたワンライナーコマンドを実行してください（Git のインストールは不要です）。

###  Linux、macOS、WSL

ターミナルで以下のコマンドを実行します：

```bash
curl -fsSL https://raw.githubusercontent.com/chapp3070/typst-cover-for-B1/main/scripts/install.sh | sh
```

###  Windows (PowerShell)

PowerShell で以下のコマンドを実行します：

```powershell
iwr https://raw.githubusercontent.com/chapp3070/typst-cover-for-B1/main/scripts/install.ps1 | iex
```

---

##  使い方

インストール後、任意の場所の `.typ` ファイルから `@local/typst-cover-for-B1:0.1.0` として読み込んで利用できます。（※本リポジトリ内で直接試す場合は `#import "lib.typ": tuat-report` でも動作します）

### 1. 工学基礎実験レポート (`basic-engineering`) の場合

`example_basic.typ` のように `cover-type: "basic-engineering"` を指定します。

```typst
#import "@local/typst-cover-for-B1:0.1.0": tuat-report

#show: tuat-report.with(
  cover-type: "basic-engineering",
  department: "知能情報システム工学科",
  report-title: "工学基礎実験レポート",
  
  // 実験演習記録（最大4つ）
  experiments: (
    (num: "1", date: "2026/06/19", collaborator: "農工 花子"),
    (num: "2", date: "", collaborator: "小金井 次郎"),
    (num: "3", date: "", collaborator: "府中 三郎"),
    (num: "", date: "", collaborator: "国分寺 四郎"),
  ),
  
  // レポート提出記録
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

### 2. プログラミング演習課題 (`programming-practice`) の場合

`example_programming.typ` のように `cover-type: "programming-practice"` を指定します。

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

## パラメータ一覧

| パラメータ名 | 型 | デフォルト値 | 対象表紙 | 説明 |
| :--- | :--- | :--- | :--- | :--- |
| `cover-type` | string | `"basic-engineering"` | 共通 | `"basic-engineering"` または `"programming-practice"` |
| `department` | string | `"知能情報システム工学科"` | 共通 | 学科名 |
| `class-name` | string | `""` | 共通 | クラス名（例: `A-A2`, `A-P2`） |
| `teacher` | string | `""` | 共通 | 指導教員／担当教員名 |
| `student-id` | string | `""` | 共通 | 学籍番号 |
| `author` | string | `""` | 共通 | 氏名 |
| `report-title` | string | `"工学基礎実験レポート"` | Basic | レポートのタイトル |
| `experiments` | array | `()` | Basic | 実験演習記録 `(num, date, collaborator)` |
| `submissions` | array | `()` | Basic | レポート提出記録 `(type, date, deadline)` |
| `group-number` | string/int | `""` | Basic | 班番号 |
| `theme` | string | `""` | Basic | 実験テーマ名 |
| `eval-instruction`| string | `""` | Basic | 判定・指示欄に記載する初期メモ（空欄可） |
| `subject` | string | `"プログラミングⅠ演習"` | Programming | 科目名 |
| `document-type` | string | `"演習課題"` | Programming | 文書種別 |
| `content` | string | `""` | Programming | 演習内容（回・テーマなど） |

---

## ディレクトリ構成

* `typst.toml`: パッケージ定義マニフェスト（パッケージ名・バージョン・エントリポイント指定）
* `lib.typ`: エントリポイント・統合モジュール
* `covers/basic_engineering.typ`: 工学基礎実験表紙のレイアウト定義
* `covers/programming_practice.typ`: プログラミング演習表紙のレイアウト定義
* `scripts/install.sh`: Linux/macOS/WSL向け自動インストールスクリプト（Git不要）
* `scripts/install.ps1`: Windows PowerShell向け自動インストールスクリプト（Git不要）
* `example_basic.typ`: 工学基礎実験レポートのサンプル
* `example_programming.typ`: プログラミング演習レポートのサンプル
