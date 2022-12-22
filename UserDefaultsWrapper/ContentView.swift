//
//  ContentView.swift
//  UserDefaultsWrapper
//
//  Created by Venkata  naraharisetty on 12/19/22.
//

import SwiftUI

struct ContentView: View {
    @State private var name: String = ""
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        VStack {
            Text("Hello \(viewModel.userEnteredName)")
                .bold()
            Spacer()
                .frame(minHeight: 10, idealHeight: 50, maxHeight: 50)
                .fixedSize()
            TextField("Enter your name", text: $name)
                .padding(.all, 15)
                .background(.gray.opacity(0.2))
                .cornerRadius(20)
            Button {
                print("this is update")
                viewModel.updateName(name: name)
            } label: {
                Text("Update name")
                    .bold()
                    .foregroundColor(.white)
            }
            .padding(.all, 10)
            .background(.blue)
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
