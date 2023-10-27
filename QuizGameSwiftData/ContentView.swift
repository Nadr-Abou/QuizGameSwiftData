//
//  ContentView.swift
//  QuizGameDatabase
//
//  Created by user243551 on 10/27/23.
//

import SwiftUI
import SwiftData

struct MyTabNav: View {
    var body: some View {
        TabView{
            HomepageView()
            .tabItem {
                    Image(systemName: "play.circle.fill")
                    Text("Home")
                }
            SubjectsList()
            .tabItem {
            Image(systemName: "book.circle.fill")
            Text("Materie")
            }
            CronologiaView()
            .tabItem {
            Image(systemName: "timer.circle.fill")
            Text("Cronologia")
            }
            ImpostazioniView()
            .tabItem {
            Image(systemName: "gear.circle.fill")
            Text("Impostazioni")
            }
        }
    }
}



struct Titolo: View {
    var titolo: String
    var body: some View {
        Text(titolo).font(.system(size: 45)).frame(maxWidth: .infinity, alignment: .leading).padding()
    }
}

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    
    
    
    
    
    
    
    
    
    
    
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                    } label: {
                        Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
    
    private func addQuestion(id:Int, descrizione: String, id_RC: RispostaDB){
        modelContext.insert(DomandaQuiz(id: id, descrizione: descrizione, id_rispostaCoretta: id_RC))
    }
    
    private func addAnswer(id: Int, descrizione:String){
        modelContext.insert(Risposta(id:id, descrizione: descrizione))
    }
}

/*
 struct ContentView: View {
     var logged = false
     
     var body: some View {
         if logged{
             VStack{
                 MenuView()
             }
         }
         else{
             VStack {
                 LaunchView()
             }
             .padding()
         }
     }
 }
*/


#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
