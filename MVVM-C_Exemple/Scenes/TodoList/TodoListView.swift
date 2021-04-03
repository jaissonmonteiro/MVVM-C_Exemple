//
//  TodoListView.swift
//  MVVM-C_Exemple
//
//  Created by Jaisson Monteiro on 30/03/21.
//

import SnapKit

class TodoListView: UIView {
    
    //MARK: - Subviews
    lazy var tableView = makeTableView()
    
    //MARK: - Inits
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup subviews
    private func setup() {
        addSubviews()
        addConstraints()
    }
    
    private func addSubviews() {
        addSubview(tableView)
    }
    
    private func addConstraints() {
        tableView.snp.makeConstraints { $0.edges.equalTo(safeAreaLayoutGuide) }
    }
    
    //MARK: - Make methods
    private func makeTableView() -> UITableView {
        let tableView = UITableView()
        tableView.tableFooterView = UIView()
        tableView.isSpringLoaded = true
        tableView.refreshControl = UIRefreshControl()
        return tableView
    }
}
