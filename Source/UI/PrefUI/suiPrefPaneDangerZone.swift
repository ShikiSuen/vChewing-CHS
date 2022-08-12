// Copyright (c) 2021 and onwards The vChewing Project (MIT-NTL License).
// ====================
// This code is released under the MIT license (SPDX-License-Identifier: MIT)
// ... with NTL restriction stating that:
// No trademark license is granted to use the trade names, trademarks, service
// marks, or product names of Contributor, except as required to fulfill notice
// requirements defined in MIT License.

import SwiftUI

@available(macOS 10.15, *)
struct suiPrefPaneDangerZone: View {
  @State private var selUseIMKCandidateWindow: Bool = UserDefaults.standard.bool(
    forKey: UserDef.kUseIMKCandidateWindow.rawValue)
  @State private var selHandleDefaultCandidateFontsByLangIdentifier: Bool = UserDefaults.standard.bool(
    forKey: UserDef.kHandleDefaultCandidateFontsByLangIdentifier.rawValue)
  private let contentWidth: Double = {
    switch mgrPrefs.appleLanguages[0] {
      case "ja":
        return 520
      default:
        if mgrPrefs.appleLanguages[0].contains("zh-Han") {
          return 480
        } else {
          return 550
        }
    }
  }()

  var body: some View {
    Preferences.Container(contentWidth: contentWidth) {
      Preferences.Section(title: "", bottomDivider: true) {
        Text(
          LocalizedStringKey(
            "Warning: This page is for testing future features. \nFeatures listed here may not work as expected.")
        )
        .fixedSize(horizontal: false, vertical: true)
        Divider()
        Toggle(
          LocalizedStringKey("Use IMK Candidate Window instead (will reboot the IME)"),
          isOn: $selUseIMKCandidateWindow.onChange {
            mgrPrefs.useIMKCandidateWindow = selUseIMKCandidateWindow
          }
        )
        Text(LocalizedStringKey("Candidate selection keys are not yet available in IMK candidate window."))
          .preferenceDescription().fixedSize(horizontal: false, vertical: true)
        Toggle(
          LocalizedStringKey("Use .langIdentifier to handle UI font in candidate window"),
          isOn: $selHandleDefaultCandidateFontsByLangIdentifier.onChange {
            mgrPrefs.handleDefaultCandidateFontsByLangIdentifier = selHandleDefaultCandidateFontsByLangIdentifier
          }
        )
        Text(
          LocalizedStringKey(
            "This only works since macOS 12 with non-IMK candidate window as an alternative wordaround of Apple Bug Report #FB10978412. Apple should patch that for macOS 11 and later."
          )
        )
        .preferenceDescription().fixedSize(horizontal: false, vertical: true)
      }
    }
  }
}

@available(macOS 11.0, *)
struct suiPrefPaneDangerZone_Previews: PreviewProvider {
  static var previews: some View {
    suiPrefPaneDangerZone()
  }
}
