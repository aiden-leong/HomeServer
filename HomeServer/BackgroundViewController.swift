//
//  ViewController.swift
//  HomeServer
//
//  Created by ailion on 2017/7/30.
//  Copyright © 2017年 ailion. All rights reserved.
//

import Cocoa

class BackgroundViewController: NSViewController {
    
    @IBOutlet weak var backgroundImageView: NSImageView!
    
    var i = 0
    let fileManager = FileManager.default
    let homeDir = NSHomeDirectory()
    var homeServerDir = ""
    var imageArray:[String] = []
    var timer:Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        homeServerDir = "\(homeDir)/Desktop/HomeServer"
        try? fileManager.createDirectory(atPath: homeServerDir, withIntermediateDirectories: true, attributes: nil)
        
        do {
            let filePaths = try fileManager.contentsOfDirectory(atPath: homeServerDir)
            for filePath in filePaths {
                if filePath.hasSuffix(".jpg"){
                    imageArray.append(homeServerDir + "/" + filePath)
                }
            }
        } catch {
            print("Could not get folder: \(error)")
        }
        print(imageArray)
        
        backgroundImageView.imageScaling = .scaleProportionallyUpOrDown
        nextBackgroundImage()
        
        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(self.nextBackgroundImage), userInfo: nil, repeats: true)
        
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    func nextBackgroundImage(){
        if imageArray.count <= 0{
            return
        }
        switch i{
        case 0..<(imageArray.count - 1):
            backgroundImageView.image = NSImage(byReferencingFile: imageArray[i])
            i = i + 1
        default:
            backgroundImageView.image = NSImage(byReferencingFile: imageArray[i])
            i = 0
        }
        
    }
    
    @IBAction func imageClicked(_ sender: NSClickGestureRecognizer) {
        nextBackgroundImage()
    }
    
    
    
}

