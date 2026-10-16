// ============================================================
// 八年级物理 第二章同步小测试
//
// 排版依据原始 Word 文件（4 页扫描件）：
//   · 标题居中、班级/姓名/学号/评价一行；
//   · 选择题选项四列并排；
//   · 插图一律使用从原始文件截出的图片（assets/ 目录）。
// 字体、标题层级、页码、填空横线仍由 template.typ 统一提供。
//
// 编译：typst compile 8年级第2章同步小测试.typ
// ============================================================
#import "template.typ": *

#set document(title: [第二章同步小测试])

// ---- 选择题选项 ----------------------------------------------------
// 参照 high-school-math 的做法用 table + auto 列：每列只取内容的自然宽度，
// 于是选项横向紧凑、不会为了撑满栏宽而把长选项压成窄条或拉出大空档。
// opt-indent：题干是「1. ×××」，题号占掉字宽，选项若从页边起步就会比题干偏左；
//   这里统一左缩进一个题号的宽度，让选项与题干正文左边缘对齐。
// opt-leading：选项折行时的行距（同一格内部，行与行之间）。
// opt-rowgap：选项与选项之间的间距（表格格与格之间）。
//   模板正文的 leading 与 spacing 都是 1em，选项排成多行时显得很挤；
//   这里把两者都放宽：长选项在格内折行时宽松，相邻选项之间也留出明显间隔。
#let opt-indent = 1.4em
#let opt-leading = 0.93em
#let opt-rowgap = 0.65em

// q-gap：选择题「题与题之间」的额外间距；题内（题干↔选项、选项↔选项）不动。
#let q-gap = 0.35em

// 实验探究题「小问与小问之间」的额外间距。
// 填空题没有小问，所以只在三、实验探究题里出现。
#let part-gap = 0.35em

#let opt-text(body) = block(par(leading: opt-leading, body))

#let opt-table(cols, gutter, ..items) = pad(
  left: opt-indent,
  table(
    columns: cols,
    column-gutter: gutter,
    row-gutter: opt-rowgap,
    inset: 0pt,
    stroke: none,
    align: left,
    ..items.map(opt-text),
  ),
)

// 四列一行（1×4）
#let choices(..items) = opt-table((auto,) * 4, 1.2em, ..items)

// 两行两列（2×2）
#let choices2(..items) = opt-table((auto, auto), 2em, ..items)

// 四行一列（4×1）
#let choices4(..items) = opt-table((auto,), 0pt, ..items)

// 括注填空：（#h(0.8em)）——用一个全角空格宽度把括号撑开
#let paren() = [（#h(0.8em)）]

// 插图：按内容宽度等比缩放，居中放置。
//   caption 给了内容 → 用 figure()，自动编号「图 N 标题」并参与计数；
//   caption 省略或传 none → 只输出图片，不编号、不占图号（如第 12 题的频闪照片，
//   题干里已经写「图1中/图2所示的秒表」，只有它不需要图注）。
//   注意：裸 image() 是行内内容，会贴左边距；figure() 自带居中，
//   所以无图注这一支必须自己 align(center, …)，否则那张图会跑到左边。
#let fig(src, width, caption: none) = {
  let img = image(src, width: width)
  if caption == none { align(center, img) } else { figure(img, caption: caption) }
}

