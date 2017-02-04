//
//  browserViewController.swift
//  newCamiloStickers
//
//  Created by mzy36638 on 2/4/17.
//  Copyright © 2017 Catherine Espinosa. All rights reserved.
//

import Foundation

//

//  EnriqueAppBrowserViewController.swift

//  EnriqueApp

//

//  Created by Ruffles on 9/26/16.

//  Copyright © 2016 LatinasInNY. All rights reserved.

//


import Foundation

import UIKit

import Messages


class MessageBrowserViewController: MSStickerBrowserViewController {
    
    var stickers = [MSSticker]()
    
    var stickerNames = ["cam_eating", "cam_music", "cam_shy", "cam_surprise"]
    
    func loadStickers() {
        
        
        for stickerName in stickerNames {
            createSticker(asset:stickerName, localizedDescription: "Camilo's pics")
        }
        
    }
    
    
    func createSticker (asset: String, localizedDescription: String) {

        guard let stickerPath = Bundle.main.path(forResource: asset, ofType: "png") else {
            
            print ("couldn't create sticker path for", asset)
            
            return
            
        }
        
        let stickerURL = URL(fileURLWithPath: stickerPath)
        
        let sticker: MSSticker
        
        do {
            
            try sticker = MSSticker(contentsOfFileURL: stickerURL, localizedDescription: localizedDescription)
            
            stickers.append(sticker)
            
        } catch {
            
            print(error)
            
            return
            
        }
        
    }
    
    
    override func numberOfStickers(in stickerBrowserView: MSStickerBrowserView) -> Int {
        
        return stickers.count
        
    }
    
    
    override func stickerBrowserView(_ stickerBrowserView: MSStickerBrowserView, stickerAt index: Int) -> MSSticker {
        
        return stickers[index]
        
    }
    
}

