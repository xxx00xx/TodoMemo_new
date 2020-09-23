//
//  Station.swift
//  TodoMemo
//
//  Created by 古田翔太郎 on 2020/09/23.
//  Copyright © 2020 古田翔太郎. All rights reserved.
//

import Foundation

//データを入れるmodelの作成
class Station : NSObject {
  var todo: String
  var date: String

  init(todo: String, date: String){
    self.todo = todo as String
    self.date = date as String
  }
}
