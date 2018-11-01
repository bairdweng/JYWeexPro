//
//  JYMainViewController.swift
//  JYWeexPro
//
//  Created by Baird-weng on 2018/10/31.
//  Copyright © 2018年 JY. All rights reserved.
//

import UIKit
import WXDevtool
class JYMainViewController: JYWeexBaseViewController {

    override func viewDidLoad() {
        self.url = JYJsFileManage.sing.getFullPath(fileName: "index")
        super.viewDidLoad()
        
//        WXDevTool.setDebug(true)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
