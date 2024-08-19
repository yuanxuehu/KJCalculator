//
//  KJFuncButton.swift
//  KJCalculator
//
//  Created by TigerHu on 2024/8/18.
//

import UIKit

class KJFuncButton: UIButton {

    init() {
        //要使用自动布局 这里的frame设置为(0,0,0,0)
        super.init(frame: CGRect.zero)
        //为按钮添加边框
        self.layer.borderWidth = 0.5;
        self.layer.borderColor = UIColor(red: 219/255.0, green: 219/255.0, blue: 219/255.0, alpha: 1).cgColor
        //设置字体与字体颜色
        self.setTitleColor(UIColor.blue, for: UIControl.State.normal)
        self.setTitleColor(UIColor.black, for: UIControl.State.highlighted)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 25)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

