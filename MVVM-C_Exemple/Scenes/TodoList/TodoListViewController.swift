//
//  TodoListViewController.swift
//  MVVM-C_Exemple
//
//  Created by Jaisson Monteiro on 31/03/21.
//

import UIKit
import RxSwift
import RxCocoa

protocol TodoListViewModelType {
    //MARK: - Properties
    var todoList: BehaviorRelay<[TodoViewData]> { get }
    var loading: PublishSubject<Bool> { get }
    var requestError: PublishSubject<String> { get }
    
    //MARK: - Methods
    func fetchTodoList()
    func didSelectTodo(at indexPath: IndexPath)
}

struct TodoViewData {
    
    let name: String
    let description: String
    let updatedDate: String
    
    init(todo: TodoModel) {
        self.name = todo.name
        self.description = todo.description
        
        let dateManager = DateManager(rawDate: todo.updated_date)
        self.updatedDate = dateManager.formatted(format: "'Última atualização em:' dd 'de' MMM 'de' yyyy 'ás' HH:mm")
    }
}

class TodoListViewController: BaseViewController {
    
    //MARK: - Properties
    private var contentView: TodoListView!
    private let viewModel: TodoListViewModelType
    private let disposeBag = DisposeBag()
    
    //MARK: - Inits
    init(viewModel: TodoListViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - View life cycle
    override func loadView() {
        contentView = TodoListView()
        contentView.backgroundColor = .white
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        viewModel.fetchTodoList()
    }
    
    //MARK: - Setup methods
    private func setup() {
        setupTableView()
        setupObservables()
        
        title = "Lista de Tarefas"
    }
    
    private func setupTableView() {
        contentView.tableView.register(TodoListTableViewCell.self, forCellReuseIdentifier: TodoListTableViewCell.identifier)
        
        viewModel.todoList
            .bind(to: contentView.tableView.rx.items(
                    cellIdentifier: TodoListTableViewCell.identifier,
                    cellType: TodoListTableViewCell.self)) { index, todo, cell in
                cell.setup(todo: todo)
            }
            .disposed(by: disposeBag)
        
        contentView.tableView.rx
            .itemSelected
            .subscribe { (indexPath) in
                self.viewModel.didSelectTodo(at: indexPath)
            }
            .disposed(by: disposeBag)
        
        viewModel.loading.bind(to: contentView.tableView.refreshControl!.rx.isRefreshing).disposed(by: disposeBag)
        
        contentView.tableView.refreshControl?.rx
            .controlEvent(.valueChanged)
            .subscribe(onNext: {  _ in
                self.viewModel.fetchTodoList()
            })
            .disposed(by: disposeBag)
    }
    
    private func setupObservables() {
        
        viewModel.requestError
            .subscribe { (message) in
                self.showSnackBar(message: message)
            }
            .disposed(by: disposeBag)
    }
}
