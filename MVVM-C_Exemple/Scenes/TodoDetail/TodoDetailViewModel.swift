//
//  TodoDetailViewModel.swift
//  MVVM-C_Exemple
//
//  Created by Jaisson Monteiro on 02/04/21.
//

import Foundation

class TodoDetailViewModel: TodoDetailViewModelType {
    
    //MARK: - Properties
    let todo: TodoViewData
    
    //MARK: - Inits
    init(todo: TodoViewData) {
        self.todo = todo
    }
}
