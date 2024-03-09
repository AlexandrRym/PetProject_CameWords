//
//  ViewController.swift
//  saddsew
//
//  Created by AlexRymar on 08.03.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var counter: UILabel!
    @IBOutlet weak var Description: UILabel!
    @IBOutlet weak var lengthLabel: UILabel!
    @IBOutlet weak var sayHiLabel: UILabel!
    
    open var Global_Answer:String = ""
    open var coint:Int = 0
    open var length:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lengthLabel.text = "0"
        self.counter.text = "0"
        self.Description.text = "Гарної гри"
        self.sayHiLabel.text = "👋"
        
    }
    
    @IBAction func ChooseAns(_ sender: Any) {
        
        let aletController  = UIAlertController(title: "Спробуй", message:  "Загадай слово", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default){
            (action) in
            let text = aletController.textFields?.first
            if (text?.text!)!.uppercased() == self.Global_Answer.uppercased(){
                self.alertWin()
                self.sayHiLabel.text? = "Переможець😎"
            }else{
                self.coint += 1
                self.counter.text = String(self.coint)
                self.sayHiLabel.text = "💭"
            }
        }
        aletController.addTextField()
        aletController.addAction(action)
        self.present(aletController, animated: true, completion: nil)
    }
    //MARK: button to words
    @IBAction func buton(_ sender: Any) {
        let aletController  = UIAlertController(title: "Загадайте слово", message: "Рекомендовано писати малими літерами", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default){
            (action) in
            self.Description.text = ""
            let text = aletController.textFields?.first
            self.Global_Answer = (text?.text!)!
            self.length = self.Global_Answer.count
            self.lengthLabel.text = String(self.length)
        }
        aletController.addTextField()
        aletController.addAction(action)
        self.present(aletController, animated: true, completion: nil)
    }
     //MARK:
    @IBAction func ButtonDescript(_ sender: Any) {
        let aletController  = UIAlertController(title: "Введіть опис", message:  "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default){
            (action) in
            let text = aletController.textFields?.first
            self.Description.text = (text?.text!)!
        }
        aletController.addTextField()
        aletController.addAction(action)
        self.present(aletController, animated: true, completion: nil)
    }
    
    func alertWin(){
        let aletController  = UIAlertController(title: "Вітаю🎉", message: "Ти ерудит📚", preferredStyle: .alert)
        let action = UIAlertAction(title: "Спробувати ще раз", style: .default){
            (action) in
            self.coint = 0
            self.length = 0
            self.lengthLabel.text = "0"
            self.Description.text = ""
            self.counter.text = "0"
            self.sayHiLabel.text  = "🙈"
        }
        aletController.addAction(action)
        self.present(aletController, animated: true, completion: nil)
    }
    
    @IBAction func arrayButtons(_ sender: Any) {
        let typless:(String,String) = randoms()
        self.Global_Answer = typless.0
        self.Description.text = typless.1
        self.length = self.Global_Answer.count
        self.lengthLabel.text = String(self.length)
    }
}
