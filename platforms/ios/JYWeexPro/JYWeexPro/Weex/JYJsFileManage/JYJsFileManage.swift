//
//  JYJsFileManage.swift
//  JYWeexPro
//
//  Created by Baird-weng on 2018/10/23.
//  Copyright © 2018年 JY. All rights reserved.
//

import UIKit

class JYJsFileManage: NSObject {
    static let sing = JYJsFileManage()
    //获取完整路径
    func getFullPath(fileName:String)->URL{
        let file = Bundle.main.path(forResource: fileName, ofType: "js", inDirectory: "www")
        
        let ff = String(format: "file://%@", file ?? "")
        
        return URL(string: ff)!
    }
}
