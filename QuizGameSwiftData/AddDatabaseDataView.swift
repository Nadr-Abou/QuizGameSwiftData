//
//  ContentView.swift
//  QuizGameDatabase
//
//  Created by user243551 on 10/27/23.
//

import SwiftUI
import SwiftData






struct AddDatabaseDataView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var domande: [DomandaDB]
    
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(domande) { item in
                    Text(item.descrizione)
                }
                .onDelete(perform: removeDomanda)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addDomanda) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
        
        
    }
    private func removeDomanda(){
        
    }
    private func addDomanda(){
        
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
    
        
}




#Preview {
    AddDatabaseDataView()
        .modelContainer(for: [DomandaDB.self,RispostaDB.self], inMemory: true)
}
