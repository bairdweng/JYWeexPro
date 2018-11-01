//
//  JYScanPlugin.swift
//  JYWeexPro
//
//  Created by Baird-weng on 2018/11/1.
//  Copyright © 2018年 JY. All rights reserved.
//

import UIKit
@objc class JYScanPlugin: NSObject,ATPluginProtocol {
    func pluginDidLoad(withArgs args: [Any]!) {
        
    }
    
    func pluginWillOpen(inContainer container: UIViewController!, withArg args: [Any]!) {
        
    }
    
    func pluginWillClose() {
        
    }
    
    func pluginDidUnload() {
        
    }
    
    func wantReactArea() -> CGRect {
        return CGRect.zero
    }
    

  

}
