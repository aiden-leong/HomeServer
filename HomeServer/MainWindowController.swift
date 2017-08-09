//
//  MainWindowController.swift
//  HomeServer
//
//  Created by ailion on 2017/8/5.
//  Copyright © 2017年 ailion. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()
    
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
        //window?.setFrame(NSScreen.main()!.visibleFrame, display: true, animate: true)
        window?.toggleFullScreen(nil)
    }

}
