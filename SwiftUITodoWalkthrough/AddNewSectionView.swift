//
//  AddNewSectionView.swift
//  SwiftUITodoWalkthrough
//
//  Created by Skyler Robbins on 1/17/25.
//

import SwiftUI

struct AddNewSectionView: View {
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var todosController: TodosController
    @State var newSectionText = ""
    
    init(todosController: TodosController) {
        self._todosController = ObservedObject(wrappedValue: todosController)
    }
    
    var body: some View {
        VStack {
            Text("Create New Section")
                .font(.largeTitle)
                .fontWeight(.thin)
                .padding(.top)
            Spacer()
            TextField("Section", text: $newSectionText)
                .padding()
                .background(RoundedRectangle(cornerRadius: 15).stroke(.gray, style: StrokeStyle(lineWidth: 0.2)))
                .padding()
            Spacer()
            VStack {
                Button {
                    if !newSectionText.isEmpty {
                        // Add new section
                        addNewSection(newSectionText)
                        // Dismiss view
                        dismiss()
                    }
                } label: {
                    Text("Create")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(EdgeInsets(top: 15, leading: 0, bottom: 15, trailing: 0))
                        .background(RoundedRectangle(cornerSize: CGSize(width: 15, height: 15)).fill(.blue))
                }
                Button {
                    dismiss()
                } label: {
                    Text("Cancel")
                        .foregroundColor(.red)
                        .frame(maxWidth: .infinity)
                        .padding(EdgeInsets(top: 15, leading: 0, bottom: 15, trailing: 0))
                        .background(RoundedRectangle(cornerSize: CGSize(width: 15, height: 15)).stroke(.red))
                }
            }
            .padding()
        }
    }
    
    func addNewSection(_ sectionTitle: String) {
        todosController.sections.append(TodoSection(sectionTitle: sectionTitle, todos: []))
    }
    
}

#Preview {
    AddNewSectionView(todosController: .init())
}
