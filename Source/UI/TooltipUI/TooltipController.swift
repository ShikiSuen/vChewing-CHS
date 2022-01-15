//
// TooltipContainer.swift
//
// Copyright (c) 2021-2022 The vChewing Project.
// Copyright (c) 2011-2022 The OpenVanilla Project.
//
// Contributors:
//     Weizhong Yang (@zonble) @ OpenVanilla
//     Shiki Suen (@ShikiSuen) @ vChewing // Color tweaks only
//
// Based on the Syrup Project and the Formosana Library
// by Lukhnos Liu (@lukhnos).
//
// Permission is hereby granted, free of charge, to any person
// obtaining a copy of this software and associated documentation
// files (the "Software"), to deal in the Software without
// restriction, including without limitation the rights to use,
// copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the
// Software is furnished to do so, subject to the following
// conditions:
//
// The above copyright notice and this permission notice shall be
// included in all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
// OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
// NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
// HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
// WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
// FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
// OTHER DEALINGS IN THE SOFTWARE.
//

import Cocoa

public class TooltipController: NSWindowController {
    private let backgroundColor =  NSColor.windowBackgroundColor
    private var messageTextField: NSTextField
    private var tooltip: String  = "" {
        didSet {
            messageTextField.stringValue = tooltip
            adjustSize()
        }
    }

    public init() {
        let contentRect = NSRect(x: 128.0, y: 128.0, width: 300.0, height: 20.0)
        let styleMask: NSWindow.StyleMask = [.borderless, .nonactivatingPanel]
        let panel = NSPanel(contentRect: contentRect, styleMask: styleMask, backing: .buffered, defer: false)
        panel.level = NSWindow.Level(Int(kCGPopUpMenuWindowLevel) + 1)
        panel.hasShadow = true

        messageTextField = NSTextField()
        messageTextField.isEditable = false
        messageTextField.isSelectable = false
        messageTextField.isBezeled = false
        messageTextField.textColor = NSColor.textColor
        messageTextField.drawsBackground = true
        messageTextField.backgroundColor = backgroundColor
        messageTextField.font = .systemFont(ofSize: NSFont.systemFontSize(for: .small))
        panel.contentView?.addSubview(messageTextField)

        super.init(window: panel)
    }

    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc(showTooltip:atPoint:)
    public func show(tooltip: String, at point: NSPoint) {
        self.tooltip = tooltip
        window?.orderFront(nil)
        set(windowLocation: point)
    }

    @objc
    public func hide() {
        window?.orderOut(nil)
    }

    private func set(windowLocation location: NSPoint) {
        var newPoint = location
        if location.y > 5 {
            newPoint.y -= 5
        }
        window?.setFrameTopLeftPoint(newPoint)
    }

    private func adjustSize() {
        let attrString = messageTextField.attributedStringValue;
        var rect = attrString.boundingRect(with: NSSize(width: 1600.0, height: 1600.0), options: .usesLineFragmentOrigin)
        rect.size.width += 10
        messageTextField.frame = rect
        window?.setFrame(rect, display: true)
    }

}
