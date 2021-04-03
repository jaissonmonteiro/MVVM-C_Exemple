//
//  TodoListViewModel.swift
//  MVVM-C_Exemple
//
//  Created by Jaisson Monteiro on 31/03/21.
//

import Foundation
import RxRelay
import RxSwift

protocol TodoListViewModelCoordinatorDelegate: class {
    func goTodoDetail(todo: TodoViewData)
}

class TodoListViewModel: TodoListViewModelType {
    
    //MARK: - Properties
    let todoList = BehaviorRelay<[TodoViewData]>(value: [])
    let loading = PublishSubject<Bool>()
    let requestError = PublishSubject<String>()
    private let coordinator: TodoListViewModelCoordinatorDelegate
    private let service: TodoService
    
    
    //MARK: - Inits
    init(coordinator: TodoListViewModelCoordinatorDelegate, service: TodoService) {
        self.coordinator = coordinator
        self.service = service
    }
    
    //MARK: - Methods
    func fetchTodoList() {
        loading.onNext(true)
        service.getTodoList(success: { [weak self] response in
            self?.loading.onNext(false)
            self?.parseTodoListResponse(response)
        }) { [weak self] statusCode, message in
            self?.loading.onNext(false)
            self?.requestError.onNext(message)
        }
    }
    
    private func parseTodoListResponse(_ response: [TodoModel]) {
        let todoList = response.map({ TodoViewData(todo: $0) })
        self.todoList.accept(todoList)
    }
    
    func didSelectTodo(at indexPath: IndexPath) {
        let todo = todoList.value[indexPath.row]
        coordinator.goTodoDetail(todo: todo)
    }
}
