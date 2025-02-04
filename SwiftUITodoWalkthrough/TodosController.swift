//
//  TodosController.swift
//  SwiftUITodoWalkthrough
//
//  Created by Skyler Robbins on 1/17/25.
//

import Foundation

class TodosController: ObservableObject {
    @Published var sections: [TodoSection]
    
    init() {
        self.sections = TodoSection.dummySections
    }
}
