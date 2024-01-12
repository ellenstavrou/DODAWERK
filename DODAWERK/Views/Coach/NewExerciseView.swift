//
//  NewExerciseView.swift
//  DDW
//
//  Created by Ellen Stavrou on 14/12/2023.
//

import SwiftUI

struct NewExerciseView: View {
    
    @StateObject var viewModel = NewExerciseViewModel()
    @Binding var newExercisePresented: Bool
    
    var body: some View {
        
        VStack {
            Text("New Exercise")
                .bold()
                .font(.system(size: 32))
                .padding(.top, 50)
            
            Form {
                
                TextField("Name", text: $viewModel.name)
                TextField("Description", text: $viewModel.description)
                Button {
                    if viewModel.canSave {
                        viewModel.save()
                        newExercisePresented = false
                    }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.green)
                        
                        Text("Save")
                            .foregroundColor(.white)
                        
                    }
                }

                
            }
            
        }
    }
}

struct NewExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        NewExerciseView(newExercisePresented: Binding(get: {
            return true
        }, set: { _ in
            
        }))
    }
}
