//
//  TableViewCell.swift
//  TodoMemo
//
//  Created by 古田翔太郎 on 2020/09/23.
//  Copyright © 2020 古田翔太郎. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
  
     @IBOutlet var todo: UILabel!
     @IBOutlet var date: UILabel!

      override func awakeFromNib() {
          super.awakeFromNib()
          // Initialization code
      }

    func setCell(station: Station) {
      self.todo.text = station.todo as String
      self.date.text = station.date as String
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
