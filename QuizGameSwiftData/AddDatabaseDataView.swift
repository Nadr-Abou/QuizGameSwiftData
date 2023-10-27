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
    @Query private var risposte: [RispostaDB]
    @Query private var domande: [DomandaDB]
    @Query private var esami: [EsameDB]
    @Query private var quizes: [QuizDB]
    
    var body: some View {
        HStack{
            Button{
                modelContext.insert(RispostaDB(id: 1, descrizione: "Sql"))
                modelContext.insert(RispostaDB(id: 2, descrizione: "Java"))
                modelContext.insert(RispostaDB(id: 3, descrizione: "JavaScript"))
                modelContext.insert(RispostaDB(id: 4, descrizione: "Python"))
                modelContext.insert(RispostaDB(id: 5, descrizione: "C"))
                modelContext.insert(RispostaDB(id: 6, descrizione: "C#"))
                modelContext.insert(RispostaDB(id: 7, descrizione: "Assembly"))
                modelContext.insert(RispostaDB(id: 8, descrizione: "Ruby"))


                try? modelContext.save()
                
                modelContext.insert(DomandaDB(id: 1, descrizione: "Quale linguaggio viene usato per gestire i DB relazionali", rispostaCorretta: RispostaDB(id: 20, descrizione: "Sql")))
                /*modelContext.insert(DomandaDB(id: 2, descrizione: "Linguaggio più usato sul web", rispostaCorretta: risposte[2]))
                modelContext.insert(DomandaDB(id: 3, descrizione: "Linguaggio più semplice e lento?", rispostaCorretta: risposte[3]))
                modelContext.insert(DomandaDB(id: 4, descrizione: "dopo l'Assembly c'è ...", rispostaCorretta: risposte[4]))
                modelContext.insert(DomandaDB(id: 5, descrizione: "Java ma fatto meglio", rispostaCorretta: risposte[5]))
                modelContext.insert(DomandaDB(id: 6, descrizione: "linguaggio ad oggetti più conosciuto", rispostaCorretta: risposte[1]))*/

                /*modelContext.insert(EsameDB(id: 1, dataQuiz: "ora", orarioQuiz: "ora"))
                modelContext.insert(EsameDB(id: 2, dataQuiz: "ora", orarioQuiz: "ora"))
                
    
                
                modelContext.insert(QuizDB(id: 1, esame: esami[0], domanda: domande[0], rispostaData: risposte[0]))
                modelContext.insert(QuizDB(id: 2, esame: esami[0] ,domanda: domande[1], rispostaData: risposte[2]))
                
                esami[0].quiz?.append(quizes[0])
                esami[0].quiz?.append(quizes[1])*/

                

            }label: {
                Text("Inizilizza DB manualmente")
                    .frame(maxWidth: 250,maxHeight: 100)
            }
        }
        .font(.title2 .bold())
        .foregroundColor(.white)
        .background(.red)
        .cornerRadius(20)
       /*NavigationSplitView {
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
        */
        }
    }
    /*private func removeDomanda(at domandeIn: IndexSet){
        for index in domandeIn {
            modelContext.delete(domande[index])
        }
    }
    private func addDomanda(){
        modelContext.insert(DomandaDB(id: 1, descrizione: "funziona?", id_rispostaCoretta: RispostaDB(id: 1, descrizione: "no")))

    }*/
    
    
        




#Preview {
    AddDatabaseDataView()
        .modelContainer(for: [DomandaDB.self,RispostaDB.self], inMemory: true)
}
