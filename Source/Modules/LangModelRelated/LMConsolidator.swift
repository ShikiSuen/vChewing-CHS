// Copyright (c) 2021 and onwards The vChewing Project (MIT-NTL License).
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

import Foundation

extension vChewing {
  public enum LMConsolidator {
    public static let kPragmaHeader = "# 𝙵𝙾𝚁𝙼𝙰𝚃 𝚘𝚛𝚐.𝚊𝚝𝚎𝚕𝚒𝚎𝚛𝙸𝚗𝚖𝚞.𝚟𝚌𝚑𝚎𝚠𝚒𝚗𝚐.𝚞𝚜𝚎𝚛𝙻𝚊𝚗𝚐𝚞𝚊𝚐𝚎𝙼𝚘𝚍𝚎𝚕𝙳𝚊𝚝𝚊.𝚏𝚘𝚛𝚖𝚊𝚝𝚝𝚎𝚍"

    public static func checkPragma(path: String) -> Bool {
      if FileManager.default.fileExists(atPath: path) {
        let fileHandle = FileHandle(forReadingAtPath: path)!
        do {
          let lineReader = try LineReader(file: fileHandle)
          for strLine in lineReader {  // 不需要 i=0，因為第一遍迴圈就出結果。
            if strLine != kPragmaHeader {
              IME.prtDebugIntel("Header Mismatch, Starting In-Place Consolidation.")
              return false
            } else {
              IME.prtDebugIntel("Header Verification Succeeded: \(strLine).")
              return true
            }
          }
        } catch {
          IME.prtDebugIntel("Header Verification Failed: File Access Error.")
          return false
        }
      }
      IME.prtDebugIntel("Header Verification Failed: File Missing.")
      return false
    }

    @discardableResult public static func fixEOF(path: String) -> Bool {
      let urlPath = URL(fileURLWithPath: path)
      if FileManager.default.fileExists(atPath: path) {
        var strIncoming = ""
        do {
          strIncoming += try String(contentsOf: urlPath, encoding: .utf8)
          if !strIncoming.hasSuffix("\n") {
            IME.prtDebugIntel("EOF Fix Necessity Confirmed, Start Fixing.")
            if let writeFile = FileHandle(forUpdatingAtPath: path),
              let endl = "\n".data(using: .utf8)
            {
              writeFile.seekToEndOfFile()
              writeFile.write(endl)
              writeFile.closeFile()
            } else {
              return false
            }
          }
        } catch {
          IME.prtDebugIntel("EOF Fix Failed w/ File: \(path)")
          IME.prtDebugIntel("EOF Fix Failed w/ Error: \(error).")
          return false
        }
        IME.prtDebugIntel("EOF Successfully Ensured (with possible autofixes performed).")
        return true
      }
      IME.prtDebugIntel("EOF Fix Failed: File Missing at \(path).")
      return false
    }

    @discardableResult public static func consolidate(path: String, pragma shouldCheckPragma: Bool) -> Bool {
      var pragmaResult = false
      if shouldCheckPragma {
        pragmaResult = checkPragma(path: path)
        if pragmaResult {
          return true
        }
      }

      let urlPath = URL(fileURLWithPath: path)
      if FileManager.default.fileExists(atPath: path) {
        var strProcessed = ""
        do {
          strProcessed += try String(contentsOf: urlPath, encoding: .utf8)

          // Step 1: Consolidating formats per line.
          // -------
          // CJKWhiteSpace (\x{3000}) to ASCII Space
          // NonBreakWhiteSpace (\x{A0}) to ASCII Space
          // Tab to ASCII Space
          // 統整連續空格為一個 ASCII 空格
          strProcessed.regReplace(pattern: #"( +|　+| +|\t+)+"#, replaceWith: " ")
          // 去除行尾行首空格
          strProcessed.regReplace(pattern: #"(^ | $)"#, replaceWith: "")
          // CR & FF to LF, 且去除重複行
          strProcessed.regReplace(pattern: #"(\f+|\r+|\n+)+"#, replaceWith: "\n")
          if strProcessed.prefix(1) == " " {  // 去除檔案開頭空格
            strProcessed.removeFirst()
          }
          if strProcessed.suffix(1) == " " {  // 去除檔案結尾空格
            strProcessed.removeLast()
          }

          // Step 3: Add Formatted Pragma, the Sorted Header:
          if !pragmaResult {
            strProcessed = kPragmaHeader + "\n" + strProcessed  // Add Sorted Header
          }

          // Step 4: Deduplication.
          let arrData = strProcessed.split(separator: "\n")
          // 下面兩行的 reversed 是首尾顛倒，免得破壞最新的 override 資訊。
          let arrDataDeduplicated = Array(NSOrderedSet(array: arrData.reversed()).array as! [String])
          strProcessed = arrDataDeduplicated.reversed().joined(separator: "\n") + "\n"

          // Step 5: Remove duplicated newlines at the end of the file.
          strProcessed.regReplace(pattern: "\\n+", replaceWith: "\n")

          // Step 6: Write consolidated file contents.
          try strProcessed.write(to: urlPath, atomically: false, encoding: .utf8)

        } catch {
          IME.prtDebugIntel("Consolidation Failed w/ File: \(path)")
          IME.prtDebugIntel("Consolidation Failed w/ Error: \(error).")
          return false
        }
        IME.prtDebugIntel("Either Consolidation Successful Or No-Need-To-Consolidate.")
        return true
      }
      IME.prtDebugIntel("Consolidation Failed: File Missing at \(path).")
      return false
    }
  }
}

// MARK: - String Extension

extension String {
  fileprivate mutating func regReplace(pattern: String, replaceWith: String = "") {
    // Ref: https://stackoverflow.com/a/40993403/4162914 && https://stackoverflow.com/a/71291137/4162914
    do {
      let regex = try NSRegularExpression(
        pattern: pattern, options: [.caseInsensitive, .anchorsMatchLines]
      )
      let range = NSRange(startIndex..., in: self)
      self = regex.stringByReplacingMatches(
        in: self, options: [], range: range, withTemplate: replaceWith
      )
    } catch { return }
  }
}
