#import "lib.typ": tuat-report

#show: tuat-report.with(
  cover-type: "programming-report",
  department: "知能情報システム工学科",
  report-title: "レポート",

  // 課題実施記録
  tasks: (
    (num: "１", date: "2026/06/03", summary: ""),
    (num: "２", date: "", summary: ""),
    (num: "３", date: "", summary: ""),
    (num: "４", date: "", summary: ""),
    (num: "", date: "", summary: ""),
    (num: "", date: "", summary: ""),
  ),

  // レポート提出記録
  submissions: (
    (type: "初", date: "2026/06/03", deadline: "2026/06/8"),
    (type: "再", date: "", deadline: ""),
    (type: "", date: "", deadline: ""),
    (type: "", date: "", deadline: ""),
    (type: "", date: "", deadline: ""),
  ),

  // 判定・指示
  eval-instruction: "",

  // 科目情報
  subject: "プログラミングⅠ演習",
  teacher: "演習 太郎",
  grade: "1",
  semester: "前期",
  credits: "2",

  // テーマ・著者情報
  theme-number: "第１回レポート課題",
  theme: "（1 約数の出力，2 素数の出力）",
  student-id: "12345678",
  author: "農工 太郎",
)

= 目的
本実験では、C言語における反復処理および条件分岐を用いて、約数の出力および素数の判定を行うプログラムを作成する。

= 課題1: 約数の出力
== プログラムの構成
入力された整数 $N$ に対して、$1$ から $N$ までの整数で整除可能かを判定し、約数を列挙する。

== 実行結果
正しく約数が出力されることを確認した。
