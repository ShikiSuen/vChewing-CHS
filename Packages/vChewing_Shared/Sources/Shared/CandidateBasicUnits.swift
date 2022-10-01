// (c) 2022 and onwards The vChewing Project (MIT-NTL License).
// ====================
// This code is released under the MIT license (SPDX-License-Identifier: MIT)
// ... with NTL restriction stating that:
// No trademark license is granted to use the trade names, trademarks, service
// marks, or product names of Contributor, except as required to fulfill notice
// requirements defined in MIT License.

import Cocoa

// MARK: - Classes used by Candidate Window

/// 用來管理選字窗內顯示的候選字的單位。用 class 型別會比較方便一些。
public class CandidateCellData: Hashable {
  public var locale = ""
  public static var unifiedSize: Double = 16
  public static var highlightBackground: NSColor = {
    if #available(macOS 10.14, *) {
      return .selectedContentBackgroundColor
    }
    return NSColor.alternateSelectedControlColor
  }()

  public var key: String
  public var displayedText: String
  public var size: Double { Self.unifiedSize }
  public var isSelected: Bool = false
  public var whichRow: Int = 0  // 橫排選字窗專用
  public var whichColumn: Int = 0  // 縱排選字窗專用
  public var index: Int = 0
  public var subIndex: Int = 0

  public var fontSizeCandidate: Double { CandidateCellData.unifiedSize }
  public var fontSizeKey: Double { ceil(CandidateCellData.unifiedSize * 0.8) }
  public var fontColorKey: NSColor {
    isSelected ? .selectedMenuItemTextColor.withAlphaComponent(0.8) : .secondaryLabelColor
  }

  public var fontColorCandidate: NSColor { isSelected ? .selectedMenuItemTextColor : .labelColor }

  public init(key: String, displayedText: String, isSelected: Bool = false) {
    self.key = key
    self.displayedText = displayedText
    self.isSelected = isSelected
  }

  public var cellLength: Int {
    if displayedText.count <= 2 { return Int(ceil(size * 3)) }
    let rect = attributedStringForLengthCalculation.boundingRect(
      with: NSSize(width: 1600.0, height: 1600.0), options: [.usesLineFragmentOrigin]
    )
    let rawResult = ceil(rect.width)
    return Int(rawResult)
  }

  public var attributedStringHeader: NSAttributedString {
    let paraStyleKey = NSMutableParagraphStyle()
    paraStyleKey.setParagraphStyle(NSParagraphStyle.default)
    paraStyleKey.alignment = .natural
    let paraStyle = NSMutableParagraphStyle()
    paraStyle.setParagraphStyle(NSParagraphStyle.default)
    paraStyle.alignment = .natural
    let theFontForCandidateKey: NSFont = {
      if #available(macOS 10.15, *) {
        return NSFont.monospacedSystemFont(ofSize: size * 0.7, weight: .regular)
      }
      return NSFont.monospacedDigitSystemFont(ofSize: size * 0.7, weight: .regular)
    }()
    var attrKey: [NSAttributedString.Key: AnyObject] = [
      .font: theFontForCandidateKey,
      .paragraphStyle: paraStyleKey,
    ]
    if isSelected {
      attrKey[.foregroundColor] = NSColor.white.withAlphaComponent(0.8)
    } else {
      attrKey[.foregroundColor] = NSColor.secondaryLabelColor
    }
    let attrStrKey = NSMutableAttributedString(string: key, attributes: attrKey)
    return attrStrKey
  }

  public var attributedStringForLengthCalculation: NSAttributedString {
    let paraStyleKey = NSMutableParagraphStyle()
    paraStyleKey.setParagraphStyle(NSParagraphStyle.default)
    paraStyleKey.alignment = .natural
    let paraStyle = NSMutableParagraphStyle()
    paraStyle.setParagraphStyle(NSParagraphStyle.default)
    paraStyle.alignment = .natural
    paraStyle.lineBreakMode = .byWordWrapping
    let attrCandidate: [NSAttributedString.Key: AnyObject] = [
      .font: NSFont.monospacedDigitSystemFont(ofSize: size, weight: .regular),
      .paragraphStyle: paraStyle,
    ]
    let attrStrCandidate = NSMutableAttributedString(string: displayedText + "　", attributes: attrCandidate)
    return attrStrCandidate
  }

  public var attributedString: NSAttributedString {
    let paraStyleKey = NSMutableParagraphStyle()
    paraStyleKey.setParagraphStyle(NSParagraphStyle.default)
    paraStyleKey.alignment = .natural
    let paraStyle = NSMutableParagraphStyle()
    paraStyle.setParagraphStyle(NSParagraphStyle.default)
    paraStyle.alignment = .natural
    paraStyle.lineBreakMode = .byWordWrapping
    var attrCandidate: [NSAttributedString.Key: AnyObject] = [
      .font: NSFont.monospacedDigitSystemFont(ofSize: size, weight: .regular),
      .paragraphStyle: paraStyle,
    ]
    if isSelected {
      attrCandidate[.foregroundColor] = NSColor.white
    } else {
      attrCandidate[.foregroundColor] = NSColor.labelColor
    }
    if #available(macOS 12, *) {
      if UserDefaults.standard.bool(forKey: UserDef.kHandleDefaultCandidateFontsByLangIdentifier.rawValue) {
        attrCandidate[.languageIdentifier] = self.locale as AnyObject
      }
    }
    let attrStrCandidate = NSMutableAttributedString(string: displayedText, attributes: attrCandidate)
    return attrStrCandidate
  }

  public static func == (lhs: CandidateCellData, rhs: CandidateCellData) -> Bool {
    lhs.key == rhs.key && lhs.displayedText == rhs.displayedText
  }

  public func hash(into hasher: inout Hasher) {
    hasher.combine(key)
    hasher.combine(displayedText)
  }
}
