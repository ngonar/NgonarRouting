//
//  api_fetcher.swift
//  NgonarRouting
//
//  Created by Iwan Saputra on 14/02/23.
//

import Foundation

class APIFetcher: ObservableObject {
    
    @Published var userData: UserData = UserData(rc: "", message: "", data: UserDetail(user: "", store: "", division: "", menu: []))
    
    func fetchJsonApi() async throws {
        print("Fetching API...")
        /*
        ... Fetching your API ...
        */
        
        let JSON = """
        {"rc":"00","message":"Success","data":
           {"user":"iwan","store":"Abenk Pamulank","division":"User","menu":
              [
                 {
                     "MenuCategory":{"name":"Home"},
                     "UserMenu":{"label":"Menu 1","menu_obj":"100","menu_category_id":"1", "logo":"app"}
                 },
                 {
                     "MenuCategory":{"name":"Home"},
                     "UserMenu":{"label":"Menu 2","menu_obj":"101","menu_category_id":"2", "logo":"app"}
                 }
              ]
           }
        }
        """
        
        try await MainActor.run {
            
            let jsonData = JSON.data(using: .utf8)!
            
            userData = try JSONDecoder().decode(UserData.self, from: jsonData)
            
            print(userData)
        }
        
    }
    
}
