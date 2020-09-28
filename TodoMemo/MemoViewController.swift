//
//  MemoViewController.swift
//  TodoMemo
//
//  Created by 古田翔太郎 on 2020/09/22.
//  Copyright © 2020 古田翔太郎. All rights reserved.
//

import UIKit

//TodoListを入れるための配列
var  todoListArray = [String]()

//DateListを入れるための配列
var  dateListArray = [String]()

//UserDefaultへアクセス
var saveData: UserDefaults = UserDefaults.standard

class MemoViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var memoTextField: UITextField!
    @IBOutlet var picker: UIDatePicker!
    @IBOutlet var label: UILabel! //仮置き
    
    //var memoList:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //delegateの所在がMemoViewControllerであると指定
        memoTextField.delegate = self
    }

    @IBAction func saveButton() {
        //日付のフォーマット&取得
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        //label.text = "\(formatter.string(from: picker.date))"
    
        //配列に要素(入力内容)を追加する
        todoListArray.append(memoTextField.text!)
        dateListArray.append(formatter.string(from: picker.date))
         //saveボタンを押したらフィールドを空にする
         memoTextField.text = ""
        //配列の中身をUserDefaultに追加する
        saveData.set(todoListArray, forKey: "TodoList" )
        saveData.set(dateListArray, forKey: "DateList" )
        
        //Navigation Controllerを取得
        let nc = self.presentingViewController  as! UINavigationController
        
        // 親VCを取り出し
        let firstVC = nc.viewControllers[nc.viewControllers.count-1] as! ViewController
        
        firstVC.table.reloadData()
    }
    
    //Delegate：改行時にキーボードが閉じる．
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func cancelButton() {
        // self.navigationController?.popViewController(animated: true) ←What?
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
