//
//  AllSchemas.swift
//  QuizGameDatabase
//
//  Created by user243551 on 10/27/23.
//

import SwiftUI
import SwiftData


@Model
class UserDB{
    @Attribute(.unique) var id: Int
    var nome: String
    var email: String
    var esami: [EsameDB]?
    
    
    init(id: Int, nome: String, email: String, esami: [EsameDB]? = nil) {
        self.id = id
        self.nome = nome
        self.email = email
        self.esami = esami
    }
}

@Model
class EsameDB
{
    @Attribute(.unique) var id: Int
    var quiz: [QuizDB]?
    @Relationship(inverse: \UserDB.esami) var utente: UserDB?
    var dataQuiz: String
    var orarioQuiz: String
    
    init(id: Int, quiz: [QuizDB]? = nil, utente: UserDB? = nil, dataQuiz: String, orarioQuiz: String) {
        self.id = id
        self.quiz = quiz
        self.utente = utente
        self.dataQuiz = dataQuiz
        self.orarioQuiz = orarioQuiz
    }
}

@Model
class QuizDB{
    @Attribute(.unique) var id: Int
    @Relationship(inverse: \EsameDB.quiz) var esame: EsameDB?
    var domanda: DomandaDB?
    var rispostaData: RispostaDB?
    
    init(id: Int, esame: EsameDB? = nil, domanda: DomandaDB? = nil, rispostaData: RispostaDB? = nil) {
        self.id = id
        self.esame = esame
        self.domanda = domanda
        self.rispostaData = rispostaData
    }
}

@Model
class DomandaDB {
    @Attribute(.unique) var id: Int
    var descrizione: String
    var id_rispostaCoretta: RispostaDB?
    

    init(id: Int, descrizione: String, id_rispostaCoretta: RispostaDB? = nil) {
        self.id = id
        self.descrizione = descrizione
        self.id_rispostaCoretta = id_rispostaCoretta
    }
}

@Model
class RispostaDB{
    @Attribute(.unique) var id: Int
    var descrizione: String
    

    init(id: Int, descrizione: String) {
        self.id = id
        self.descrizione = descrizione
    }
}





