//
//  TodoService.swift
//  MVVM-C_Exemple
//
//  Created by Jaisson Monteiro on 01/04/21.
//

import Foundation

typealias RequestError = (Int, String) -> Void

protocol TodoService {
    func getTodoList(success: @escaping ([TodoModel]) -> Void, error: @escaping RequestError)
}



class TodoJsonService: TodoService {
    
    func getTodoList(success: @escaping ([TodoModel]) -> Void, error: @escaping RequestError) {
        guard let url = Bundle.main.url(forResource: "TodoListData", withExtension: "json") else {
            error(404, "Dados não encontrados, code: 404")
            return
        }
        guard let data = try? Data(contentsOf: url), let response = try? JSONDecoder().decode([TodoModel].self, from: data) else {
            error(500, "Ocorreu um erro interno, code: 500")
            return
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            success(response)
        }
    }
}
