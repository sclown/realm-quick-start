//
//  DataBase.swift
//  RealmQuickStart
//
//  Created by Dmitry Kurkin Local on 01.06.21.
//

import Foundation
import RealmSwift

final class DataBase {
    init() {
        Realm.Configuration.defaultConfiguration = Realm.Configuration(
            deleteRealmIfMigrationNeeded: true
        )
    }

    func save(_ item: String) {
        let realm = try! Realm()
        try! realm.write {
            realm.add(RealmItem(title: item))
        }
    }
    
    func save(realmItem: RealmItem) {
        let realm = try! Realm()
        try! realm.write {
            realm.add(realmItem)
        }
    }
    
    func load() -> Results<RealmItem> {
        let realm = try! Realm()
        return realm.objects(RealmItem.self)
    }
    
    func timeInfo(for item: RealmItem) -> RealmItemTime {
        let info = RealmItemTime()
        let realm = try! Realm()
        try! realm.write {
            item.time = info
        }
        return info
    }
}

class RealmItem: Object {
    @objc dynamic var title = ""
    @objc dynamic var time: RealmItemTime?
    @objc dynamic var date = Date(timeIntervalSince1970: 0)

    convenience init(title: String, date: Date = Date()) {
        self.init()
        self.title = title
        self.date = date
    }
}

class RealmItemTime: Object {
    @objc dynamic var start = Date(timeIntervalSince1970: 0)
    @objc dynamic var long = 0
    
    convenience init(start: Date, long: Int) {
        self.init()
        self.start = start
        self.long = long
    }
}
