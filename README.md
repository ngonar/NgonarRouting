# NgonarRouting
SwiftUI Routing View

Routing your SwfitUI in a dynamic way.

The idea is based on these points :
1. The buttons visibility is based on JSON API response, which is supposed to be dynamically set by the ACL / RBAC on the backend.
2. The route of the buttons is mapped by an ID
3. The ID is representing a View

Let's say you have set the backend with certain roles which should have certain access to certain view.
Then we got this response as an example.

```
       {"rc":"00",
        "message":"Success",
        "data":
           {"user":"iwan",
            "store":"Abenk Pamulank",
            "division":"User",
            "menu":
              [
                 {
                     "MenuCategory":{"name":"Home"},
                     "UserMenu":{
                         "label":"Menu 1",
                         "menu_obj":"100",
                         "menu_category_id":"1", 
                         "logo":"app"}
                 },
                 {
                     "MenuCategory":{"name":"Home"},
                     "UserMenu":{
                         "label":"Menu 2",
                         "menu_obj":"101",
                         "menu_category_id":"2", 
                         "logo":"app"}
                 }
              ]
           }
        }
```
We can see from the response above, that user "Iwan" has 2 menus to access.
They are the "Menu 1" and "Menu 2"

You can see that each menu has and identifier "menu_obj":"100" and "menu_obj":"101"

```
let abenk_map = [
    "100": AbenkRouting.view1,
    "101": AbenkRouting.view2
]
```
Right here we are mapping the identifier. we create a dictionary. So that later we can call the view based on the defined map.

```
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
```

Then we create an enum that define the View that we are going to call.

Finally on the view that we are going to show all the buttons that will navigate to the destined View.

```
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
```
We are using default system icon here. but you can use your own image asset.
just set it up on the API response ( it's the logo element here )

This is applicable to the next View which is dynamically related to ACL / RBAC on the backend.

<img src="https://miro.medium.com/v2/resize:fit:1350/1*v_8u6fwXpJvE6_0RpkpsEw.gif" width="300" >

Hope this help with your project.

Salam,

[!["Buy Me A Coffee"](https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png)](https://www.buymeacoffee.com/ngonar)
