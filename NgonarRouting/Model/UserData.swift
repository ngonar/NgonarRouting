//
//  UserData.swift
//  NgonarRouting
//
//  Created by Iwan Saputra on 14/02/23.
//

import Foundation

struct UserData: Decodable {
    var rc: String
    var message: String
    var data: UserDetail
}

struct UserDetail: Decodable {
    var user: String
    var store: String
    var division: String
    var menu: [Menuser]
}

struct Menuser: Decodable {
    var MenuCategory: MenuCategory
    var UserMenu: UserMenu
    
}

struct MenuCategory: Decodable {
    var name: String
}

struct UserMenu: Decodable {
    var label: String
    var menu_obj: String
    var menu_category_id: String
    var logo: String
}
