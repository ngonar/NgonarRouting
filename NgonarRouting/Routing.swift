//
//  NgonarRouting.swift
//  NgonarRouting
//
//  Created by Iwan Saputra on 14/02/23.
//

//
//  Routing.swift
//  Abenk
//
//  Created by Iwan Saputra on 25/01/23.
//

import Foundation
import SwiftUI


let abenk_map = [
    "100": AbenkRouting.view1,
    "101": AbenkRouting.view2
]

enum AbenkRouting: Int, CaseIterable {
    case view1
    case view2
   
    
    var destination: AnyView {
         switch self {
         case .view1: return AnyView(View1())
         case .view2: return AnyView(View2())
         
         }
     }
}
