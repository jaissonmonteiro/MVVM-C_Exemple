//
//  TodoDetailViewController.swift
//  MVVM-C_Exemple
//
//  Created by Jaisson Monteiro on 01/04/21.
//

import UIKit

protocol TodoDetailViewModelType {
    var todo: TodoViewData { get }
}

class TodoDetailViewController: BaseViewController {
    
    //MARK: - Properties
    private var contentView: TodoDetailView!
    private let viewModel: TodoDetailViewModelType
    
    //MARK: - Inits
    init(viewModel: TodoDetailViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - View life cycle
    override func loadView() {
        contentView = TodoDetailView(frame: UIScreen.main.bounds)
        contentView.backgroundColor = .white
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    //MARK: - Setup methods
    private func setup() {
        title = viewModel.todo.name
        setupView()
    }
    
    private func setupView() {
        contentView.imageView.image = UIImage.from(text: viewModel.todo.name, fontSize: 100)
        contentView.titleLabel.text = viewModel.todo.name
        contentView.descriptionLabel.text = viewModel.todo.description
        contentView.updatedLabel.text = viewModel.todo.updatedDate
    }
}
