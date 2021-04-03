//
//  TodoListTableViewCell.swift
//  MVVM-C_Exemple
//
//  Created by Jaisson Monteiro on 31/03/21.
//

import UIKit

class TodoListTableViewCell: UITableViewCell {
    
    //MARK: - Inits
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        separatorInset = .zero
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    func setup(todo: TodoViewData) {
        textLabel?.text = todo.name
        detailTextLabel?.text = todo.description
        imageView?.image = UIImage.from(text: todo.name, fontSize: 20)
    }
}
