//
//  TodoModel.swift
//  MVVM-C_Exemple
//
//  Created by Jaisson Monteiro on 01/04/21.
//

import Foundation

struct TodoModel: Decodable {
    let id: String
    let name: String
    let description: String
    let created_date: String
    let updated_date: String
}
