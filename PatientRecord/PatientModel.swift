//
//  PatientModel.swift
//  PatientRecord
//
//  Created by Harvin Shibu on 21/11/22.
//

import Foundation

class PatientModel{
    var id: String?
    var name: String?
    var city: String?
    var phone: String?
    
    init(id: String? = nil, name: String? = nil, city: String? = nil, phone: String? = nil) {
        self.id = id
        self.name = name
        self.city = city
        self.phone = phone
    }
}
