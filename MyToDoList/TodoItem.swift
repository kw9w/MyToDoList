//
//  TodoItem.swift
//  MyToDoList
//
//  Created by kw9w on 10/20/21.
//

import UIKit

class TodoItem: NSObject,Encodable,Decodable {
    var title: String
    var isChecked: Bool
    
    init(title: String, isChecked: Bool){
        self.title = title
        self.isChecked = isChecked
    }
}
