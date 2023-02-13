//
//  ContentView.swift
//  NgonarRouting
//
//  Created by Iwan Saputra on 14/02/23.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var apiFetcher: APIFetcher
    
    private static let initialColumns = 3
    
    @State private var selectedMenu: MenuItem?
    @State private var numColumns = initialColumns
    @State private var gridColumns = Array(repeating: GridItem(.adaptive(minimum: 160), spacing: 10,alignment: .top), count: initialColumns)
   
    private var gridRows: [GridItem] = [
        GridItem(.fixed(150), spacing: 10, alignment: .leading)
    ]
    
    
    @State private var menus: [MenuItem] = [

    ]
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    LazyVGrid(columns: gridColumns) {
                        
                        ForEach (menus) { menu in
                            
                            NavigationLink(destination: abenk_map[menu.obj]?.destination) {
                                VStack(alignment: .leading) {
                                    ZStack(alignment: .top) {
                                        Image(systemName: menu.logo)
                                            .resizable()
                                            .scaledToFit()
                                            .symbolRenderingMode(.hierarchical)
                                            .ignoresSafeArea(.container, edges: .bottom)
                                            .cornerRadius(8)
                                            .frame(width: UIScreen.main.bounds.size.width/5,
                                                   height: UIScreen.main.bounds.size.width/5
                                            )
                                    }
                                    Text(menu.name)
                                }
                            }.foregroundColor(.black)
                        }
                    }
                }
            }
            .padding()
        }
        .task {
            // fetch the json menu
            try? await apiFetcher.fetchJsonApi()
            
            let listUserMenus: [Menuser] = apiFetcher.userData.data.menu
            
            // clean & fill up the menus
            menus.removeAll()
            do {
                
                for menuser in listUserMenus {
                    menus.append(MenuItem(name: menuser.UserMenu.label,
                                          logo: menuser.UserMenu.logo,
                                      label: menuser.UserMenu.label,
                                      category: menuser.MenuCategory.name,
                                      obj: menuser.UserMenu.menu_obj))
                }
                
            }
            catch {
                print("Error generating menu")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
