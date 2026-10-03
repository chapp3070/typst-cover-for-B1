// lib.typ
// レポート・演習用表紙統合モジュール

#import "covers/basic_engineering.typ": make-basic-engineering-cover
#import "covers/programming_practice.typ": make-programming-practice-cover
#import "covers/programming_report.typ": make-programming-report-cover

#let tuat-report(
  cover-type: "basic-engineering", // "basic-engineering" | "programming-practice" | "programming-report"
  department: "知能情報システム工学科",
  
  // Basic Engineering 用
  report-title: "",
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

  // Programming Practice（毎回の演習課題: pre-report）用
  subject: "プログラミングⅠ演習",
  document-type: "演習課題",
  content: "",

  // Programming Report（定期レポート: main report）用
  tasks: none,
  theme-number: "",
  grade: "1",
  semester: "前期",
  credits: "2",

  // 共通
  class-name: "",
  teacher: "",
  student-id: "",
  author: "",

  // フォント設定
  font: ("Yu Gothic", "Meiryo", "BIZ UDPGothic", "MS Gothic", "Noto Sans CJK JP", "IPAexGothic"),
  font-gothic: ("Yu Gothic", "Meiryo", "BIZ UDPGothic", "MS Gothic"),
  font-mincho: ("MS Mincho", "Yu Mincho", "BIZ UDPMincho"),
  
  body,
) = {
  // 表紙ページ（余白ゼロで絶対配置により元PDFの直線座標と100%一致させる）
  page(paper: "a4", margin: 0pt)[
    #if cover-type == "basic-engineering" or cover-type == "basic" [
      #make-basic-engineering-cover(
        department: department,
        report-title: if report-title != "" { report-title } else { "工学基礎実験レポート" },
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
    ] else if cover-type in ("programming-practice", "programming-exercise", "programming-pre-report", "programming") [
      #make-programming-practice-cover(
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
    ] else if cover-type in ("programming-report", "programming-main-report", "programming-periodic-report", "title") [
      #let actual-tasks = if tasks != none { tasks } else {
        (
          (num: "1", date: "", summary: ""),
          (num: "2", date: "", summary: ""),
          (num: "3", date: "", summary: ""),
          (num: "4", date: "", summary: ""),
          (num: "", date: "", summary: ""),
          (num: "", date: "", summary: ""),
        )
      }
      #make-programming-report-cover(
        department: department,
        report-title: if report-title != "" { report-title } else { "レポート" },
        tasks: actual-tasks,
        submissions: submissions,
        eval-instruction: eval-instruction,
        subject: subject,
        teacher: teacher,
        grade: grade,
        semester: semester,
        credits: credits,
        theme-number: theme-number,
        theme: theme,
        student-id: student-id,
        author: author,
        font-gothic: font-gothic,
        font-mincho: font-mincho,
      )
    ] else [
      #panic("未知の cover-type です: '" + cover-type + "'.\n利用可能な cover-type:\n- 'programming-practice' (毎授業の演習課題・事前課題)\n- 'programming-report' (定期レポート)\n- 'basic-engineering' (工学基礎実験レポート)")
    ]
  ]

  // 本文の設定
  set page(
    paper: "a4",
    margin: (x: 2cm, y: 2.5cm),
    numbering: "1",
  )
  counter(page).update(1)
  
  set text(font: font, lang: "ja", size: 10.5pt)
  set par(justify: true, leading: 0.8em)

  body
}
