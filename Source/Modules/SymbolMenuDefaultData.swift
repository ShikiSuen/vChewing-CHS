// (c) 2021 and onwards The vChewing Project (MIT-NTL License).
// ====================
// This code is released under the MIT license (SPDX-License-Identifier: MIT)
// ... with NTL restriction stating that:
// No trademark license is granted to use the trade names, trademarks, service
// marks, or product names of Contributor, except as required to fulfill notice
// requirements defined in MIT License.

import Shared

extension CandidateNode {
  public static func load(url: URL) {
    DispatchQueue.main.async {
      // 這兩個變數單獨拿出來，省得每次都重建還要浪費算力。
      var arrLines = [String.SubSequence]()
      var fieldSlice = [Substring.SubSequence]()
      var arrMembers = [CandidateNode]()
      do {
        arrLines = try String(contentsOfFile: url.path, encoding: .utf8).split(separator: "\n")
        for strLine in arrLines.lazy.filter({ !$0.isEmpty }) {
          fieldSlice = strLine.split(separator: "=")
          switch fieldSlice.count {
            case 1: arrMembers.append(.init(name: String(fieldSlice[0])))
            case 2:
              arrMembers.append(.init(name: String(fieldSlice[0]), symbols: .init(fieldSlice[1].map { String($0) })))
            default: break
          }
        }
        Self.root = arrMembers.isEmpty ? defaultSymbolRoot : .init(name: "/", members: arrMembers)
      } catch {
        Self.root = defaultSymbolRoot
      }
    }
  }

  // MARK: - Static data.

  static let catCommonSymbols = NSLocalizedString("catCommonSymbols", comment: "")
  static let catHoriBrackets = NSLocalizedString("catHoriBrackets", comment: "")
  static let catVertBrackets = NSLocalizedString("catVertBrackets", comment: "")
  static let catAlphabets = NSLocalizedString("catAlphabets", comment: "")
  static let catSpecialNumbers = NSLocalizedString("catSpecialNumbers", comment: "")
  static let catMathSymbols = NSLocalizedString("catMathSymbols", comment: "")
  static let catCurrencyUnits = NSLocalizedString("catCurrencyUnits", comment: "")
  static let catSpecialSymbols = NSLocalizedString("catSpecialSymbols", comment: "")
  static let catUnicodeSymbols = NSLocalizedString("catUnicodeSymbols", comment: "")
  static let catCircledKanjis = NSLocalizedString("catCircledKanjis", comment: "")
  static let catCircledKataKana = NSLocalizedString("catCircledKataKana", comment: "")
  static let catBracketKanjis = NSLocalizedString("catBracketKanjis", comment: "")
  static let catSingleTableLines = NSLocalizedString("catSingleTableLines", comment: "")
  static let catDoubleTableLines = NSLocalizedString("catDoubleTableLines", comment: "")
  static let catFillingBlocks = NSLocalizedString("catFillingBlocks", comment: "")
  static let catLineSegments = NSLocalizedString("catLineSegments", comment: "")
  static let catKana = NSLocalizedString("catKana", comment: "")
  static let catCombinations = NSLocalizedString("catCombinations", comment: "")
  static let catPhonabets = NSLocalizedString("catPhonabets", comment: "")
  static let catCircledASCII = NSLocalizedString("catCircledASCII", comment: "")
  static let catBracketedASCII = NSLocalizedString("catBracketedASCII", comment: "")
  static let catMusicSymbols = NSLocalizedString("catMusicSymbols", comment: "")
  static let catThai = NSLocalizedString("catThai", comment: "")
  static let catYi = NSLocalizedString("catYi", comment: "")

