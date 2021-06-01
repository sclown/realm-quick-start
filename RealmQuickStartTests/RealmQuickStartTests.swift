//
//  RealmQuickStartTests.swift
//  RealmQuickStartTests
//
//  Created by Dmitry Kurkin Local on 20.05.21.
//

import XCTest
@testable import RealmQuickStart

class RealmQuickStartTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func testFill() throws {
        let base = DataBase()
        base.save("Подключиться к Zoom - конфе")
        base.save("Переключить комменты на All Attendies")
        base.save("Пустить Гуся")
        base.save("Задать огненный вопрос")
        base.save("Ворватся с видео")
        base.save("Поставить сессии 🔥")
    }
}
