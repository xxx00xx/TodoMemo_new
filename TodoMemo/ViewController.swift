//
//  ViewController.swift
//  TodoMemo
//
//  Created by 古田翔太郎 on 2020/09/22.
//  Copyright © 2020 古田翔太郎. All rights reserved.
//

import UIKit

class ViewController:  UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var table: UITableView!
    
    //@IBOutlet weak var stationList: UITableView!
    //var stations:[Station] = [Station]()
    //tableの中身
    //@IBOutlet var todoLabel: UILabel!
    //@IBOutlet var dateLabel: UILabel!

    //表示するcell数を設定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //戻り値の設定(表示するcell数)
        return todoListArray.count
    }
    
    //表示するcellの中身を決める
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            //配列を作る
            let todoCell = tableView.dequeueReusableCell(withIdentifier: "TodoCell")
            
            //配列の中身を作る
            todoCell?.textLabel?.text = todoListArray[indexPath.row]
           // todoCell?.textLabel?.text = dateListArray[indexPath.row]
        
            //戻り値の設定（表示する中身)
            return todoCell!

    }
    
    //Delete Button
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            todoListArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            //↓大事
            saveData.removeObject(forKey: "TodoList")
            saveData.set(todoListArray, forKey: "TodoList" )
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.delegate   = self
        table.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //追加画面で入力した内容を取得する
        if saveData.object(forKey: "TodoList") != nil {
            todoListArray = saveData.object(forKey: "TodoList") as! [String]
        }
    }
    
    //MemoViewControllerからViewControllerへ画面遷移するためのクラス
    @IBAction func unwindToViewController(segue: UIStoryboardSegue) {}
}

