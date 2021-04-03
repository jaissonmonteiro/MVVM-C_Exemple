//
//  TodoListViewModelTest.swift
//  MVVM-C_ExempleTests
//
//  Created by Jaisson Monteiro on 02/04/21.
//

import XCTest
import RxRelay
import RxSwift
@testable import MVVM_C_Exemple

class TodoListViewModelTest: XCTestCase {
    
    //MARK: - Properties
    private var sut: TodoListViewModelType!
    private var service: TodoMockService!
    private var delegate: TodoListViewModelMockCoordinatorDelegate!
    private var disposeBag: DisposeBag!
    
    //MARK: - Setup methods
    override func setUp() {
        service = TodoMockService()
        delegate = TodoListViewModelMockCoordinatorDelegate()
        sut = TodoListViewModel(coordinator: delegate, service: service)
        disposeBag = DisposeBag()
    }
    
    override func tearDown() {
        service = nil
        delegate = nil
        sut = nil
        disposeBag = nil
    }
    
    func testFetchTodoList_success() throws {
        // given
        let todo = TodoModel(id: "01",
                             name: "Item 01",
                             description: "Descrição do item 01",
                             created_date: "2021-01-01T01:01:01",
                             updated_date: "2021-01-01T01:01:01")
        service.response = [todo]
        
        // when
        sut.fetchTodoList()
        
        //then
        XCTAssertTrue(sut.todoList.value.count == 1)
        XCTAssertEqual(sut.todoList.value.first?.name, todo.name)
        XCTAssertEqual(sut.todoList.value.first?.description, todo.description)
    }
    
    func testFetchTodoList_failure() throws {
        // given
        service.response = nil
        service.requestError = (404, "Not found")
        let behavior = BehaviorRelay<String>(value: "")
        sut.requestError.bind(to: behavior).disposed(by: disposeBag)
        
        // when
        sut.fetchTodoList()
        
        //then
        XCTAssertEqual(behavior.value, "Not found")
    }
    
    func testDidSelectTodo_success() throws {
        // given
        let todo = TodoModel(id: "02",
                             name: "Item 02",
                             description: "Descrição do item 01",
                             created_date: "2021-01-01T01:01:01",
                             updated_date: "2021-01-01T01:01:01")
        sut.todoList.accept([TodoViewData(todo: todo)])
        
        // when
        sut.didSelectTodo(at: IndexPath(row: 0, section: 0))
        
        //then
        XCTAssertEqual(delegate.todo?.name, todo.name)
        XCTAssertEqual(delegate.todo?.description, todo.description)
    }
}
