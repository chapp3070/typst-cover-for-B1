// covers/programming_report.typ
// プログラミング演習 定期レポート（Programming Practice Periodic Report）表紙レイアウト
// title.pdf 原本に100%一致する精密レイアウト

#let make-programming-report-cover(
  department: "知能情報システム工学科",
  report-title: "レポート",
  tasks: (
    (num: "1", date: "2026/06/03", summary: ""),
    (num: "2", date: "", summary: ""),
    (num: "3", date: "", summary: ""),
    (num: "4", date: "", summary: ""),
    (num: "", date: "", summary: ""),
    (num: "", date: "", summary: ""),
  ),
  submissions: (
    (type: "初", date: "2026/06/03", deadline: "2026/06/8"),
    (type: "再", date: "", deadline: ""),
    (type: "", date: "", deadline: ""),
    (type: "", date: "", deadline: ""),
    (type: "", date: "", deadline: ""),
  ),
  eval-instruction: "",
  subject: "プログラミングⅠ演習",
  teacher: "",
  grade: "1",
  semester: "前期",
  credits: "2",
  theme-number: "第１回レポート課題",
  theme: "（1 約数の出力，2 素数の出力）",
  student-id: "",
  author: "",
  font-gothic: ("MS Gothic", "Yu Gothic", "BIZ UDPGothic", "Meiryo", "Noto Sans CJK JP", "IPAexGothic"),
  font-mincho: ("MS Mincho", "Yu Mincho", "BIZ UDPMincho", "Noto Serif CJK JP", "IPAexMincho"),
) = {
  // ゴシック体ヘッダー用
  let gothic(body, weight: "regular", size: 12pt) = text(font: font-gothic, weight: weight, size: size)[#body]
  // 明朝体データ用
  let mincho(body, size: 10.6pt) = text(font: font-mincho, size: size)[#body]

  // タイトル部（原本座標 Y=63.65pt）
  place(top + center, dy: 63.65pt)[
    #text(font: font-gothic, size: 20pt, weight: "bold")[#department #h(1.2em) #report-title]
  ]

  // タスクリストの6行補完
  let default-tasks = (
    (num: "1", date: "", summary: ""),
    (num: "2", date: "", summary: ""),
    (num: "3", date: "", summary: ""),
    (num: "4", date: "", summary: ""),
    (num: "", date: "", summary: ""),
    (num: "", date: "", summary: ""),
  )
  let task-list = tasks + default-tasks.slice(calc.min(tasks.len(), 6))

  // 提出記録リストの5行補完
  let default-subs = (
    (type: "初", date: "", deadline: ""),
    (type: "再", date: "", deadline: ""),
    (type: "", date: "", deadline: ""),
    (type: "", date: "", deadline: ""),
    (type: "", date: "", deadline: ""),
  )
  let sub-list = submissions + default-subs.slice(calc.min(submissions.len(), 5))

  // 1. 課題実施記録テーブル (dx: 49.83pt, dy: 104.43pt, 幅: 305.67pt, 高さ: 244.25pt)
  place(top + left, dx: 49.83pt, dy: 104.43pt)[
    #table(
      columns: (30.99pt, 121.86pt, 152.82pt),
      rows: (31.20pt, 30.62pt, 30.60pt, 30.40pt, 30.40pt, 30.62pt, 30.40pt, 30.01pt),
      align: center + horizon,
      stroke: (x, y) => {
        let top-s = if y == 0 { 1.4pt + black } else if y == 1 or y == 2 { 0.6pt + black } else if y >= 3 and y <= 6 { (paint: black, thickness: 0.6pt, dash: (1.8pt, 0.6pt)) } else if y == 7 { (paint: black, thickness: 0.6pt, dash: (1.2pt, 0.4pt)) } else { none }
        let bottom-s = if y == 7 { 1.4pt + black } else { none }
        let left-s = if x == 0 { 1.4pt + black } else if y > 0 { 0.6pt + black } else { none }
        let right-s = if x == 2 { 1.4pt + black } else { none }
        (top: top-s, bottom: bottom-s, left: left-s, right: right-s)
      },
      table.cell(colspan: 3)[#gothic("課題実施記録", weight: "bold", size: 14pt)],
      [], [#gothic("年月日")], [#gothic("概要")],
      ..task-list.slice(0, 6).map(it => (
        mincho(it.at("num", default: "")),
        mincho(it.at("date", default: "")),
        mincho(it.at("summary", default: "")),
      )).flatten(),
    )
  ]

  // 2. 判定・指示テーブル (dx: 355.50pt, dy: 104.43pt, 幅: 198.28pt, 高さ: 457.50pt)
  place(top + left, dx: 355.50pt, dy: 104.43pt)[
    #table(
      columns: (198.28pt,),
      rows: (31.20pt, 426.30pt),
      align: (center + horizon, left + top),
      stroke: (x, y) => {
        let top-s = if y == 0 { 1.4pt + black } else { 0.6pt + black }
        let bottom-s = if y == 1 { 1.4pt + black } else { none }
        let right-s = 1.4pt + black
        (top: top-s, bottom: bottom-s, left: none, right: right-s)
      },
      [#gothic("判定・指示", weight: "bold", size: 12pt)],
      [
        #set text(font: font-mincho, size: 10pt)
        #pad(x: 8pt, y: 8pt)[#eval-instruction]
      ],
    )
  ]

  // 3. レポート提出記録テーブル (dx: 49.83pt, dy: 348.68pt, 幅: 305.67pt, 高さ: 213.25pt)
  place(top + left, dx: 49.83pt, dy: 348.68pt)[
    #table(
      columns: (30.99pt, 137.06pt, 137.62pt),
      rows: (31.20pt, 30.42pt, 30.60pt, 30.60pt, 30.40pt, 30.22pt, 29.81pt),
      align: center + horizon,
      stroke: (x, y) => {
        let top-s = if y == 1 or y == 2 { 0.6pt + black } else if y >= 3 and y <= 5 { (paint: black, thickness: 0.6pt, dash: (1.8pt, 0.6pt)) } else { none }
        let bottom-s = if y == 6 { 1.4pt + black } else { none }
        let left-s = if x == 0 { 1.4pt + black } else if y > 0 { 0.6pt + black } else { none }
        let right-s = if x == 2 { 1.4pt + black } else { none }
        (top: top-s, bottom: bottom-s, left: left-s, right: right-s)
      },
      table.cell(colspan: 3)[#gothic("レポート提出記録", weight: "bold", size: 14pt)],
      [], [#gothic("提出年月日")], [#gothic("期限年月日")],
      ..sub-list.slice(0, 5).map(it => (
        mincho(it.at("type", default: "")),
        mincho(it.at("date", default: "")),
        mincho(it.at("deadline", default: "")),
      )).flatten(),
    )
  ]

  // 4. 下部情報1テーブル（科目名、教員、学年、学期、単位） (dx: 49.83pt, dy: 561.93pt, 幅: 503.95pt, 高さ: 76.62pt)
  place(top + left, dx: 49.83pt, dy: 561.93pt)[
    #table(
      columns: (199.05pt, 137.64pt, 52.83pt, 63.80pt, 50.63pt),
      rows: (31.20pt, 45.42pt),
      align: center + horizon,
      stroke: (x, y) => {
        let top-s = if y == 0 { 1.4pt + black } else { 0.6pt + black }
        let bottom-s = if y == 1 { 1.4pt + black } else { none }
        let left-s = if x == 0 { 1.4pt + black } else { 0.6pt + black }
        let right-s = if x == 4 { 1.4pt + black } else { none }
        (top: top-s, bottom: bottom-s, left: left-s, right: right-s)
      },
      [#gothic("科目名")],
      [#gothic("テーマ担当教員")],
      [#gothic("学年")],
      [#gothic("学期")],
      [#gothic("単位")],

      [#mincho(subject, size: 12pt)],
      [#mincho(teacher, size: 14pt)],
      [#mincho(str(grade), size: 16pt)],
      [#mincho(semester, size: 16pt)],
      [#mincho(str(credits), size: 16pt)],
    )
  ]

  // 5. 下部情報2テーブル（テーマ番号・テーマ名、学籍番号・氏名） (dx: 49.83pt, dy: 638.55pt, 幅: 503.95pt, 高さ: 99.23pt)
  place(top + left, dx: 49.83pt, dy: 638.55pt)[
    #table(
      columns: (260.27pt, 243.68pt),
      rows: (31.20pt, 68.03pt),
      align: center + horizon,
      stroke: (x, y) => {
        let top-s = if y == 1 { 0.6pt + black } else { none }
        let bottom-s = if y == 1 { 1.4pt + black } else { none }
        let left-s = if x == 0 { 1.4pt + black } else { 0.6pt + black }
        let right-s = if x == 1 { 1.4pt + black } else { none }
        (top: top-s, bottom: bottom-s, left: left-s, right: right-s)
      },
      [
        #grid(
          columns: (1fr, 1fr),
          align: center + horizon,
          [#gothic("テーマ番号")],
          [#gothic("テーマ名")],
        )
      ],
      [
        #grid(
          columns: (1fr, 1fr),
          align: center + horizon,
          [#gothic("学籍番号")],
          [#gothic("氏　名")],
        )
      ],

      [
        #set text(font: font-mincho, size: 12pt)
        #if theme-number != "" [#theme-number \ ]
        #if theme != "" [#theme]
      ],
      [
        #set text(font: font-mincho, size: 16pt)
        #student-id #h(1.2em) #author
      ],
    )
  ]
}
