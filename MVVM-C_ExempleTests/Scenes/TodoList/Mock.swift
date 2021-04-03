//
//  Mock.swift
//  MVVM-C_ExempleTests
//
//  Created by Jaisson Monteiro on 02/04/21.
//

@testable import MVVM_C_Exemple

class TodoMockService: TodoService {
    
    var response: [TodoModel]?
    var requestError: (Int, String)?
    
    func getTodoList(success: @escaping ([TodoModel]) -> Void, error: @escaping RequestError) {
        if let response = response {
            success(response)
        } else {
            error(requestError?.0 ?? 500, requestError?.1 ?? "Internal error")
        }
    }
    
}

class TodoListViewModelMockCoordinatorDelegate: TodoListViewModelCoordinatorDelegate {
    
    var todo: TodoViewData?
    
    func goTodoDetail(todo: TodoViewData) {
        self.todo = todo
    }
}
 
