//
//  ViewController.swift
//  PasswordHacker
//
//  Created by Chihiro Nishiwaki on 2021/02/03.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var resultLabel1: UILabel!
    @IBOutlet var resultLabel2: UILabel!
    @IBOutlet var resultLabel3: UILabel!
    @IBOutlet var resultLabel4: UILabel!
    
    @IBOutlet var countLabel: UILabel!

    var password: Int! = 1234
    var flag: Int! = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        resultLabel1.text = "0"
        resultLabel2.text = "0"
        resultLabel3.text = "0"
        resultLabel4.text = "0"
        countLabel.text = "「START」ボタンを押して解析開始"
    }

    @IBAction func staart() {
        if flag == 0 {
            //iはどこで定義されているの？？型は自動で設定されているのかな？
            for i in 1...9999 {
                countLabel.text = "解析中...   " + String(i)
                RunLoop.main.run(until: Date(timeIntervalSinceNow: 0.0005))
                if i == password {
                    countLabel.text = "解析完了"
                    var digits = [Int]()
                    for _ in 0...3{
                        digits.append(password % 10)
                        print(digits)
                        password = password / 10
                    }
                    self.resultLabel1.text = String(digits[3])
                    self.resultLabel2.text = String(digits[2])
                    self.resultLabel3.text = String(digits[1])
                    self.resultLabel4.text = String(digits[0])
                    flag = 1
                    break
                }
            }
        }else{
            countLabel.text = "「RESET」ボタンを押してください"
        }
    }
    
    @IBAction func reset() {
        flag = 0
        password = Int.random(in: 0...9999)
        print(String(password))
        resultLabel1.text = "0"
        resultLabel2.text = "0"
        resultLabel3.text = "0"
        resultLabel4.text = "0"
        countLabel.text = "「START」ボタンを押して解析開始"
    }

}

