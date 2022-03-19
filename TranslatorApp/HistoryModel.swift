//
//  SecondViewControllerModel.swift
//  TranslatorApp
//
//  Created by Eldiiar on 18/3/22.
//

import Foundation
import RealmSwift

class HistoryModel: Object {
    @objc dynamic var firstLanguage: String = ""
    @objc dynamic var secondLanguage: String = ""
}

