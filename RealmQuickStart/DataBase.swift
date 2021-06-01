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

    convenience init(title: String) {
        self.init()
        self.title = title
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
