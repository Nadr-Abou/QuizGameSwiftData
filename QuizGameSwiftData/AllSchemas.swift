//
//  AllSchemas.swift
//  QuizGameDatabase
//
//  Created by user243551 on 10/27/23.
//

import SwiftUI
import SwiftData


@Model
class User{
    @Attribute(.unique) var id: Int
    var nome: String
    var email: String
    var esami: [Esame]?
    
    init(id: Int, nome: String, email: String, esami: [Esame]? = nil) {
        self.id = id
        self.nome = nome
        self.email = email
        self.esami = esami
    }
}

@Model
class Esame
{
    @Attribute(.unique) var id: Int
    var Quiz: [Quiz]?
    @Relationship(inverse: \User.id) var id_utente: Int
    var dataQuiz: String
    var orarioQuiz: String
    
    init(id: Int, Quiz: [Quiz]? = nil, id_utente: Int, dataQuiz: String, orarioQuiz: String) {
        self.id = id
        self.Quiz = Quiz
        self.id_utente = id_utente
        self.dataQuiz = dataQuiz
        self.orarioQuiz = orarioQuiz
    }
}

@Model
class Quiz{
    @Attribute(.unique) var id: Int
    @Relationship(inverse: \Esame.id) var id_esame: Int
    @Relationship(inverse: \DomandaQuiz.id) var id_domanda: Int
    @Relationship(inverse: \Risposta.id) var id_rispostaData: Int
    
    init(id: Int, id_esame: Int, id_domanda: Int, id_rispostaData: Int) {
        self.id = id
        self.id_esame = id_esame
        self.id_domanda = id_domanda
        self.id_rispostaData = id_rispostaData
    }
}

@Model
class DomandaQuiz {
    @Attribute(.unique) var id: Int
    var descrizione: String
    @Relationship(inverse: \Risposta.id) var id_rispostaCoretta: Risposta
    
    init(id: Int, descrizione: String, id_rispostaCoretta: Risposta) {
        self.id = id
        self.descrizione = descrizione
        self.id_rispostaCoretta = id_rispostaCoretta
    }
}



@Model
class Risposta{
    @Attribute(.unique) var id: Int
    var descrizione: String
    
    
    init(id: Int, descrizione: String) {
        self.id = id
        self.descrizione = descrizione
    }
}





