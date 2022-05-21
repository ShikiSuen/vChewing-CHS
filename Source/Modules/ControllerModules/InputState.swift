// Copyright (c) 2011 and onwards The OpenVanilla Project (MIT License).
// All possible vChewing-specific modifications are of:
// (c) 2021 and onwards The vChewing Project (MIT-NTL License).
/*
Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

1. The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

2. No trademark license is granted to use the trade names, trademarks, service
marks, or product names of Contributor, except as required to fulfill notice
requirements above.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import Cocoa

/// Represents the states for the input method controller.
///
/// An input method is actually a finite state machine. It receives the inputs
/// from hardware like keyboard and mouse, changes its state, updates user
/// interface by the state, and finally produces the text output and then them
/// to the client apps. It should be a one-way data flow, and the user interface
/// and text output should follow unconditionally one single data source.
///
/// The InputState class is for representing what the input controller is doing,
/// and the place to store the variables that could be used. For example, the
/// array for the candidate list is useful only when the user is choosing a
/// candidate, and the array should not exist when the input controller is in
/// another state.
///
/// They are immutable objects. When the state changes, the controller should
/// create a new state object to replace the current state instead of modifying
/// the existing one.
///
/// vChewing's input controller has following possible states:
///
/// - Deactivated: The user is not using vChewing yet.
/// - Empty: The user has switched to vChewing but did not input anything yet,
///   or, he or she has committed text into the client apps and starts a new
///   input phase.
/// - Committing: The input controller is sending text to the client apps.
/// - Inputting: The user has inputted something and the input buffer is
///   visible.
/// - Marking: The user is creating a area in the input buffer and about to
///   create a new user phrase.
/// - Choosing Candidate: The candidate window is open to let the user to choose
///   one among the candidates.
class InputState {
  /// Represents that the input controller is deactivated.
  class Deactivated: InputState {
    var description: String {
      "<InputState.Deactivated>"
    }
  }

  // MARK: -

  /// Represents that the composing buffer is empty.
  class Empty: InputState {
    var composingBuffer: String {
      ""
    }

    var description: String {
      "<InputState.Empty>"
    }
  }

  // MARK: -

  /// Represents that the composing buffer is empty.
  class EmptyIgnoringPreviousState: InputState {
    var composingBuffer: String {
      ""
    }

    var description: String {
      "<InputState.EmptyIgnoringPreviousState>"
    }
  }

  // MARK: -

  /// Represents that the input controller is committing text into client app.
  class Committing: InputState {
    private(set) var poppedText: String = ""

    convenience init(poppedText: String) {
      self.init()
      self.poppedText = poppedText
    }

    var description: String {
      "<InputState.Committing poppedText:\(poppedText)>"
    }
  }

  // MARK: -

  /// Represents that the composing buffer is not empty.
  class NotEmpty: InputState {
    private(set) var composingBuffer: String
    private(set) var cursorIndex: UInt

    init(composingBuffer: String, cursorIndex: UInt) {
      self.composingBuffer = composingBuffer
      self.cursorIndex = cursorIndex
    }

    var description: String {
      "<InputState.NotEmpty, composingBuffer:\(composingBuffer), cursorIndex:\(cursorIndex)>"
    }
  }

  // MARK: -

  /// Represents that the user is inputting text.
  class Inputting: NotEmpty {
    var poppedText: String = ""
    var tooltip: String = ""

    override init(composingBuffer: String, cursorIndex: UInt) {
      super.init(composingBuffer: composingBuffer, cursorIndex: cursorIndex)
    }

    var attributedString: NSAttributedString {
      let attributedSting = NSAttributedString(
        string: composingBuffer,
        attributes: [
          .underlineStyle: NSUnderlineStyle.single.rawValue,
          .markedClauseSegment: 0,
        ]
      )
      return attributedSting
    }

    override var description: String {
      "<InputState.Inputting, composingBuffer:\(composingBuffer), cursorIndex:\(cursorIndex)>, poppedText:\(poppedText)>"
    }
  }

  // MARK: -

  private let kMinMarkRangeLength = 2
  private let kMaxMarkRangeLength = mgrPrefs.maxCandidateLength

  /// Represents that the user is marking a range in the composing buffer.
  class Marking: NotEmpty {
    private(set) var markerIndex: UInt
    private(set) var markedRange: NSRange
    private var deleteTargetExists = false
    var tooltip: String {
      if composingBuffer.count != readings.count {
        TooltipController.backgroundColor = NSColor(
          red: 0.55, green: 0.00, blue: 0.00, alpha: 1.00
        )
        TooltipController.textColor = NSColor.white
        return NSLocalizedString(
          "⚠︎ Unhandlable: Chars and Readings in buffer doesn't match.", comment: ""
        )
      }

      if mgrPrefs.phraseReplacementEnabled {
        TooltipController.backgroundColor = NSColor.purple
        TooltipController.textColor = NSColor.white
        return NSLocalizedString(
          "⚠︎ Phrase replacement mode enabled, interfering user phrase entry.", comment: ""
        )
      }
      if markedRange.length == 0 {
        return ""
      }

      let text = (composingBuffer as NSString).substring(with: markedRange)
      if markedRange.length < kMinMarkRangeLength {
        TooltipController.backgroundColor = NSColor(
          red: 0.18, green: 0.18, blue: 0.18, alpha: 1.00
        )
        TooltipController.textColor = NSColor(
          red: 0.86, green: 0.86, blue: 0.86, alpha: 1.00
        )
        return String(
          format: NSLocalizedString(
            "\"%@\" length must ≥ 2 for a user phrase.", comment: ""
          ), text
        )
      } else if markedRange.length > kMaxMarkRangeLength {
        TooltipController.backgroundColor = NSColor(
          red: 0.26, green: 0.16, blue: 0.00, alpha: 1.00
        )
        TooltipController.textColor = NSColor(
          red: 1.00, green: 0.60, blue: 0.00, alpha: 1.00
        )
        return String(
          format: NSLocalizedString(
            "\"%@\" length should ≤ %d for a user phrase.", comment: ""
          ),
          text, kMaxMarkRangeLength
        )
      }

      let (exactBegin, _) = (composingBuffer as NSString).characterIndex(
        from: markedRange.location)
      let (exactEnd, _) = (composingBuffer as NSString).characterIndex(
        from: markedRange.location + markedRange.length)
      let selectedReadings = readings[exactBegin..<exactEnd]
      let joined = selectedReadings.joined(separator: "-")
      let exist = mgrLangModel.checkIfUserPhraseExist(
        userPhrase: text, mode: ctlInputMethod.currentKeyHandler.inputMode, key: joined
      )
      if exist {
        deleteTargetExists = exist
        TooltipController.backgroundColor = NSColor(
          red: 0.00, green: 0.18, blue: 0.13, alpha: 1.00
        )
        TooltipController.textColor = NSColor(
          red: 0.00, green: 1.00, blue: 0.74, alpha: 1.00
        )
        return String(
          format: NSLocalizedString(
            "\"%@\" already exists: ENTER to boost, \n SHIFT+CMD+ENTER to exclude.", comment: ""
          ), text
        )
      }
      TooltipController.backgroundColor = NSColor(
        red: 0.18, green: 0.18, blue: 0.18, alpha: 1.00
      )
      TooltipController.textColor = NSColor.white
      return String(
        format: NSLocalizedString("\"%@\" selected. ENTER to add user phrase.", comment: ""),
        text
      )
    }

    var tooltipForInputting: String = ""
    private(set) var readings: [String]

    init(composingBuffer: String, cursorIndex: UInt, markerIndex: UInt, readings: [String]) {
      self.markerIndex = markerIndex
      let begin = min(cursorIndex, markerIndex)
      let end = max(cursorIndex, markerIndex)
      markedRange = NSRange(location: Int(begin), length: Int(end - begin))
      self.readings = readings
      super.init(composingBuffer: composingBuffer, cursorIndex: cursorIndex)
    }

    var attributedString: NSAttributedString {
      let attributedSting = NSMutableAttributedString(string: composingBuffer)
      let end = markedRange.location + markedRange.length

      attributedSting.setAttributes(
        [
          .underlineStyle: NSUnderlineStyle.single.rawValue,
          .markedClauseSegment: 0,
        ], range: NSRange(location: 0, length: markedRange.location)
      )
      attributedSting.setAttributes(
        [
          .underlineStyle: NSUnderlineStyle.thick.rawValue,
          .markedClauseSegment: 1,
        ], range: markedRange
      )
      attributedSting.setAttributes(
        [
          .underlineStyle: NSUnderlineStyle.single.rawValue,
          .markedClauseSegment: 2,
        ],
        range: NSRange(
          location: end,
          length: (composingBuffer as NSString).length - end
        )
      )
      return attributedSting
    }

    override var description: String {
      "<InputState.Marking, composingBuffer:\(composingBuffer), cursorIndex:\(cursorIndex), markedRange:\(markedRange)>"
    }

    var convertedToInputting: Inputting {
      let state = Inputting(composingBuffer: composingBuffer, cursorIndex: cursorIndex)
      state.tooltip = tooltipForInputting
      return state
    }

    var validToWrite: Bool {
      /// vChewing allows users to input a string whose length differs
      /// from the amount of Bopomofo readings. In this case, the range
      /// in the composing buffer and the readings could not match, so
      /// we disable the function to write user phrases in this case.
      if composingBuffer.count != readings.count {
        return false
      }
      if markedRange.length < kMinMarkRangeLength {
        return false
      }
      if markedRange.length > kMaxMarkRangeLength {
        return false
      }
      if ctlInputMethod.areWeDeleting, !deleteTargetExists {
        return false
      }
      return markedRange.length >= kMinMarkRangeLength
        && markedRange.length <= kMaxMarkRangeLength
    }

    var chkIfUserPhraseExists: Bool {
      let text = (composingBuffer as NSString).substring(with: markedRange)
      let (exactBegin, _) = (composingBuffer as NSString).characterIndex(
        from: markedRange.location)
      let (exactEnd, _) = (composingBuffer as NSString).characterIndex(
        from: markedRange.location + markedRange.length)
      let selectedReadings = readings[exactBegin..<exactEnd]
      let joined = selectedReadings.joined(separator: "-")
      return mgrLangModel.checkIfUserPhraseExist(
        userPhrase: text, mode: ctlInputMethod.currentKeyHandler.inputMode, key: joined
      )
        == true
    }

    var userPhrase: String {
      let text = (composingBuffer as NSString).substring(with: markedRange)
      let (exactBegin, _) = (composingBuffer as NSString).characterIndex(
        from: markedRange.location)
      let (exactEnd, _) = (composingBuffer as NSString).characterIndex(
        from: markedRange.location + markedRange.length)
      let selectedReadings = readings[exactBegin..<exactEnd]
      let joined = selectedReadings.joined(separator: "-")
      return "\(text) \(joined)"
    }

    var userPhraseConverted: String {
      let text =
        OpenCCBridge.crossConvert(
          (composingBuffer as NSString).substring(with: markedRange)) ?? ""
      let (exactBegin, _) = (composingBuffer as NSString).characterIndex(
        from: markedRange.location)
      let (exactEnd, _) = (composingBuffer as NSString).characterIndex(
        from: markedRange.location + markedRange.length)
      let selectedReadings = readings[exactBegin..<exactEnd]
      let joined = selectedReadings.joined(separator: "-")
      let convertedMark = "#𝙊𝙥𝙚𝙣𝘾𝘾"
      return "\(text) \(joined)\t\(convertedMark)"
    }
  }

  // MARK: -

  /// Represents that the user is choosing in a candidates list.
  class ChoosingCandidate: NotEmpty {
    private(set) var candidates: [String]
    private(set) var useVerticalMode: Bool

    init(composingBuffer: String, cursorIndex: UInt, candidates: [String], useVerticalMode: Bool) {
      self.candidates = candidates
      self.useVerticalMode = useVerticalMode
      super.init(composingBuffer: composingBuffer, cursorIndex: cursorIndex)
    }

    var attributedString: NSAttributedString {
      let attributedSting = NSAttributedString(
        string: composingBuffer,
        attributes: [
          .underlineStyle: NSUnderlineStyle.single.rawValue,
          .markedClauseSegment: 0,
        ]
      )
      return attributedSting
    }

    override var description: String {
      "<InputState.ChoosingCandidate, candidates:\(candidates), useVerticalMode:\(useVerticalMode),  composingBuffer:\(composingBuffer), cursorIndex:\(cursorIndex)>"
    }
  }

  // MARK: -

  /// Represents that the user is choosing in a candidates list
  /// in the associated phrases mode.
  class AssociatedPhrases: InputState {
    private(set) var candidates: [String] = []
    private(set) var useVerticalMode: Bool = false
    init(candidates: [String], useVerticalMode: Bool) {
      self.candidates = candidates
      self.useVerticalMode = useVerticalMode
      super.init()
    }

    var description: String {
      "<InputState.AssociatedPhrases, candidates:\(candidates), useVerticalMode:\(useVerticalMode)>"
    }
  }

  class SymbolTable: ChoosingCandidate {
    var node: SymbolNode

    init(node: SymbolNode, useVerticalMode: Bool) {
      self.node = node
      let candidates = node.children?.map(\.title) ?? [String]()
      super.init(
        composingBuffer: "", cursorIndex: 0, candidates: candidates,
        useVerticalMode: useVerticalMode
      )
    }

    // InputState.SymbolTable 這個狀態比較特殊，不能把真空組字區交出去。
    // 不然的話，在絕大多數終端機類應用當中、以及在 MS Word 等軟體當中
    // 會出現符號選字窗無法響應方向鍵的問題。
    // 如有誰要修奇摩注音的一點通選單的話，修復原理也是一樣的。
    // Crediting Qwertyyb: https://github.com/qwertyyb/Fire/issues/55#issuecomment-1133497700
    override var attributedString: NSAttributedString {
      let attributedSting = NSAttributedString(
        string: " ",
        attributes: [
          .underlineStyle: NSUnderlineStyle.single.rawValue,
          .markedClauseSegment: 0,
        ]
      )
      return attributedSting
    }

    override var description: String {
      "<InputState.SymbolTable, candidates:\(candidates), useVerticalMode:\(useVerticalMode),  composingBuffer:\(composingBuffer), cursorIndex:\(cursorIndex)>"
    }
  }
}

class SymbolNode {
  var title: String
  var children: [SymbolNode]?

  init(_ title: String, _ children: [SymbolNode]? = nil) {
    self.title = title
    self.children = children
  }

  init(_ title: String, symbols: String) {
    self.title = title
    children = Array(symbols).map { SymbolNode(String($0), nil) }
  }

  static let catCommonSymbols = String(
    format: NSLocalizedString("catCommonSymbols", comment: ""))
  static let catHoriBrackets = String(
    format: NSLocalizedString("catHoriBrackets", comment: ""))
  static let catVertBrackets = String(
    format: NSLocalizedString("catVertBrackets", comment: ""))
  static let catGreekLetters = String(
    format: NSLocalizedString("catGreekLetters", comment: ""))
  static let catMathSymbols = String(
    format: NSLocalizedString("catMathSymbols", comment: ""))
  static let catCurrencyUnits = String(
    format: NSLocalizedString("catCurrencyUnits", comment: ""))
  static let catSpecialSymbols = String(
    format: NSLocalizedString("catSpecialSymbols", comment: ""))
  static let catUnicodeSymbols = String(
    format: NSLocalizedString("catUnicodeSymbols", comment: ""))
  static let catCircledKanjis = String(
    format: NSLocalizedString("catCircledKanjis", comment: ""))
  static let catCircledKataKana = String(
    format: NSLocalizedString("catCircledKataKana", comment: ""))
  static let catBracketKanjis = String(
    format: NSLocalizedString("catBracketKanjis", comment: ""))
  static let catSingleTableLines = String(
    format: NSLocalizedString("catSingleTableLines", comment: ""))
  static let catDoubleTableLines = String(
    format: NSLocalizedString("catDoubleTableLines", comment: ""))
  static let catFillingBlocks = String(
    format: NSLocalizedString("catFillingBlocks", comment: ""))
  static let catLineSegments = String(
    format: NSLocalizedString("catLineSegments", comment: ""))

  static let root: SymbolNode = .init(
    "/",
    [
      SymbolNode("｀"),
      SymbolNode(catCommonSymbols, symbols: "，、。．？！；：‧‥﹐﹒˙·‘’“”〝〞‵′〃～＄％＠＆＃＊"),
      SymbolNode(catHoriBrackets, symbols: "（）「」〔〕｛｝〈〉『』《》【】﹙﹚﹝﹞﹛﹜"),
      SymbolNode(catVertBrackets, symbols: "︵︶﹁﹂︹︺︷︸︿﹀﹃﹄︽︾︻︼"),
      SymbolNode(
        catGreekLetters, symbols: "αβγδεζηθικλμνξοπρστυφχψωΑΒΓΔΕΖΗΘΙΚΛΜΝΞΟΠΡΣΤΥΦΧΨΩ"
      ),
      SymbolNode(catMathSymbols, symbols: "＋－×÷＝≠≒∞±√＜＞﹤﹥≦≧∩∪ˇ⊥∠∟⊿㏒㏑∫∮∵∴╳﹢"),
      SymbolNode(catCurrencyUnits, symbols: "$€¥¢£₽₨₩฿₺₮₱₭₴₦৲৳૱௹﷼₹₲₪₡₫៛₵₢₸₤₳₥₠₣₰₧₯₶₷"),
      SymbolNode(catSpecialSymbols, symbols: "↑↓←→↖↗↙↘↺⇧⇩⇦⇨⇄⇆⇅⇵↻◎○●⊕⊙※△▲☆★◇◆□■▽▼§￥〒￠￡♀♂↯"),
      SymbolNode(catUnicodeSymbols, symbols: "♨☀☁☂☃♠♥♣♦♩♪♫♬☺☻"),
      SymbolNode(catCircledKanjis, symbols: "㊟㊞㊚㊛㊊㊋㊌㊍㊎㊏㊐㊑㊒㊓㊔㊕㊖㊗︎㊘㊙︎㊜㊝㊠㊡㊢㊣㊤㊥㊦㊧㊨㊩㊪㊫㊬㊭㊮㊯㊰🈚︎🈯︎"),
      SymbolNode(
        catCircledKataKana, symbols: "㋐㋑㋒㋓㋔㋕㋖㋗㋘㋙㋚㋛㋜㋝㋞㋟㋠㋡㋢㋣㋤㋥㋦㋧㋨㋩㋪㋫㋬㋭㋮㋯㋰㋱㋲㋳㋴㋵㋶㋷㋸㋹㋺㋻㋼㋾"
      ),
      SymbolNode(catBracketKanjis, symbols: "㈪㈫㈬㈭㈮㈯㈰㈱㈲㈳㈴㈵㈶㈷㈸㈹㈺㈻㈼㈽㈾㈿㉀㉁㉂㉃"),
      SymbolNode(catSingleTableLines, symbols: "├─┼┴┬┤┌┐╞═╪╡│▕└┘╭╮╰╯"),
      SymbolNode(catDoubleTableLines, symbols: "╔╦╗╠═╬╣╓╥╖╒╤╕║╚╩╝╟╫╢╙╨╜╞╪╡╘╧╛"),
      SymbolNode(catFillingBlocks, symbols: "＿ˍ▁▂▃▄▅▆▇█▏▎▍▌▋▊▉◢◣◥◤"),
      SymbolNode(catLineSegments, symbols: "﹣﹦≡｜∣∥–︱—︳╴¯￣﹉﹊﹍﹎﹋﹌﹏︴∕﹨╱╲／＼"),
    ]
  )
}
