//
//  MyTodoTableViewCell.swift
//  MyToDoList
//
//  Created by kw9w on 10/18/21.
//

import UIKit

class MyTodoTableViewCell: UITableViewCell {

    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