// ============================================================
#template(
  page-footer: "第 1 页",
  heading2-align: left, // 原件里「一、选择题」这类章节标题是左对齐
  title-size: 16pt,
  heading-size: 14pt,
)[

  = 第二章同步小测试
  #v(1em)

  班级 #blank(4) 姓名 #blank(4) 学号 #blank(4) 评价 #blank(4)
  #v(1em)

  == 一、选择题（每题5分，共40分）
  #v(0.5em)

  1. 当我国神舟载人飞船与空间站组合体完成对接后，此时若说空间站是静止的，则选取的参照物是 （#h(2em)）

  #choices2(
    [A. 空间站],
    [B. 神舟载人飞船],
    [C. 太阳],
    [D. 地球],
  )

  #v(q-gap)
  2. 下列有关运动的说法中正确的是 （#h(2em)）

  #choices4(
    [A. 速度是表示物体运动快慢的物理量],
    [B. 速度大小不变的运动叫匀速直线运动],
    [C. 两个运动的物体相比较，速度大的物体运动的路程长],
    [D. 以 $3 upright("m/s")$ 的平均速度做变速运动的物体，每秒钟一定前进 $3 upright("m")$],
  )

  #v(q-gap)
  3. 甲、乙两个物体都做匀速直线运动。如果甲、乙通过的路程之比为 $2:3$，所用时间之比为 $2:1$，则甲、乙两个物体的速度之比为 （#h(2em)）

  #choices(
    [A. $1:3$],
    [B. $3:4$],
    [C. $4:3$],
    [D. $3:1$],
  )

  #v(q-gap)
  4. 根据你的生活经验判断，高度为 $60 upright("cm")$ 的物体可能是 （#h(2em)）

  #choices(
    [A. 教室的门],
    [B. 铅笔盒],
    [C. 课桌],
    [D. 水杯],
  )

  #v(q-gap)
  5. 下列是用分度值为 $1 upright("cm")$ 的刻度尺测量的一组数据，其中一定有误的是 （#h(2em)）

  #choices(
    [A. $0.28 upright("m")$],
    [B. $3.56 upright("dm")$],
    [C. $152 upright("mm")$],
    [D. $8.5 upright("cm")$],
  )

  #v(q-gap)
  6. 甲、乙两个物体都做匀速直线运动。如果甲、乙两个物体的速度之比为 $3:2$，所用时间之比为 $4:3$，则甲、乙两个物体通过的路程之比为 （#h(2em)）

  #choices(
    [A. $2:1$],
    [B. $9:8$],
    [C. $1:2$],
    [D. $8:9$],
  )

  #v(q-gap)
  7. 一个物体从 $A$ 点出发，沿直线 $A B C$ 做由慢到快的变速直线运动。测得它通过 $B C$ 段所用时间为 $0.5 upright("s")$，$B$、$C$ 两点相距为 $4 upright("m")$。此物体在从 $A$ 点到 $C$ 点这段路程上的平均速度一定 （#h(2em)）

  #choices2(
    [A. 大于 $8 upright("m/s")$],
    [B. 等于 $8 upright("m/s")$],
    [C. 小于 $8 upright("m/s")$],
    [D. 无法判断],
  )

  #v(q-gap)
  8. 为响应“绿色出行”的号召，三个好朋友决定选择不同的低碳环保的方式出行。小林骑电动车以 $20 upright("km/h")$ 的速度平稳前进；小明以 $3 upright("m/s")$ 的速度跑步前进；小亮骑自行车全速前进，他每分钟通过的路程为 $0.36 upright("km")$。则下列判断中正确的是 （#h(2em)）

  #choices4(
    [A. 小林速度最大],
    [B. 小明速度最大],
    [C. 小亮速度最大],
    [D. 三人速度一样大],
  )

  == 二、填空题（每空3分，共33分）
  #v(0.5em)

  9. 一名粗心的同学在记录数据时忘记了写单位，请你替他补上适当的单位：一支新铅笔长约 $0.18$ #blank(2)；学校操场上国旗的旗杆高约 $18$ #blank(2)；地球平均半径约 $6371$ #blank(2)；我国历代长城的总长约 $2.1 times 10^4$ #blank(2)。

  #v(q-gap)
  10. 某人骑车做匀速直线运动。如果 $0.5 upright("min")$ 内他通过了 $150 upright("m")$ 的路程，则车速是 #blank(2) $upright("m/s")$；他以此速度通过 $3.6 upright("km")$ 的路程需用 #blank(2) $upright("h")$，合 #blank(2) $upright("min")$。

  #v(q-gap)
  11. 单位换算：$5 upright("μm") =$ #blank(2) $upright("nm")$；$15 upright("m/s") =$ #blank(2) $upright("km/h")$。

  #v(q-gap)
  12. 下图是利用每秒闪光 10 次的照相装置拍摄到的运动小球的频闪照片，则照片记录下的小球运动时间为 #blank(2) $upright("s")$，小球 #blank(3)（选填“是”或“不是”）在做匀速直线运动。

  // 频闪照片：不配图注、不占图号（题干里用「图1中」「图2所示的秒表」指代）
  #fig("assets/fig-strobe.png", 45%)

  #v(0.5em)

  == 三、实验探究题（每空2分，共18分）
  #v(0.5em)

  13. (1) 图1中，物体 $A$ 的长度为 #blank(2) $upright("cm")$。

  (2) 图2所示的秒表的示数为 #blank(2) $upright("s")$。

  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1.6em,
    align(center, fig("assets/fig-ruler.png", 100%, caption: [刻度尺测量物体 A])),
    align(center, fig("assets/fig-stopwatch.png", 100%, caption: [秒表])),
  )

  #v(q-gap)
  14. 小文利用如图所示的实验装置做测量小车的平均速度的实验。他让小车从斜面 $A$ 点处由静止开始下滑并且开始计时。

  #fig("assets/fig-incline.png", 100%, caption: [第14题 测量小车平均速度实验装置])

  (1) 本实验的原理是 #blank(4)。

  #v(part-gap)
  (2) 为了更便于测量小车运动的时间，实验开始前小文需调节木块的位置，使斜面保持较 #blank(2)（选填“大”或“小”）的坡度。

  #v(part-gap)
  (3) 小文测得 $t_(A C) = 4.5 upright("s")$，则小车通过 $A C$ 段的平均速度为 #blank(2) $upright("m/s")$。

  #v(part-gap)
  (4) 为了测量小车在整个运动过程中通过 $B C$ 段的平均速度，某同学让小车从 $B$ 点由静止释放并开始计时，测出小车到达 $C$ 点的时间，从而计算出小车通过 $B C$ 段的平均速度。他的做法正确吗？ #blank(3)（选填“正确”或“不正确”），理由是： #blank(12)。

  #v(q-gap)
  // 原件把这题排成左右两栏：题干在左、s-t 图像在右
  #grid(
    columns: (1fr, auto),
    column-gutter: 1em,
    align(horizon)[
      15. 甲、乙两辆车沿着同一方向做直线运动时，它们行驶的路程 $s$ 随时间 $t$ 变化的图像如图所示。根据图像提供的信息，可知 #blank(2) 车运动较快；当 $t = 6 upright("s")$ 时，甲、乙两车相距 #blank(2) $upright("m")$。
    ],
    align(horizon)[
      // 图宽用绝对长度：auto 列 + 百分比会互相依赖，改用 cm 让右栏宽度可预期
      #fig("assets/fig-st-graph.png", 5.4cm, caption: [s-t 图像])
    ],
  )

  == 四、计算题（共9分）

  16. 有一段铁路与平直公路平行。一列火车从甲站开到乙站，所用时间是 $20 upright("min")$。一辆小汽车沿公路以 $60 upright("km/h")$ 的速度从甲站开到乙站，所用时间是 $0.5 upright("h")$。求火车的行驶速度。（4分）

  #v(4em)

  #pagebreak(weak: true)

  17. 为保证行车安全，我国高速公路的最高限速为 $120 upright("km/h")$。同时，在道路上行驶的车辆之间应保持足够的安全距离。当车辆在高速公路上超速行驶，或是车距过小时，发生事故的概率就会大大增加。某型号汽车的最短刹车距离（车辆从开始刹车到静止所行驶的距离）跟车辆行驶速度的关系为 $s_"制动" = k v^2$，其中 $k = 1/20 s^2\/m)$，汽车行驶速度 $v$ 的单位为 $upright("m/s")$，刹车距离 $s_"制动"$ 的单位为 $upright("m")$。若某人驾驶该型号汽车在高速路上以 $108 upright("km/h")$ 的速度行驶时，发现道路前方 $100 upright("m")$ 处有危险情况，假设该人的反应时间（从发现危险情况到做出反应动作的时间）为 $1 upright("s")$，则他能否在安全距离内把车停住？

  #pagebreak()

  // 试卷与答案之间用一条细灰线分隔（与 high-school-math 各文档一致）
  #line(length: 100%, stroke: 0.5pt + gray)

  = 参考答案

  // 每题后面附一句简要理由（关键步骤），便于自查。
  #let why(body) = text(size: 10.5pt, fill: luma(90))[#h(0.5em)（#body）]

  == 一、选择题
  #v(q-gap)
  1. B#why[以飞船为参照物，空间站的位置不变，是静止的]#v(q-gap)

  2. A#why[速度是表示运动快慢的物理量；B 缺“任意相等时间”；C 比较快慢要控制时间；D 平均速度不能保证每 1 s 都走 3 m]#v(q-gap)

  3. A#why[$v_1 : v_2 = (s_1)/t_1 : (s_2)/t_2 = 2/2 : 3/1 = 1 : 3$]#v(q-gap)

  4. C#why[课桌高约 80 cm，与 60 cm 最接近；教室门约 2 m、铅笔盒约 20 cm、水杯约 15 cm]#v(q-gap)

  5. C#why[分度值 1 cm 的刻度尺只能估读到 cm 的下一位（mm），$152 upright("mm")$ 记到了 mm 的十分位]#v(q-gap)

  6. A#why[$s_1 : s_2 = v_1 t_1 : v_2 t_2 = (3 times 4) : (2 times 3) = 2 : 1$]#v(q-gap)

  7. C#why[由慢到快，$B C$ 段比 $A B$ 段快，全段平均速度介于两段之间，即小于 $8 upright("m/s")$]#v(q-gap)

  8. C#why[小亮 $0.36 upright("km/min") = 6 upright("m/s")$，小林 $20 upright("km/h") approx 5.6 upright("m/s")$，小明 $3 upright("m/s")$]
  #v(q-gap)
  == 二、填空题
  #v(q-gap)
  9. $upright("m")$；$upright("m")$；$upright("km")$；$upright("km")$#why[铅笔约 0.18 m；旗杆约 18 m；地球半径约 6371 km；长城约 $2.1 times 10^4$ km]
  #v(q-gap)

  10. $5$；$0.2$；$12$#why[$v = (150 upright("m")) / (30 upright("s")) = 5 upright("m/s")$，$t = 3.6/18 = 0.2 upright("h") = 12 upright("min")$]
  #v(q-gap)

  11. $5 times 10^3$；$54$#why[$5 upright("μm") = 5 times 10^3 upright("nm")$，$15 upright("m/s") = 54 upright("km/h")$]
  #v(q-gap)

  12. $0.4$；不是#why[每秒闪光 10 次，相邻两点间隔 $0.1 upright("s")$，5 个点共 4 个间隔，故 $4 times 0.1 = 0.4 upright("s")$；相邻间隔不相等，所以不是匀速直线运动]
  #v(q-gap)
  == 三、实验探究题
  #v(q-gap)
  13. (1) $3.2$（在 $3.1$–$3.3$ 之间均可；与作图精度有关，书面作答写 $3.2 upright("cm")$ 即可）#why[物体 $A$ 左端对齐 3 cm 刻度线，右端落在 6 cm 右侧约 2 个小格处，故读数约 $6.2 - 3.0 = 3.2 upright("cm")$]
  #v(part-gap)
  (2) $37.5$#why[秒表长针指在 37 与 38 之间，读作 37.5 s]
  #v(q-gap)

  14. (1) $v = s/t$（用刻度尺测路程、用秒表测时间，再由 $v = s/t$ 求平均速度）
  #v(part-gap)

  (2) 小#why[坡度越小，小车下滑越慢、运动时间越长，越便于测量时间]

  (3) $0.2$#why[$s_(A C) = 90 upright("cm") = 0.9 upright("m")$（小车由 $A$ 滑到 $C$，尺上 $0$–$90 upright("cm")$），$v = 0.9/4.5 = 0.2 upright("m/s")$]

  (4) 不正确。因为让小车从 $B$ 点由静止释放，到达 $B$ 点时速度为零，不再是它从 $A$ 滑到 $C$ 过程中经过 $B$ 点时的速度，这样测不出 $B C$ 段的平均速度。
  #v(q-gap)

  15. 甲；$60$
  #why[图中甲线过原点，$v_甲 = 90/3 = 30 upright("m/s")$；乙线从 60 m 出发、也过 $(3 upright("s") , 90 upright("m"))$，$v_乙 = 30/3 = 10 upright("m/s")$，故甲较快。两车都做匀速直线运动，图像可以外推：$t = 6 upright("s")$ 时 $s_甲 = 30 times 6 = 180 upright("m")$，$s_乙 = 60 + 10 times 6 = 120 upright("m")$，相距 $180 - 120 = 60 upright("m")$]
  #v(q-gap)

  == 四、计算题
  #v(q-gap)
  16. 小汽车从甲站到乙站的路程：
  $ s = v t = 60 upright("km/h") times 0.5 upright("h") = 30 upright("km") $

  火车所用时间：
  $ t_"火车" = 20 upright("min") = 1/3 upright("h") $

  火车速度：
  $ v_"火车" = s / t_"火车" = (30 upright("km")) / (1/3 upright("h")) = 90 upright("km/h") $

  答：火车的行驶速度为 $90 upright("km/h")$。
  #v(q-gap)
  17. 汽车速度：
  $ v = 108 upright("km/h") = 30 upright("m/s") $

  反应距离：
  $ s_"反应" = v t_"反应" = 30 times 1 = 30 upright("m") $

  刹车距离：
  $ s_"制动" = k v^2 = 1/20 times 30^2 = 45 upright("m") $

  总停车距离：
  $ s_"总" = s_"反应" + s_"制动" = 30 + 45 = 75 upright("m") $

  因为 $75 upright("m") < 100 upright("m")$，所以能在安全距离内把车停住。

  答：他能在安全距离内把车停住。
]
