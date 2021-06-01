//
//  RealmQuickStartTests.swift
//  RealmQuickStartTests
//
//  Created by Dmitry Kurkin Local on 20.05.21.
//

import XCTest
@testable import RealmQuickStart

class RealmQuickStartTests: XCTestCase {
    private let formatter = DateFormatter()

    override func setUpWithError() throws {
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm"
    }

    override func tearDownWithError() throws {
    }

    func testFill() throws {
        let base = DataBase()
        base.save(realmItem: RealmItem(title: "Понедельник: Как хорошо жить без БД", date: formatter.date(from: "2021-05-31T06:00")!))
        base.save(realmItem: RealmItem(title: "Понедельник: Теоретический обзор баз данных", date: formatter.date(from: "2021-05-31T06:00")!))
        base.save(realmItem: RealmItem(title: "Вторник: Использование LMDB на практике", date: formatter.date(from: "2021-06-01T06:00")!))
        base.save(realmItem: RealmItem(title: "Вторник: Работаем с чистым SQL", date: formatter.date(from: "2021-06-01T06:00")!))
        base.save(realmItem: RealmItem(title: "Подключиться к Zoom - конфе"))
        base.save(realmItem: RealmItem(title: "Переключить комменты на All Attendies"))
        base.save(realmItem: RealmItem(title: "Пустить Гуся"))
        base.save(realmItem: RealmItem(title: "Задать огненный вопрос"))
        base.save(realmItem: RealmItem(title: "Ворватся с видео"))
        base.save(realmItem: RealmItem(title: "Поставить сессии 🔥"))
    }
}
