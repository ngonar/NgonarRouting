//
//  Menu.swift
//  NgonarRouting
//
//  Created by Iwan Saputra on 14/02/23.
//

import SwiftUI

struct MenuItem: Identifiable, Equatable {
    var id = UUID()
    var name: String
    var logo: String
    var label: String
    var category: String
    var obj: String
}


