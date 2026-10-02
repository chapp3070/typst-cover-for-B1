// lib.typ
// レポート・演習用表紙統合モジュール

#import "covers/basic_engineering.typ": make-basic-engineering-cover
#import "covers/programming_practice.typ": make-programming-practice-cover

#let tuat-report(
  cover-type: "basic-engineering", // "basic-engineering" (工学基礎実験) | "programming-practice" (プログラミング演習)
  department: "知能情報システム工学科",
  
  // Basic Engineering 用
  report-title: "工学基礎実験レポート",
  experiments: (
    (num: "1", date: "", collaborator: ""),
    (num: "2", date: "", collaborator: ""),
    (num: "3", date: "", collaborator: ""),
    (num: "", date: "", collaborator: ""),
  ),
  submissions: (
    (type: "初", date: "", deadline: ""),
    (type: "再", date: "", deadline: ""),
    (type: "", date: "", deadline: ""),
    (type: "", date: "", deadline: ""),
  ),
  group-number: "",
  theme: "",
  eval-instruction: "",

  // Programming Practice 用
  subject: "プログラミングⅠ演習",
  document-type: "演習課題",
  content: "",

  // 共通
  class-name: "",
  teacher: "",
  student-id: "",
  author: "",

  // フォント設定
  font: ("IPAexGothic", "Harano Aji Gothic", "Yu Gothic", "Meiryo", "MS Gothic", "Hiragino Kaku Gothic ProN"),
  
  body,
) = {
  // ページ基本設定
  set page(
    paper: "a4",
    margin: (x: 2cm, y: 2.5cm),
  )

  // 表紙の選択と表示
  if cover-type == "basic-engineering" or cover-type == "basic" {
    make-basic-engineering-cover(
      department: department,
      report-title: report-title,
      experiments: experiments,
      submissions: submissions,
      class-name: class-name,
      group-number: group-number,
      theme: theme,
      teacher: teacher,
      student-id: student-id,
      author: author,
      eval-instruction: eval-instruction,
      font: font,
    )
  } else if cover-type == "programming-practice" or cover-type == "programming" {
    make-programming-practice-cover(
      department: department,
      subject: subject,
      document-type: document-type,
      class-name: class-name,
      content: content,
      teacher: teacher,
      student-id: student-id,
      author: author,
      font: font,
    )
  } else {
    panic("未知の cover-type です: " + cover-type + " ('basic-engineering' または 'programming-practice' を指定してください)")
  }

  // 本文ページへ移行
  pagebreak()

  // 本文の設定
  set page(
    numbering: "1",
  )
  counter(page).update(1)
  
  set text(font: font, lang: "ja", size: 10.5pt)
  set par(justify: true, leading: 0.8em)

  body
}
