// covers/programming_practice.typ
// プログラミング演習（Programming Practice）表紙レイアウト

#let make-programming-practice-cover(
  department: "知能情報システム工学科",
  subject: "プログラミングⅠ演習",
  document-type: "演習課題",
  class-name: "",
  content: "",
  teacher: "",
  student-id: "",
  author: "",
  font: ("Yu Gothic", "Meiryo", "MS Gothic", "BIZ UDPGothic", "Noto Sans CJK JP", "IPAexGothic"),
) = {
  set text(font: font, lang: "ja")

  // 上部タイトルセクション
  align(center)[
    #v(3.5cm)
    #text(size: 20pt, weight: "bold")[#department]
    #v(1.6cm)
    #text(size: 24pt, weight: "bold")[#subject]
    #v(1.4cm)
    #text(size: 20pt, weight: "bold")[#document-type]
  ]

  v(1fr)

  // 下部属性表
  let header-cell(body) = table.cell(
    align: center + horizon,
    [#text(weight: "bold", size: 11pt)[#body]]
  )

  let body-cell(body) = table.cell(
    align: center + horizon,
    [#text(size: 11pt)[#body]]
  )

  align(center, table(
    columns: (1fr, 1.5fr, 1.5fr),
    rows: (2.5em, 3.0em, 2.5em, 3.0em),
    stroke: 0.7pt + black,
    
    // Row 1: クラス / 内容 ヘッダー
    header-cell([クラス]),
    table.cell(colspan: 2, align: center + horizon)[#text(weight: "bold", size: 11pt)[内容]],

    // Row 2: クラス / 内容 値
    body-cell(class-name),
    table.cell(colspan: 2, align: center + horizon)[#text(size: 11pt)[#content]],

    // Row 3: 担当教員 / 学籍番号 / 氏名 ヘッダー
    header-cell([担当教員]),
    header-cell([学籍番号]),
    header-cell([氏名]),

    // Row 4: 担当教員 / 学籍番号 / 氏名 値
    body-cell(teacher),
    body-cell(student-id),
    body-cell(author),
  ))

  v(3.5cm)
}
