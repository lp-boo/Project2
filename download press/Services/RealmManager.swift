//
//  RealmManager.swift
//  download press
//
//  Created by Moby on 8.03.22.
//
import Foundation
import RealmSwift

class RealmManager {
    
    private let realm = try! Realm()
    static let shared = RealmManager()

    private init() {}
    
    func beginWriteTransaction() {
        
    }
    
    let localRealm = try! Realm()
    
    func saveScheduleModel(model: SchedulModel) {
        try! localRealm.write {
            localRealm.add(model)
          
        }
    }
        
    func deleteScheduleModel(model: SchedulModel) {
        try! localRealm.write {
            localRealm.delete(model)
            
    }
}
}
