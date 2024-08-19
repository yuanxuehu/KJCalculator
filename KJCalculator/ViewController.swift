//
//  ViewController.swift
//  KJCalculator
//
//  Created by TigerHu on 2024/8/18.
//

import UIKit

class ViewController: UIViewController, KJBoardButtonInputDelegate {
    let board = KJBoard()
    let screen = KJScreen()
    //计算引擎实例
    let calculator = KJCalculatorEngine()
    //这个输入是否需要刷新显示屏
    var isNew = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        installUI()
    }
    
    func installUI() {
        //控制面板
        self.view.addSubview(board)
        board.delegate = self
        board.snp.makeConstraints { (maker) in
            maker.left.equalTo(0)
            maker.right.equalTo(0)
            maker.bottom.equalTo(0)
            maker.height.equalTo(board.superview!.snp.height).multipliedBy(2/3.0)
        }
        //显示屏
        self.view.addSubview(screen)
        screen.snp.makeConstraints { (maker) in
            maker.left.equalTo(0)
            maker.right.equalTo(0)
            maker.top.equalTo(0)
            maker.bottom.equalTo(board.snp.top)
        }
    }
    
    func boardButtonClick(content: String) {
       if content == "AC" || content == "Delete" || content == "=" {
           //功能逻辑处理
           switch content {
           case "AC":
               screen.clearContent()
               screen.refreshHistory()
           case "Delete":
               screen.deleteInput()
           case "=":
               let result = calculator.calculatEquation(equation: screen.inputString)
               //先刷新历史
               screen.refreshHistory()
               //清除输入的内容
               screen.clearContent()
               //将结果输入
               screen.inputContent(content: String(result))
               isNew = true
           default:
               screen.refreshHistory()
           }
           
       }else{
           if isNew {
               screen.clearContent()
               isNew = false
           }
           screen.inputContent(content: content)
       }
   }
}
