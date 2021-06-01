//
//  DataBase.swift
//  RealmQuickStart
//
//  Created by Dmitry Kurkin Local on 01.06.21.
//

import Foundation
import RealmSwift

final class DataBase {
    func load() -> [String] {
        let realm = try! Realm()
        return realm.objects(RealmItem.self).map { $0.title }
    }
    
    func save(_ item: String) {
        let realm = try! Realm()
        try! realm.write {
            realm.add(RealmItem(title: item))
        }
    }
}

final class RealmItem : Object {
    @objc dynamic var title: String = ""
    
    convenience init(title: String) {
        self.init()
        self.title = title
    }
}
