//
//  TodoListCoordinator.swift
//  MVVM-C_Exemple
//
//  Created by Jaisson Monteiro on 01/04/21.
//

import UIKit

class TodoListCoordinator: Coordinator {
    
    //MARK: - Properties
    private let navigationViewController: UINavigationController
    
    //MARK: - Inits
    init(navigationViewController: UINavigationController) {
        self.navigationViewController = navigationViewController
    }
    
    //MARK: - Methods
    func start() {
        let viewModel = TodoListViewModel(coordinator: self, service: TodoJsonService())
        let viewController = TodoListViewController(viewModel: viewModel)
        navigationViewController.pushViewController(viewController, animated: true)
    }
}

//MARK: - TodoListViewModelCoordinatorDelegate
extension TodoListCoordinator: TodoListViewModelCoordinatorDelegate {
    
    func goTodoDetail(todo: TodoViewData) {
        print("O item selecionado foi", todo)
        let viewModel = TodoDetailViewModel(todo: todo)
        let controller = TodoDetailViewController(viewModel: viewModel)
        navigationViewController.pushViewController(controller, animated: true)
    }
}
