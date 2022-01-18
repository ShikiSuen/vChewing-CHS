/* 
 *  TooltipController.swift
 *  
 *  Copyright 2021-2022 vChewing Project (3-Clause BSD License).
 *  Derived from 2011-2022 OpenVanilla Project (MIT License).
 *  Some rights reserved. See "LICENSE.TXT" for details.
 */

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

    private func set(windowLocation windowTopLeftPoint: NSPoint) {

        var adjustedPoint = windowTopLeftPoint
        adjustedPoint.y -= 5

        var screenFrame = NSScreen.main?.visibleFrame ?? NSRect.zero
        for screen in NSScreen.screens {
            let frame = screen.visibleFrame
            if windowTopLeftPoint.x >= frame.minX &&
                windowTopLeftPoint.x <= frame.maxX &&
                windowTopLeftPoint.y >= frame.minY &&
                windowTopLeftPoint.y <= frame.maxY {
                screenFrame = frame
                break
            }
        }

        let windowSize = window?.frame.size ?? NSSize.zero

        // bottom beneath the screen?
        if adjustedPoint.y - windowSize.height < screenFrame.minY {
            adjustedPoint.y = screenFrame.minY + windowSize.height
        }

        // top over the screen?
        if adjustedPoint.y >= screenFrame.maxY {
            adjustedPoint.y = screenFrame.maxY - 1.0
        }

        // right
        if adjustedPoint.x + windowSize.width >= screenFrame.maxX {
            adjustedPoint.x = screenFrame.maxX - windowSize.width
        }

        // left
        if adjustedPoint.x < screenFrame.minX {
            adjustedPoint.x = screenFrame.minX
        }

        window?.setFrameTopLeftPoint(adjustedPoint)

    }

    private func adjustSize() {
        let attrString = messageTextField.attributedStringValue;
        var rect = attrString.boundingRect(with: NSSize(width: 1600.0, height: 1600.0), options: .usesLineFragmentOrigin)
        rect.size.width += 10
        messageTextField.frame = rect
        window?.setFrame(rect, display: true)
    }

}
