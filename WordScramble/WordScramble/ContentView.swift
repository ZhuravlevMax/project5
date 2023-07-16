//
//  ContentView.swift
//  WordScramble
//
//  Created by Максим Журавлев on 10.07.23.
//

import SwiftUI

struct ContentView: View {
    @State private var userWords = [String]()
    @State private var newWord = ""
    @State private var rootWord = ""

    var body: some View {
        NavigationView {
            List {
                Section {
                    TextField("Enter your word", text: $newWord)
                        .autocapitalization(.none)
                }// Section
                
                Section {
                    ForEach(userWords, id: \.self) { word in
                        
                        HStack {
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                    } //ForEach
                }//Section
                
            }// List
            .navigationTitle(rootWord)
            .onSubmit(addNewWord)
        }//NavigationView
    }//body
    
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        guard answer.count > 0 else { return }
        
        withAnimation {
            userWords.insert(answer, at: 0)
        }
        newWord = ""
    }//addNewWord()
}// struct ContentView

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