  private static let defaultSymbolRoot: CandidateNode = .init(
    name: "/",
    members: [
      CandidateNode(name: "　"),
      CandidateNode(name: "｀"),
      CandidateNode(
        name: catCommonSymbols,
        symbols: [
          "，", "、", "。", "．", "？", "！", "；", "：", "‧", "‥", "﹐", "﹒", "˙", "·", "‘", "’", "“", "”", "〝", "〞", "‵", "′",
          "〃", "～", "＄", "％", "﹪", "＠", "＆", "＃", "＊", "・", "…", "—", "〜", "／", "＼", "＿", "―", "‖", "﹫", "﹟", "﹠", "﹡",
        ]
      ),
      CandidateNode(
        name: catHoriBrackets,
        symbols: [
          "（", "）", "［", "］", "｛", "｝", "〈", "〉", "《", "》", "「", "」", "『", "』", "【", "】", "〔", "〕", "〖", "〗", "〘", "〙",
          "〚", "〛", "︗", "︘", "︷", "︸", "︹", "︺", "︻", "︼", "︽", "︾", "︿", "﹀", "﹁", "﹂", "﹃", "﹄", "﹇", "﹈", "︵", "︶",
          "[", "]", "{", "}", "⁅", "⁆", "⎡", "⎢", "⎣", "⎤", "⎥", "⎦", "⎧", "⎨", "⎩", "⎪", "⎫", "⎬", "⎭", "⎰", "⎱", "｢",
          "｣", "❬", "❭", "❰", "❱", "❲", "❳", "❴", "❵", "⟦", "⟧", "⟨", "⟩", "⟪", "⟫", "⟬", "⟭", "⦃", "⦄", "⦇", "⦈", "⦉",
          "⦊", "⦋", "⦌", "⦍", "⦎", "⦏", "⦐", "⦑", "⦒", "⦓", "⦔", "⦕", "⦖", "⦗", "⦘", "⧼", "⧽", "⸂", "⸃", "⸄", "⸅", "⸉",
          "⸊", "⸌", "⸍", "⸜", "⸝", "⸢", "⸣", "⸤", "⸥", "⸦", "⸧", "⎴", "⎵", "⎶", "⏞", "⏟", "⏠", "⏡", "﹙", "﹚", "﹛", "﹜",
          "﹝", "﹞", "﹤", "﹥", "‘", "’", "“", "”", "〝", "〞", "‵", "′", "″", "＇",
        ]
      ),
      CandidateNode(
        name: catVertBrackets,
        symbols: ["︵", "︶", "﹁", "﹂", "︹", "︺", "︷", "︸", "︿", "﹀", "﹃", "﹄", "︽", "︾", "︻", "︼"]
      ),
      CandidateNode(
        name: catAlphabets,
        symbols: [
          "α", "β", "γ", "δ", "ε", "ζ", "η", "θ", "ι", "κ", "λ", "μ", "ν", "ξ", "ο", "π", "ρ", "σ", "τ", "υ", "φ", "χ",
          "ψ", "ω", "Α", "Β", "Γ", "Δ", "Ε", "Ζ", "Η", "Θ", "Ι", "Κ", "Λ", "Μ", "Ν", "Ξ", "Ο", "Π", "Ρ", "Σ", "Τ", "Υ",
          "Φ", "Χ", "Ψ", "Ω", "а", "б", "в", "г", "д", "е", "ж", "з", "и", "й", "к", "л", "м", "н", "о", "п", "р", "с",
          "т", "у", "ф", "х", "ц", "ч", "ш", "щ", "ъ", "ы", "ь", "э", "ю", "я", "ё", "А", "Б", "В", "Г", "Д", "Е", "Ж",
          "З", "И", "Й", "К", "Л", "М", "Н", "О", "П", "Р", "С", "Т", "У", "Ф", "Х", "Ц", "Ч", "Ш", "Щ", "Ъ", "Ы", "Ь",
          "Э", "Ю", "Я", "Ё", "à", "á", "è", "é", "ê", "ì", "í", "ò", "ó", "ù", "ú", "ü", "ā", "ē", "ě", "ī", "ń", "ň",
          "ō", "ū", "ǎ", "ǐ", "ǒ", "ǔ", "ǖ", "ǘ", "ǚ", "ǜ", "ɑ", "ɡ", "¨", "·",
        ]
      ),
      CandidateNode(
        name: catSpecialNumbers,
        symbols: [
          "Ⅰ", "Ⅱ", "Ⅲ", "Ⅳ", "Ⅴ", "Ⅵ", "Ⅶ", "Ⅷ", "Ⅸ", "Ⅹ", "Ⅺ", "Ⅻ", "ⅰ", "ⅱ", "ⅲ", "ⅳ", "ⅴ", "ⅵ", "ⅶ", "ⅷ", "ⅸ", "ⅹ",
          "ⅺ", "ⅻ", "〇", "〡", "〢", "〣", "〤", "〥", "〦", "〧", "〨", "〩",
        ]
      ),
      CandidateNode(
        name: catMathSymbols,
        symbols: [
          "﹢", "﹤", "﹥", "＋", "－", "＜", "＝", "＞", "✕", "%", "+", "<", "=", ">", "¡", "¢", "«", "°", "±", "µ", "»", "¼",
          "½", "¾", "¿", "×", "÷", "ˇ", "θ", "π", "‰", "₠", "₡", "₢", "₣", "₤", "₥", "₦", "₧", "₨", "₩", "₪", "₫", "€",
          "℀", "℁", "℃", "℅", "℆", "℉", "⅓", "⅔", "⅕", "⅖", "⅗", "⅘", "⅙", "⅚", "⅛", "⅜", "⅝", "⅞", "⅟", "∀", "∁", "∂",
          "∃", "∄", "∅", "∆", "∇", "∈", "∉", "∊", "∋", "∌", "∍", "∎", "∏", "∐", "∑", "−", "∓", "∔", "∕", "∖", "∗", "∘",
          "∙", "√", "∛", "∜", "∝", "∞", "∟", "∠", "∡", "∢", "∣", "∤", "∥", "∧", "∨", "∩", "∪", "∫", "∬", "∭", "∮", "∯",
          "∰", "∱", "∲", "∳", "∴", "∵", "∶", "∷", "∸", "∹", "∺", "∻", "∼", "∽", "∾", "∿", "≀", "≁", "≂", "≃", "≄", "≅",
          "≆", "≇", "≈", "≉", "≊", "≋", "≌", "≍", "≎", "≏", "≐", "≑", "≒", "≓", "≔", "≕", "≖", "≗", "≘", "≙", "≚", "≛",
          "≜", "≝", "≞", "≟", "≠", "≡", "≢", "≣", "≤", "≥", "≦", "≧", "≨", "≩", "≪", "≫", "≬", "≭", "≮", "≯", "≰", "≱",
          "≲", "≳", "≴", "≵", "≶", "≷", "≸", "≹", "≺", "≻", "≼", "≽", "≾", "≿", "⊀", "⊁", "⊂", "⊃", "⊄", "⊅", "⊆", "⊇",
          "⊈", "⊉", "⊊", "⊋", "⊌", "⊍", "⊎", "⊏", "⊐", "⊑", "⊒", "⊓", "⊔", "⊕", "⊖", "⊗", "⊘", "⊙", "⊚", "⊛", "⊜", "⊝",
          "⊞", "⊟", "⊠", "⊡", "⊢", "⊣", "⊤", "⊥", "⊦", "⊧", "⊨", "⊩", "⊪", "⊫", "⊬", "⊭", "⊮", "⊯", "⊰", "⊱", "⊲", "⊳",
          "⊴", "⊵", "⊶", "⊷", "⊸", "⊹", "⊺", "⊻", "⊼", "⊽", "⊾", "⊿", "⋀", "⋁", "⋂", "⋃", "⋄", "⋅", "⋆", "⋇", "⋈", "⋉",
          "⋊", "⋋", "⋌", "⋍", "⋎", "⋏", "⋐", "⋑", "⋒", "⋓", "⋔", "⋕", "⋖", "⋗", "⋘", "⋙", "⋚", "⋛", "⋜", "⋝", "⋞", "⋟",
          "⋠", "⋡", "⋢", "⋣", "⋤", "⋥", "⋦", "⋧", "⋨", "⋩", "⋪", "⋫", "⋬", "⋭", "⋮", "⋯", "⋰", "⋱",
        ]
      ),
      CandidateNode(
        name: catCurrencyUnits,
        symbols: [
          "$", "€", "¥", "¢", "£", "₽", "₨", "₩", "฿", "₺", "₮", "₱", "₭", "₴", "₦", "৲", "৳", "૱", "௹", "﷼", "₹", "₲",
          "₪", "₡", "₫", "៛", "₵", "₢", "₸", "₤", "₳", "₥", "₠", "₣", "₰", "₧", "₯", "₶", "₷", "¤", "￠", "￥", "￡", "＄",
          "﹩", "￦",
        ]
      ),
      CandidateNode(
        name: catSpecialSymbols,
        symbols: [
          "↩", "⌘", "⎋", "⏏", "⇥", "⇤", "⇪", "⇧", "⌤", "⌥", "⎇", "␣", "⌃", "⌄", "⌅", "⌆", "⌦", "⌫", "⌧", "⇱", "↖", "↸",
          "⇲", "↘", "⇞", "⇟", "↑", "↓", "←", "→", "⇡", "⇣", "⇠", "⇢", "⚙", "⇭", "⌽", "⌀", "⌁", "⌂", "⌐", "⌑", "⌒", "⌓",
          "⌔", "⌕", "⌖", "⌗", "⌙", "⌨", "⎄", "⎅", "⎆", "⎈", "⎉", "⎊", "⎌", "⌚", "⌛", "⎗", "⎘", "⎙", "⎚", "⎀", "⎁", "⎂",
          "⎃", "⌇", "⌈", "⌉", "⌊", "⌋", "⌌", "⌍", "⌏", "⌠", "⎮", "⌡", "⌢", "⌣", "⌜", "⌝", "⌞", "⌟", "⁒", "〈", "〉", "⌬",
          "⌭", "⌮", "⌯", "⌰", "⌱", "⌲", "⌳", "↗", "↙", "↺", "⇩", "⇦", "⇨", "⇄", "⇆", "⇅", "⇵", "↻", "◎", "○", "●", "⊕",
          "⊙", "※", "△", "▲", "☆", "★", "◇", "◆", "□", "■", "▽", "▼", "№", "℡", "§", "〒", "♀", "♂", "↯", "¶", "©", "®",
          "™", "🜀", "🜁", "🜂", "🜃", "🜄", "🜅", "🜆", "🜇", "🜈", "🜉", "🜊", "🜋", "🜌", "🜍", "🜎", "🜏", "🜐", "🜑", "🜒", "🜓", "🜔",
          "🜕", "🜖", "🜗", "🜘", "🜙", "🜚", "🜛", "🜜", "🜝", "🜞", "🜟", "🜠", "🜡", "🜢", "🜣", "🜤", "🜥", "🜦", "🜧", "🜨", "🜩", "🜪",
          "🜫", "🜬", "🜭", "🜮", "🜯", "🜰", "🜱", "🜲", "🜳", "🜴", "🜵", "🜶", "🜷", "🜸", "🜹", "🜺", "🜻", "🜼", "🜽", "🜾", "🜿", "🝀",
          "🝁", "🝂", "🝃", "🝄", "🝅", "🝆", "🝇", "🝈", "🝉", "🝊", "🝋", "🝌", "🝍", "🝎", "🝏", "🝐", "🝑", "🝒", "🝓", "🝔", "🝕", "🝖",
          "🝗", "🝘", "🝙", "🝚", "🝛", "🝜", "🝝", "🝞", "🝟", "🝠", "🝡", "🝢", "🝣", "🝤", "🝥", "🝦", "🝧", "🝨", "🝩", "🝪", "🝫", "🝬",
          "🝭", "🝮", "🝯", "🝰", "🝱", "🝲", "🝳", "↚", "↛", "↜", "↝", "↞", "↟", "↠", "↡", "↢", "↣", "↤", "↥", "↦", "↧", "↨",
          "↪", "↫", "↬", "↭", "↮",
        ]
      ),
      CandidateNode(
        name: catUnicodeSymbols,
        symbols: [
          "※", "∮", "∴", "∵", "∽", "☀", "☁", "☂", "☃", "☺", "☻", "♠", "♣", "♥", "♦", "♨", "♩", "♪", "♫", "♬", "♭", "♯",
          "■", "□", "▢", "▣", "▤", "▥", "▦", "▧", "▨", "▩", "▪", "▫", "▬", "▭", "▮", "▯", "▰", "▱", "▲", "△", "▴", "▵",
          "▶", "▷", "▸", "▹", "►", "▻", "▼", "▽", "▾", "▿", "◀", "◁", "◂", "◃", "◄", "◅", "◆", "◇", "◈", "◉", "◊", "○",
          "◌", "◍", "◎", "●", "◐", "◑", "◒", "◓", "◔", "◕", "◖", "◗", "◘", "◙", "◚", "◛", "◜", "◝", "◞", "◟", "◠", "◡",
          "◢", "◣", "◤", "◥", "◦", "◧", "◨", "◩", "◪", "◫", "◬", "◭", "◮", "◯", "◰", "◱", "◲", "◳", "◴", "◵", "◶", "◷",
          "◸", "◹", "◺", "◻", "◼", "◽", "◾", "◿", "☄", "★", "☆", "☇", "☈", "☉", "☊", "☋", "☌", "☍", "☎", "☏", "☐", "☑",
          "☒", "☓", "☔", "☕", "☖", "☗", "☘", "☙", "☚", "☛", "☜", "☝", "☞", "☟", "☠", "☡", "☢", "☣", "☤", "☥", "☦", "☧",
          "☨", "☩", "☪", "☫", "☬", "☭", "☮", "☯", "☰", "☱", "☲", "☳", "☴", "☵", "☶", "☷", "☸", "☹", "☼", "☽", "☾", "☿",
          "♀", "♁", "♂", "♃", "♄", "♅", "♆", "♇", "♈", "♉", "♊", "♋", "♌", "♍", "♎", "♏", "♐", "♑", "♒", "♓", "♔", "♕",
          "♖", "♗", "♘", "♙", "♚", "♛", "♜", "♝", "♞", "♟", "♡", "♢", "♤", "♧", "♮", "♰", "♱", "♲", "♳", "♴", "♵", "♶",
          "♷", "♸", "♹", "♺", "♻", "♼", "♽", "♾", "♿", "⚀", "⚁", "⚂", "⚃", "⚄", "⚅", "⚆", "⚇", "⚈", "⚉", "⚊", "⚋", "⚌",
          "⚍", "⚎", "⚏", "⚐", "⚑", "⚒", "⚓", "⚔", "⚕", "⚖", "⚗", "⚘", "⚙", "⚚", "⚛", "⚜", "⚝", "⚞", "⚟", "⚠", "⚡", "⚢",
          "⚣", "⚤", "⚥", "⚦", "⚧", "⚨", "⚩", "⚪", "⚫", "⚬", "⚭", "⚮", "⚯", "⚰", "⚱", "⚲", "⚳", "⚴", "⚵", "⚶", "⚷", "⚸",
          "⚹", "⚺", "⚻", "⚼", "⚽", "⚾", "⚿", "⛀", "⛁", "⛂", "⛃", "⛄", "⛅", "⛆", "⛇", "⛈", "⛉", "⛊", "⛋", "⛌", "⛍", "⛎",
          "⛏", "⛐", "⛑", "⛒", "⛓", "⛔", "⛕", "⛖", "⛗", "⛘", "⛙", "⛚", "⛛", "⛜", "⛝", "⛞", "⛟", "⛠", "⛡", "⛢", "⛣", "⛤",
          "⛥", "⛦", "⛧", "⛨", "⛩", "⛪", "⛫", "⛬", "⛭", "⛮", "⛯", "⛰", "⛱", "⛲", "⛳", "⛴", "⛵", "⛶", "⛷", "⛸", "⛹", "⛺",
          "⛻", "⛼", "⛽", "⛾", "⛿", "✁", "✂", "✃", "✄", "✅", "✆", "✇", "✈", "✉", "✊", "✋", "✌", "✍", "✎", "✏", "✐", "✑",
          "✒", "✓", "✔", "✕", "✖", "✗", "✘", "✙", "✚", "✛", "✜", "✝", "✞", "✟", "✠", "✡", "✢", "✣", "✤", "✥", "✦", "✧",
          "✨", "✩", "✪", "✫", "✬", "✭", "✮", "✯", "✰", "✱", "✲", "✳", "✴", "✵", "✶", "✷", "✸", "✹", "✺", "✻", "✼", "✽",
          "✾", "✿", "❀", "❁", "❂", "❃", "❄", "❅", "❆", "❇", "❈", "❉", "❊", "❋", "❌", "❍", "❎", "❏", "❐", "❑", "❒", "❓",
          "❔", "❕", "❖", "❗", "❘", "❙", "❚", "❛", "❜", "❝", "❞", "❟", "❠", "❡", "❢", "❣", "❤", "❥", "❦", "❧", "❨", "❩",
          "❪", "❫", "❬", "❭", "❮", "❯", "❰", "❱", "❲", "❳", "❴", "❵", "➔", "➕", "➖", "➗", "➘", "➙", "➚", "➛", "➜", "➝",
          "➞", "➟", "➠", "➡", "➢", "➣", "➤", "➥", "➦", "➧", "➨", "➩", "➪", "➫", "➬", "➭", "➮", "➯", "➰", "➱", "➲", "➳",
          "➴", "➵", "➶", "➷", "➸", "➹", "➺", "➻", "➼", "➽", "➾", "➿", "⬀", "⬁", "⬂", "⬃", "⬄", "⬅", "⬆", "⬇", "⬈", "⬉",
          "⬊", "⬋", "⬌", "⬍", "⬎", "⬏", "⬐", "⬑", "⬒", "⬓", "⬔", "⬕", "⬖", "⬗", "⬘", "⬙", "⬚", "⬛", "⬜", "⬝", "⬞", "⬟",
          "⬠", "⬡", "⬢", "⬣", "⬤", "⬥", "⬦", "⬧", "⬨", "⬩", "⬪", "⬫", "⬬", "⬭", "⬮", "⬯", "⬰", "⬱", "⬲", "⬳", "⬴", "⬵",
          "⬶", "⬷", "⬸", "⬹", "⬺", "⬻", "⬼", "⬽", "⬾", "⬿", "⭀", "⭁", "⭂", "⭃", "⭄", "⭅", "⭆", "⭇", "⭈", "⭉", "⭊", "⭋",
          "⭌", "⭐", "⭑", "⭒", "⭓", "⭔", "⭕", "⭖", "⭗", "⭘", "⭙", "₮", "〠", "〶", "ↀ", "ↁ", "ↂ", "₭", "〇", "〄", "㉿", "〆",
          "₯", "ℂ", "℄",
        ]
      ),
      CandidateNode(
        name: catMusicSymbols,
        symbols: [
          "𝄀", "𝄁", "𝄂", "𝄃", "𝄄", "𝄅", "𝄆", "𝄇", "𝄈", "𝄉", "𝄊", "𝄋", "𝄌", "𝄍", "𝄎", "𝄏", "𝄐", "𝄑", "𝄒", "𝄓", "𝄔", "𝄕",
          "𝄖", "𝄗", "𝄘", "𝄙", "𝄚", "𝄛", "𝄜", "𝄝", "𝄞", "𝄟", "𝄠", "𝄡", "𝄢", "𝄣", "𝄤", "𝄥", "𝄦", "𝄩", "𝄪", "𝄫", "𝄬", "𝄭",
          "𝄮", "𝄯", "𝄰", "𝄱", "𝄲", "𝄳", "𝄴", "𝄵", "𝄶", "𝄷", "𝄸", "𝄹", "𝄺", "𝄻", "𝄼", "𝄽", "𝄾", "𝄿", "𝅀", "𝅁", "𝅂", "𝅃",
          "𝅄", "𝅅", "𝅆", "𝅇", "𝅈", "𝅉", "𝅊", "𝅋", "𝅌", "𝅍", "𝅎", "𝅏", "𝅐", "𝅑", "𝅒", "𝅓", "𝅔", "𝅕", "𝅖", "𝅗", "𝅗𝅥", "𝅘",
          "𝅘𝅥", "𝅘𝅥𝅮", "𝅘𝅥𝅯", "𝅘𝅥𝅰", "𝅘𝅥𝅱", "𝅘𝅧𝅨𝅩𝅥𝅲𝅥𝅦", "𝅙", "𝅚", "𝅛", "𝅜", "𝅝", "𝅪", "𝅫", "𝅬𝅮𝅯𝅰𝅱𝅲𝅭", "𝅳", "𝅴", "𝅵", "𝅶", "𝅷", "𝅸", "𝅹", "𝅺",
          "𝅻𝅼𝅽𝅾𝅿𝆀𝆁𝆂", "𝆃", "𝆄𝆊𝆋𝆅𝆆𝆇𝆈𝆉", "𝆌", "𝆍", "𝆎", "𝆏", "𝆐", "𝆑", "𝆒", "𝆓", "𝆔", "𝆕", "𝆖", "𝆗", "𝆘", "𝆙", "𝆚", "𝆛", "𝆜", "𝆝", "𝆞",
          "𝆟", "𝆠", "𝆡", "𝆢", "𝆣", "𝆤", "𝆥", "𝆦", "𝆧", "𝆨", "𝆩𝆪𝆫𝆬𝆭", "𝆮", "𝆯", "𝆰", "𝆱", "𝆲", "𝆳", "𝆴", "𝆵", "𝆶", "𝆷", "𝆸",
          "𝆹", "𝆹𝅥", "𝆹𝅥𝅮", "𝆹𝅥𝅯", "𝆺", "𝆺𝅥", "𝆺𝅥𝅮", "𝆺𝅥𝅯", "𝇁", "𝇂", "𝇃", "𝇄", "𝇅", "𝇆", "𝇇", "𝇈", "𝇉", "𝇊", "𝇋", "𝇌", "𝇍", "𝇎",
          "𝇏", "𝇐", "𝇑", "𝇒", "𝇓", "𝇔", "𝇕", "𝇖", "𝇗", "𝇘", "𝇙", "𝇚", "𝇛", "𝇜", "𝇝", "𝇞", "𝇟", "𝇠", "𝇡", "𝇢", "𝇣", "𝇤",
          "𝇥", "𝇦", "𝇧", "𝇨",
        ]
      ),
      CandidateNode(
        name: catCircledKanjis,
        symbols: [
          "㊊", "㊋", "㊌", "㊍", "㊎", "㊏", "㊐", "㊑", "㊒", "㊓", "㊔", "㊕", "㊖", "㊗︎", "㊘", "㊙︎", "㊚", "㊛", "㊜", "㊝", "㊞", "㊟",
          "㊠", "㊡", "㊢", "㊣", "㊤", "㊥", "㊦", "㊧", "㊨", "㊩", "㊪", "㊫", "㊬", "㊭", "㊮", "㊯", "㊰", "㊀", "㊁", "㊂", "㊃", "㊄",
          "㊅", "㊆", "㊇", "㊈", "㊉", "🈚︎", "🈯︎",
        ]
      ),
      CandidateNode(
        name: catCircledKataKana,
        symbols: [
          "㋐", "㋑", "㋒", "㋓", "㋔", "㋕", "㋖", "㋗", "㋘", "㋙", "㋚", "㋛", "㋜", "㋝", "㋞", "㋟", "㋠", "㋡", "㋢", "㋣", "㋤", "㋥",
          "㋦", "㋧", "㋨", "㋩", "㋪", "㋫", "㋬", "㋭", "㋮", "㋯", "㋰", "㋱", "㋲", "㋳", "㋴", "㋵", "㋶", "㋷", "㋸", "㋹", "㋺", "㋻",
          "㋼", "㋽", "㋾",
        ]
      ),
      CandidateNode(
        name: catBracketKanjis,
        symbols: [
          "㈪", "㈫", "㈬", "㈭", "㈮", "㈯", "㈰", "㈱", "㈲", "㈳", "㈴", "㈵", "㈶", "㈷", "㈸", "㈹", "㈺", "㈻", "㈼", "㈽", "㈾", "㈿",
          "㉀", "㉁", "㉂", "㉃",
        ]
      ),
      CandidateNode(
        name: catSingleTableLines,
        symbols: [
          "─", "│", "┌", "┐", "└", "┕", "┘", "├", "┤", "┬", "┴", "┼", "═", "╞", "╡", "╪", "╭", "╮", "╯", "╰", "▕",
        ]
      ),
      CandidateNode(
        name: catDoubleTableLines,
        symbols: [
          "═", "║", "╒", "╓", "╔", "╕", "╖", "╗", "╘", "╙", "╚", "╛", "╜", "╝", "╞", "╟", "╠", "╡", "╢", "╣", "╤", "╥",
          "╦", "╧", "╨", "╩", "╪", "╫", "╬",
        ]
      ),
      CandidateNode(
        name: catFillingBlocks,
        symbols: [
          "＿", "ˍ", "▁", "▂", "▃", "▄", "▅", "▆", "▇", "█", "▏", "▎", "▍", "▌", "▋", "▊", "▉", "◢", "◣", "◥", "◤",
        ]
      ),
      CandidateNode(
        name: catLineSegments,
        symbols: [
          "﹣", "﹦", "≡", "｜", "∣", "∥", "–", "︱", "—", "︳", "╴", "¯", "￣", "﹉", "﹊", "﹍", "﹎", "﹋", "﹌", "﹏", "︴", "∕",
          "﹨", "╱", "╲", "／", "＼", "ˍ", "━", "┃", "▕", "〓", "╳", "∏", "ˆ", "⌒", "┄", "┅", "┆", "┇", "┈", "┉", "┊", "┋",
        ]
      ),
      CandidateNode(
        name: catKana,
        symbols: [
          "ぁ", "あ", "ぃ", "い", "ぅ", "う", "ゔ", "ぇ", "え", "ぉ", "お", "か", "が", "き", "ぎ", "く", "ぐ", "け", "げ", "こ", "ご", "さ",
          "ざ", "し", "じ", "す", "ず", "せ", "ぜ", "そ", "ぞ", "た", "だ", "ち", "ぢ", "っ", "つ", "づ", "て", "で", "と", "ど", "な", "に",
          "ぬ", "ね", "の", "は", "ば", "ひ", "び", "ふ", "ぶ", "へ", "べ", "ほ", "ぼ", "ま", "み", "む", "め", "も", "ゃ", "や", "ゅ", "ゆ",
          "ょ", "よ", "ら", "ら゚", "り", "り゚", "る", "る゚", "れ", "れ゚", "ろ", "ろ゚", "ゎ", "わ", "わ゙", "ゐ", "ゐ゙", "ゑ", "ゑ゙", "を", "を゙", "ん",
          "ゕ", "ゖ", "ゝ", "ゞ", "ゟ", "〻", "゠", "ァ", "ア", "ィ", "イ", "ゥ", "ウ", "ヴ", "ェ", "エ", "ォ", "オ", "カ", "ガ", "キ", "ギ",
          "ク", "グ", "ケ", "ゲ", "コ", "ゴ", "サ", "ザ", "シ", "ジ", "ス", "ズ", "セ", "ゼ", "ソ", "ゾ", "タ", "ダ", "チ", "ヂ", "ッ", "ツ",
          "ヅ", "テ", "デ", "ト", "ド", "ナ", "ニ", "ヌ", "ネ", "ノ", "ハ", "バ", "パ", "ヒ", "ビ", "ピ", "フ", "ブ", "プ", "ヘ", "ベ", "ペ",
          "ホ", "ボ", "ポ", "マ", "ミ", "ム", "メ", "モ", "ャ", "ヤ", "ュ", "ユ", "ョ", "ヨ", "ラ", "ラ゚", "リ", "リ゚", "ル", "ル゚", "レ", "レ゚",
          "ロ", "ロ゚", "ヮ", "ワ", "ヷ", "ヰ", "ヸ", "ヱ", "ヹ", "ヲ", "ヺ", "ン", "ヵ", "ヶ", "・", "ー", "ヽ", "ヾ", "ヿ", "々", "ㇰ", "ㇱ",
          "ㇲ", "ㇳ", "ㇴ", "ㇵ", "ㇶ", "ㇷ", "ㇸ", "ㇹ", "ㇺ", "ㇻ", "ㇼ", "ㇽ", "ㇾ", "ㇿ", "･", "ｦ", "ｧ", "ｨ", "ｩ", "ｪ", "ｫ", "ｬ",
          "ｭ", "ｮ", "ｯ", "ｰ", "ｱ", "ｲ", "ｳ", "ｴ", "ｵ", "ｶ", "ｷ", "ｸ", "ｹ", "ｺ", "ｻ", "ｼ", "ｽ", "ｾ", "ｿ", "ﾀ", "ﾁ", "ﾂ",
          "ﾃ", "ﾄ", "ﾅ", "ﾆ", "ﾇ", "ﾈ", "ﾉ", "ﾊ", "ﾋ", "ﾌ", "ﾍ", "ﾎ", "ﾏ", "ﾐ", "ﾑ", "ﾒ", "ﾓ", "ﾔ", "ﾕ", "ﾖ", "ﾗ", "ﾘ",
          "ﾙ", "ﾚ", "ﾛ", "ﾜ", "ﾝ", " ﾞ", " ﾟ", "〲", "〱", "〳", "〴", "〵",
        ]
      ),
      CandidateNode(
        name: catCombinations,
        symbols: [
          "㍘", "㍙", "㍚", "㍛", "㍜", "㍝", "㍞", "㍟", "㍠", "㍡", "㍢", "㍣", "㍤", "㍥", "㍦", "㍧", "㍨", "㍩", "㍪", "㍫", "㍬", "㍭",
          "㍮", "㍯", "㍰", "㏠", "㏡", "㏢", "㏣", "㏤", "㏥", "㏦", "㏧", "㏨", "㏩", "㏪", "㏫", "㏬", "㏭", "㏮", "㏯", "㏰", "㏱", "㏲",
          "㏳", "㏴", "㏵", "㏶", "㏷", "㏸", "㏹", "㏺", "㏻", "㏼", "㏽", "㏾", "㍱", "㍲", "㍳", "㍴", "㍵", "㍶", "㍷", "㍸", "㍹", "㍺",
          "㎀", "㎁", "㎂", "㎃", "㎄", "㎅", "㎆", "㎇", "㎈", "㎉", "㎊", "㎋", "㎌", "㎍", "㎎", "㎏", "㎐", "㎑", "㎒", "㎓", "㎔", "㎕",
          "㎖", "㎗", "㎘", "㎙", "㎚", "㎛", "㎜", "㎝", "㎞", "㎟", "㎠", "㎡", "㎢", "㎣", "㎤", "㎥", "㎦", "㎧", "㎨", "㎩", "㎪", "㎫",
          "㎬", "㎭", "㎮", "㎯", "㎰", "㎱", "㎲", "㎳", "㎴", "㎵", "㎶", "㎷", "㎸", "㎹", "㎺", "㎻", "㎼", "㎽", "㎾", "㎿", "㏀", "㏁",
          "㏂", "㏃", "㏄", "㏅", "㏆", "㏇", "㏈", "㏉", "㏊", "㏋", "㏌", "㏍", "㏎", "㏏", "㏐", "㏑", "㏒", "㏓", "㏔", "㏕", "㏖", "㏗",
          "㏘", "㏙", "㏚", "㏛", "㏜", "㏝", "㏞", "㏟", "㏿", "㋿", "㍼", "㍽", "㍾", "㍻", "㍿", "㌀", "㌁", "㌂", "㌃", "㌄", "㌅", "㌆",
          "㌇", "㌈", "㌉", "㌊", "㌋", "㌌", "㌍", "㌎", "㌏", "㌐", "㌑", "㌒", "㌓", "㌔", "㌕", "㌖", "㌗", "㌘", "㌙", "㌚", "㌛", "㌜",
          "㌝", "㌞", "㌟", "㌠", "㌡", "㌢", "㌣", "㌤", "㌥", "㌦", "㌧", "㌨", "㌩", "㌪", "㌫", "㌬", "㌭", "㌮", "㌯", "㌰", "㌱", "㌲",
          "㌳", "㌴", "㌵", "㌶", "㌷", "㌸", "㌹", "㌺", "㌻", "㌼", "㌽", "㌾", "㌿", "㍀", "㍁", "㍂", "㍃", "㍄", "㍅", "㍆", "㍇", "㍈",
          "㍉", "㍊", "㍋", "㍌", "㍍", "㍎", "㍏", "㍐", "㍑", "㍒", "㍓", "㍔", "㍕", "㍖", "㍗",
        ]
      ),
      CandidateNode(
        name: catPhonabets,
        symbols: [
          "ㄅ", "ㄆ", "ㄇ", "ㄈ", "ㄉ", "ㄊ", "ㄋ", "ㄌ", "ㄍ", "ㄎ", "ㄏ", "ㄐ", "ㄑ", "ㄒ", "ㄓ", "ㄔ", "ㄕ", "ㄖ", "ㄗ", "ㄘ", "ㄙ", "ㄚ",
          "ㄛ", "ㄜ", "ㄝ", "ㄞ", "ㄟ", "ㄠ", "ㄡ", "ㄢ", "ㄣ", "ㄤ", "ㄥ", "ㄦ", "ㄧ", "ㄨ", "ㄩ", "ㄪ", "ㄫ", "ㄬ", "ㄭ", "ㄮ", "ㄯ", "ㆵ",
          "ㆠ", "ㆡ", "ㆢ", "ㆣ", "ㆤ", "ㆥ", "ㆦ", "ㆧ", "ㆨ", "ㆩ", "ㆪ", "ㆫ", "ㆬ", "ㆭ", "ㆮ", "ㆯ", "ㆰ", "ㆱ", "ㆲ", "ㆳ", "ㆴ", "ㆶ",
          "ㆷ", "ㆸ", "ㆹ", "ㆺ", "ㆻ", "ㆼ", "ㆽ", "ㆾ", "ㆿ", "˙", "ˊ", "ˇ", "ˋ", "˪", "˫",
        ]
      ),
      CandidateNode(
        name: catCircledASCII,
        symbols: [
          "①", "②", "③", "④", "⑤", "⑥", "⑦", "⑧", "⑨", "⑩", "⑪", "⑫", "⑬", "⑭", "⑮", "⑯", "⑰", "⑱", "⑲", "⑳", "Ⓐ", "Ⓑ",
          "Ⓒ", "Ⓓ", "Ⓔ", "Ⓕ", "Ⓖ", "Ⓗ", "Ⓘ", "Ⓙ", "Ⓚ", "Ⓛ", "Ⓜ", "Ⓜ︎", "Ⓝ", "Ⓞ", "Ⓟ", "Ⓠ", "Ⓡ", "Ⓢ", "Ⓣ", "Ⓤ", "Ⓥ", "Ⓦ",
          "Ⓧ", "Ⓨ", "Ⓩ", "ⓐ", "ⓑ", "ⓒ", "ⓓ", "ⓔ", "ⓕ", "ⓖ", "ⓗ", "ⓘ", "ⓙ", "ⓚ", "ⓛ", "ⓜ", "ⓝ", "ⓞ", "ⓟ", "ⓠ", "ⓡ", "ⓢ",
          "ⓣ", "ⓤ", "ⓥ", "ⓦ", "ⓧ", "ⓨ", "ⓩ", "⓪", "⓫", "⓬", "⓭", "⓮", "⓯", "⓰", "⓱", "⓲", "⓳", "⓴", "⓵", "⓶", "⓷", "⓸",
          "⓹", "⓺", "⓻", "⓼", "⓽", "⓾", "⓿", "❶", "❷", "❸", "❹", "❺", "❻", "❼", "❽", "❾", "❿", "➀", "➁", "➂", "➃", "➄",
          "➅", "➆", "➇", "➈", "➉", "➊", "➋", "➌", "➍", "➎", "➏", "➐", "➑", "➒", "➓", "🄰", "🄱", "🄲", "🄳", "🄴", "🄵", "🄶",
          "🄷", "🄸", "🄹", "🄺", "🄻", "🄼", "🄽", "🄾", "🄿", "🅀", "🅁", "🅂", "🅃", "🅄", "🅅", "🅆", "🅇", "🅈", "🅉", "🅐", "🅑", "🅒",
          "🅓", "🅔", "🅕", "🅖", "🅗", "🅘", "🅙", "🅚", "🅛", "🅜", "🅝", "🅞", "🅟", "🅠", "🅡", "🅢", "🅣", "🅤", "🅥", "🅦", "🅧", "🅨",
          "🅩", "🅰", "🅱", "🅲", "🅳", "🅴", "🅵", "🅶", "🅷", "🅸", "🅹", "🅺", "🅻", "🅼", "🅽", "🅾", "🅿︎", "🆀", "🆁", "🆂", "🆃", "🆄",
          "🆅", "🆆", "🆇", "🆈", "🆉",
        ]
      ),
      CandidateNode(
        name: catBracketedASCII,
        symbols: [
          "⑴", "⑵", "⑶", "⑷", "⑸", "⑹", "⑺", "⑻", "⑼", "⑽", "⑾", "⑿", "⒀", "⒁", "⒂", "⒃", "⒄", "⒅", "⒆", "⒇", "⒜", "⒝",
          "⒞", "⒟", "⒠", "⒡", "⒢", "⒣", "⒤", "⒥", "⒦", "⒧", "⒨", "⒩", "⒪", "⒫", "⒬", "⒭", "⒮", "⒯", "⒰", "⒱", "⒲", "⒳",
          "⒴", "⒵", "🄐", "🄑", "🄒", "🄓", "🄔", "🄕", "🄖", "🄗", "🄘", "🄙", "🄚", "🄛", "🄜", "🄝", "🄞", "🄟", "🄠", "🄡", "🄢", "🄣",
          "🄤", "🄥", "🄦", "🄧", "🄨", "🄩",
        ]
      ),
      CandidateNode(
        name: catThai,
        symbols: [
          "ก", "ข", "ฃ", "ค", "ฅ", "ฆ", "ง", "จ", "ฉ", "ช", "ซ", "ฌ", "ญ", "ฎ", "ฏ", "ฐ", "ฑ", "ฒ", "ณ", "ด", "ต", "ถ",
          "ท", "ธ", "น", "บ", "ป", "ผ", "ฝ", "พ", "ฟ", "ภ", "ม", "ย", "ร", "ฤ", "ล", "ฦ", "ว", "ศ", "ษ", "ส", "ห", "ฬ",
          "อ", "ฮ", "ฯ", "ะ", "ั", "า", "ำ", "ิ", "ี", "ึ", "ื", "ุ", "ู", "ฺ", "เ", "แ", "โ", "ใ", "ไ", "ๅ", "ๆ",
          "็", "่", "้", "๊", "๋", "์", "ํ", "๎", "๏", "๐", "๑", "๒", "๓", "๔", "๕", "๖", "๗", "๘", "๙", "๚", "๛",
        ]
      ),
      CandidateNode(
        name: catYi,
        symbols: [
          "ꀀ", "ꀁ", "ꀂ", "ꀃ", "ꀄ", "ꀅ", "ꀆ", "ꀇ", "ꀈ", "ꀉ", "ꀊ", "ꀋ", "ꀌ", "ꀍ", "ꀎ", "ꀏ", "ꀐ", "ꀑ", "ꀒ", "ꀓ", "ꀔ", "ꀕ",
          "ꀖ", "ꀗ", "ꀘ", "ꀙ", "ꀚ", "ꀛ", "ꀜ", "ꀝ", "ꀞ", "ꀟ", "ꀠ", "ꀡ", "ꀢ", "ꀣ", "ꀤ", "ꀥ", "ꀦ", "ꀧ", "ꀨ", "ꀩ", "ꀪ", "ꀫ",
          "ꀬ", "ꀭ", "ꀮ", "ꀯ", "ꀰ", "ꀱ", "ꀲ", "ꀳ", "ꀴ", "ꀵ", "ꀶ", "ꀷ", "ꀸ", "ꀹ", "ꀺ", "ꀻ", "ꀼ", "ꀽ", "ꀾ", "ꀿ", "ꁀ", "ꁁ",
          "ꁂ", "ꁃ", "ꁄ", "ꁅ", "ꁆ", "ꁇ", "ꁈ", "ꁉ", "ꁊ", "ꁋ", "ꁌ", "ꁍ", "ꁎ", "ꁏ", "ꁐ", "ꁑ", "ꁒ", "ꁓ", "ꁔ", "ꁕ", "ꁖ", "ꁗ",
          "ꁘ", "ꁙ", "ꁚ", "ꁛ", "ꁜ", "ꁝ", "ꁞ", "ꁟ", "ꁠ", "ꁡ", "ꁢ", "ꁣ", "ꁤ", "ꁥ", "ꁦ", "ꁧ", "ꁨ", "ꁩ", "ꁪ", "ꁫ", "ꁬ", "ꁭ",
          "ꁮ", "ꁯ", "ꁰ", "ꁱ", "ꁲ", "ꁳ", "ꁴ", "ꁵ", "ꁶ", "ꁷ", "ꁸ", "ꁹ", "ꁺ", "ꁻ", "ꁼ", "ꁽ", "ꁾ", "ꁿ", "ꂀ", "ꂁ", "ꂂ", "ꂃ",
          "ꂄ", "ꂅ", "ꂆ", "ꂇ", "ꂈ", "ꂉ", "ꂊ", "ꂋ", "ꂌ", "ꂍ", "ꂎ", "ꂏ", "ꂐ", "ꂑ", "ꂒ", "ꂓ", "ꂔ", "ꂕ", "ꂖ", "ꂗ", "ꂘ", "ꂙ",
          "ꂚ", "ꂛ", "ꂜ", "ꂝ", "ꂞ", "ꂟ", "ꂠ", "ꂡ", "ꂢ", "ꂣ", "ꂤ", "ꂥ", "ꂦ", "ꂧ", "ꂨ", "ꂩ", "ꂪ", "ꂫ", "ꂬ", "ꂭ", "ꂮ", "ꂯ",
          "ꂰ", "ꂱ", "ꂲ", "ꂳ", "ꂴ", "ꂵ", "ꂶ", "ꂷ", "ꂸ", "ꂹ", "ꂺ", "ꂻ", "ꂼ", "ꂽ", "ꂾ", "ꂿ", "ꃀ", "ꃁ", "ꃂ", "ꃃ", "ꃄ", "ꃅ",
          "ꃆ", "ꃇ", "ꃈ", "ꃉ", "ꃊ", "ꃋ", "ꃌ", "ꃍ", "ꃎ", "ꃏ", "ꃐ", "ꃑ", "ꃒ", "ꃓ", "ꃔ", "ꃕ", "ꃖ", "ꃗ", "ꃘ", "ꃙ", "ꃚ", "ꃛ",
          "ꃜ", "ꃝ", "ꃞ", "ꃟ", "ꃠ", "ꃡ", "ꃢ", "ꃣ", "ꃤ", "ꃥ", "ꃦ", "ꃧ", "ꃨ", "ꃩ", "ꃪ", "ꃫ", "ꃬ", "ꃭ", "ꃮ", "ꃯ", "ꃰ", "ꃱ",
          "ꃲ", "ꃳ", "ꃴ", "ꃵ", "ꃶ", "ꃷ", "ꃸ", "ꃹ", "ꃺ", "ꃻ", "ꃼ", "ꃽ", "ꃾ", "ꃿ", "ꄀ", "ꄁ", "ꄂ", "ꄃ", "ꄄ", "ꄅ", "ꄆ", "ꄇ",
          "ꄈ", "ꄉ", "ꄊ", "ꄋ", "ꄌ", "ꄍ", "ꄎ", "ꄏ", "ꄐ", "ꄑ", "ꄒ", "ꄓ", "ꄔ", "ꄕ", "ꄖ", "ꄗ", "ꄘ", "ꄙ", "ꄚ", "ꄛ", "ꄜ", "ꄝ",
          "ꄞ", "ꄟ", "ꄠ", "ꄡ", "ꄢ", "ꄣ", "ꄤ", "ꄥ", "ꄦ", "ꄧ", "ꄨ", "ꄩ", "ꄪ", "ꄫ", "ꄬ", "ꄭ", "ꄮ", "ꄯ", "ꄰ", "ꄱ", "ꄲ", "ꄳ",
          "ꄴ", "ꄵ", "ꄶ", "ꄷ", "ꄸ", "ꄹ", "ꄺ", "ꄻ", "ꄼ", "ꄽ", "ꄾ", "ꄿ", "ꅀ", "ꅁ", "ꅂ", "ꅃ", "ꅄ", "ꅅ", "ꅆ", "ꅇ", "ꅈ", "ꅉ",
          "ꅊ", "ꅋ", "ꅌ", "ꅍ", "ꅎ", "ꅏ", "ꅐ", "ꅑ", "ꅒ", "ꅓ", "ꅔ", "ꅕ", "ꅖ", "ꅗ", "ꅘ", "ꅙ", "ꅚ", "ꅛ", "ꅜ", "ꅝ", "ꅞ", "ꅟ",
          "ꅠ", "ꅡ", "ꅢ", "ꅣ", "ꅤ", "ꅥ", "ꅦ", "ꅧ", "ꅨ", "ꅩ", "ꅪ", "ꅫ", "ꅬ", "ꅭ", "ꅮ", "ꅯ", "ꅰ", "ꅱ", "ꅲ", "ꅳ", "ꅴ", "ꅵ",
          "ꅶ", "ꅷ", "ꅸ", "ꅹ", "ꅺ", "ꅻ", "ꅼ", "ꅽ", "ꅾ", "ꅿ", "ꆀ", "ꆁ", "ꆂ", "ꆃ", "ꆄ", "ꆅ", "ꆆ", "ꆇ", "ꆈ", "ꆉ", "ꆊ", "ꆋ",
          "ꆌ", "ꆍ", "ꆎ", "ꆏ", "ꆐ", "ꆑ", "ꆒ", "ꆓ", "ꆔ", "ꆕ", "ꆖ", "ꆗ", "ꆘ", "ꆙ", "ꆚ", "ꆛ", "ꆜ", "ꆝ", "ꆞ", "ꆟ", "ꆠ", "ꆡ",
          "ꆢ", "ꆣ", "ꆤ", "ꆥ", "ꆦ", "ꆧ", "ꆨ", "ꆩ", "ꆪ", "ꆫ", "ꆬ", "ꆭ", "ꆮ", "ꆯ", "ꆰ", "ꆱ", "ꆲ", "ꆳ", "ꆴ", "ꆵ", "ꆶ", "ꆷ",
          "ꆸ", "ꆹ", "ꆺ", "ꆻ", "ꆼ", "ꆽ", "ꆾ", "ꆿ", "ꇀ", "ꇁ", "ꇂ", "ꇃ", "ꇄ", "ꇅ", "ꇆ", "ꇇ", "ꇈ", "ꇉ", "ꇊ", "ꇋ", "ꇌ", "ꇍ",
          "ꇎ", "ꇏ", "ꇐ", "ꇑ", "ꇒ", "ꇓ", "ꇔ", "ꇕ", "ꇖ", "ꇗ", "ꇘ", "ꇙ", "ꇚ", "ꇛ", "ꇜ", "ꇝ", "ꇞ", "ꇟ", "ꇠ", "ꇡ", "ꇢ", "ꇣ",
          "ꇤ", "ꇥ", "ꇦ", "ꇧ", "ꇨ", "ꇩ", "ꇪ", "ꇫ", "ꇬ", "ꇭ", "ꇮ", "ꇯ", "ꇰ", "ꇱ", "ꇲ", "ꇳ", "ꇴ", "ꇵ", "ꇶ", "ꇷ", "ꇸ", "ꇹ",
          "ꇺ", "ꇻ", "ꇼ", "ꇽ", "ꇾ", "ꇿ", "ꈀ", "ꈁ", "ꈂ", "ꈃ", "ꈄ", "ꈅ", "ꈆ", "ꈇ", "ꈈ", "ꈉ", "ꈊ", "ꈋ", "ꈌ", "ꈍ", "ꈎ", "ꈏ",
          "ꈐ", "ꈑ", "ꈒ", "ꈓ", "ꈔ", "ꈕ", "ꈖ", "ꈗ", "ꈘ", "ꈙ", "ꈚ", "ꈛ", "ꈜ", "ꈝ", "ꈞ", "ꈟ", "ꈠ", "ꈡ", "ꈢ", "ꈣ", "ꈤ", "ꈥ",
          "ꈦ", "ꈧ", "ꈨ", "ꈩ", "ꈪ", "ꈫ", "ꈬ", "ꈭ", "ꈮ", "ꈯ", "ꈰ", "ꈱ", "ꈲ", "ꈳ", "ꈴ", "ꈵ", "ꈶ", "ꈷ", "ꈸ", "ꈹ", "ꈺ", "ꈻ",
          "ꈼ", "ꈽ", "ꈾ", "ꈿ", "ꉀ", "ꉁ", "ꉂ", "ꉃ", "ꉄ", "ꉅ", "ꉆ", "ꉇ", "ꉈ", "ꉉ", "ꉊ", "ꉋ", "ꉌ", "ꉍ", "ꉎ", "ꉏ", "ꉐ", "ꉑ",
          "ꉒ", "ꉓ", "ꉔ", "ꉕ", "ꉖ", "ꉗ", "ꉘ", "ꉙ", "ꉚ", "ꉛ", "ꉜ", "ꉝ", "ꉞ", "ꉟ", "ꉠ", "ꉡ", "ꉢ", "ꉣ", "ꉤ", "ꉥ", "ꉦ", "ꉧ",
          "ꉨ", "ꉩ", "ꉪ", "ꉫ", "ꉬ", "ꉭ", "ꉮ", "ꉯ", "ꉰ", "ꉱ", "ꉲ", "ꉳ", "ꉴ", "ꉵ", "ꉶ", "ꉷ", "ꉸ", "ꉹ", "ꉺ", "ꉻ", "ꉼ", "ꉽ",
          "ꉾ", "ꉿ", "ꊀ", "ꊁ", "ꊂ", "ꊃ", "ꊄ", "ꊅ", "ꊆ", "ꊇ", "ꊈ", "ꊉ", "ꊊ", "ꊋ", "ꊌ", "ꊍ", "ꊎ", "ꊏ", "ꊐ", "ꊑ", "ꊒ", "ꊓ",
          "ꊔ", "ꊕ", "ꊖ", "ꊗ", "ꊘ", "ꊙ", "ꊚ", "ꊛ", "ꊜ", "ꊝ", "ꊞ", "ꊟ", "ꊠ", "ꊡ", "ꊢ", "ꊣ", "ꊤ", "ꊥ", "ꊦ", "ꊧ", "ꊨ", "ꊩ",
          "ꊪ", "ꊫ", "ꊬ", "ꊭ", "ꊮ", "ꊯ", "ꊰ", "ꊱ", "ꊲ", "ꊳ", "ꊴ", "ꊵ", "ꊶ", "ꊷ", "ꊸ", "ꊹ", "ꊺ", "ꊻ", "ꊼ", "ꊽ", "ꊾ", "ꊿ",
          "ꋀ", "ꋁ", "ꋂ", "ꋃ", "ꋄ", "ꋅ", "ꋆ", "ꋇ", "ꋈ", "ꋉ", "ꋊ", "ꋋ", "ꋌ", "ꋍ", "ꋎ", "ꋏ", "ꋐ", "ꋑ", "ꋒ", "ꋓ", "ꋔ", "ꋕ",
          "ꋖ", "ꋗ", "ꋘ", "ꋙ", "ꋚ", "ꋛ", "ꋜ", "ꋝ", "ꋞ", "ꋟ", "ꋠ", "ꋡ", "ꋢ", "ꋣ", "ꋤ", "ꋥ", "ꋦ", "ꋧ", "ꋨ", "ꋩ", "ꋪ", "ꋫ",
          "ꋬ", "ꋭ", "ꋮ", "ꋯ", "ꋰ", "ꋱ", "ꋲ", "ꋳ", "ꋴ", "ꋵ", "ꋶ", "ꋷ", "ꋸ", "ꋹ", "ꋺ", "ꋻ", "ꋼ", "ꋽ", "ꋾ", "ꋿ", "ꌀ", "ꌁ",
          "ꌂ", "ꌃ", "ꌄ", "ꌅ", "ꌆ", "ꌇ", "ꌈ", "ꌉ", "ꌊ", "ꌋ", "ꌌ", "ꌍ", "ꌎ", "ꌏ", "ꌐ", "ꌑ", "ꌒ", "ꌓ", "ꌔ", "ꌕ", "ꌖ", "ꌗ",
          "ꌘ", "ꌙ", "ꌚ", "ꌛ", "ꌜ", "ꌝ", "ꌞ", "ꌟ", "ꌠ", "ꌡ", "ꌢ", "ꌣ", "ꌤ", "ꌥ", "ꌦ", "ꌧ", "ꌨ", "ꌩ", "ꌪ", "ꌫ", "ꌬ", "ꌭ",
          "ꌮ", "ꌯ", "ꌰ", "ꌱ", "ꌲ", "ꌳ", "ꌴ", "ꌵ", "ꌶ", "ꌷ", "ꌸ", "ꌹ", "ꌺ", "ꌻ", "ꌼ", "ꌽ", "ꌾ", "ꌿ", "ꍀ", "ꍁ", "ꍂ", "ꍃ",
          "ꍄ", "ꍅ", "ꍆ", "ꍇ", "ꍈ", "ꍉ", "ꍊ", "ꍋ", "ꍌ", "ꍍ", "ꍎ", "ꍏ", "ꍐ", "ꍑ", "ꍒ", "ꍓ", "ꍔ", "ꍕ", "ꍖ", "ꍗ", "ꍘ", "ꍙ",
          "ꍚ", "ꍛ", "ꍜ", "ꍝ", "ꍞ", "ꍟ", "ꍠ", "ꍡ", "ꍢ", "ꍣ", "ꍤ", "ꍥ", "ꍦ", "ꍧ", "ꍨ", "ꍩ", "ꍪ", "ꍫ", "ꍬ", "ꍭ", "ꍮ", "ꍯ",
          "ꍰ", "ꍱ", "ꍲ", "ꍳ", "ꍴ", "ꍵ", "ꍶ", "ꍷ", "ꍸ", "ꍹ", "ꍺ", "ꍻ", "ꍼ", "ꍽ", "ꍾ", "ꍿ", "ꎀ", "ꎁ", "ꎂ", "ꎃ", "ꎄ", "ꎅ",
          "ꎆ", "ꎇ", "ꎈ", "ꎉ", "ꎊ", "ꎋ", "ꎌ", "ꎍ", "ꎎ", "ꎏ", "ꎐ", "ꎑ", "ꎒ", "ꎓ", "ꎔ", "ꎕ", "ꎖ", "ꎗ", "ꎘ", "ꎙ", "ꎚ", "ꎛ",
          "ꎜ", "ꎝ", "ꎞ", "ꎟ", "ꎠ", "ꎡ", "ꎢ", "ꎣ", "ꎤ", "ꎥ", "ꎦ", "ꎧ", "ꎨ", "ꎩ", "ꎪ", "ꎫ", "ꎬ", "ꎭ", "ꎮ", "ꎯ", "ꎰ", "ꎱ",
          "ꎲ", "ꎳ", "ꎴ", "ꎵ", "ꎶ", "ꎷ", "ꎸ", "ꎹ", "ꎺ", "ꎻ", "ꎼ", "ꎽ", "ꎾ", "ꎿ", "ꏀ", "ꏁ", "ꏂ", "ꏃ", "ꏄ", "ꏅ", "ꏆ", "ꏇ",
          "ꏈ", "ꏉ", "ꏊ", "ꏋ", "ꏌ", "ꏍ", "ꏎ", "ꏏ", "ꏐ", "ꏑ", "ꏒ", "ꏓ", "ꏔ", "ꏕ", "ꏖ", "ꏗ", "ꏘ", "ꏙ", "ꏚ", "ꏛ", "ꏜ", "ꏝ",
          "ꏞ", "ꏟ", "ꏠ", "ꏡ", "ꏢ", "ꏣ", "ꏤ", "ꏥ", "ꏦ", "ꏧ", "ꏨ", "ꏩ", "ꏪ", "ꏫ", "ꏬ", "ꏭ", "ꏮ", "ꏯ", "ꏰ", "ꏱ", "ꏲ", "ꏳ",
          "ꏴ", "ꏵ", "ꏶ", "ꏷ", "ꏸ", "ꏹ", "ꏺ", "ꏻ", "ꏼ", "ꏽ", "ꏾ", "ꏿ", "ꐀ", "ꐁ", "ꐂ", "ꐃ", "ꐄ", "ꐅ", "ꐆ", "ꐇ", "ꐈ", "ꐉ",
          "ꐊ", "ꐋ", "ꐌ", "ꐍ", "ꐎ", "ꐏ", "ꐐ", "ꐑ", "ꐒ", "ꐓ", "ꐔ", "ꐕ", "ꐖ", "ꐗ", "ꐘ", "ꐙ", "ꐚ", "ꐛ", "ꐜ", "ꐝ", "ꐞ", "ꐟ",
          "ꐠ", "ꐡ", "ꐢ", "ꐣ", "ꐤ", "ꐥ", "ꐦ", "ꐧ", "ꐨ", "ꐩ", "ꐪ", "ꐫ", "ꐬ", "ꐭ", "ꐮ", "ꐯ", "ꐰ", "ꐱ", "ꐲ", "ꐳ", "ꐴ", "ꐵ",
          "ꐶ", "ꐷ", "ꐸ", "ꐹ", "ꐺ", "ꐻ", "ꐼ", "ꐽ", "ꐾ", "ꐿ", "ꑀ", "ꑁ", "ꑂ", "ꑃ", "ꑄ", "ꑅ", "ꑆ", "ꑇ", "ꑈ", "ꑉ", "ꑊ", "ꑋ",
          "ꑌ", "ꑍ", "ꑎ", "ꑏ", "ꑐ", "ꑑ", "ꑒ", "ꑓ", "ꑔ", "ꑕ", "ꑖ", "ꑗ", "ꑘ", "ꑙ", "ꑚ", "ꑛ", "ꑜ", "ꑝ", "ꑞ", "ꑟ", "ꑠ", "ꑡ",
          "ꑢ", "ꑣ", "ꑤ", "ꑥ", "ꑦ", "ꑧ", "ꑨ", "ꑩ", "ꑪ", "ꑫ", "ꑬ", "ꑭ", "ꑮ", "ꑯ", "ꑰ", "ꑱ", "ꑲ", "ꑳ", "ꑴ", "ꑵ", "ꑶ", "ꑷ",
          "ꑸ", "ꑹ", "ꑺ", "ꑻ", "ꑼ", "ꑽ", "ꑾ", "ꑿ", "ꒀ", "ꒁ", "ꒂ", "ꒃ", "ꒄ", "ꒅ", "ꒆ", "ꒇ", "ꒈ", "ꒉ", "ꒊ", "ꒋ", "ꒌ", "꒐",
          "꒑", "꒒", "꒓", "꒔", "꒕", "꒖", "꒗", "꒘", "꒙", "꒚", "꒛", "꒜", "꒝", "꒞", "꒟", "꒠", "꒡", "꒢", "꒣", "꒤", "꒥", "꒦",
          "꒧", "꒨", "꒩", "꒪", "꒫", "꒬", "꒭", "꒮", "꒯", "꒰", "꒱", "꒲", "꒳", "꒴", "꒵", "꒶", "꒷", "꒸", "꒹", "꒺", "꒻", "꒼",
          "꒽", "꒾", "꒿", "꓀", "꓁", "꓂", "꓃", "꓄", "꓅", "꓆",
        ]
      ),
    ]
  )
}
