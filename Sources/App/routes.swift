import Vapor


struct WelcomeContext: Encodable {
    var message: String
    
}

struct DisplayDishesContext: Encodable {
    var dishes: [Dish]
    
}

struct DisplayHotKeysContext: Encodable {
    var hotkeys: [HotKeyModel]
}


/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "It works" example
    router.get { req in
        return "It works!"
    }
    
    
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return try req.view().render("index")
    }
    
    router.get("welcome") { req -> Future<View> in
        let ctx = WelcomeContext(message: "Welcome to LeafTemplates!")
        return try req.view().render("index", ctx)
    }
    
    router.get("leafmd") { req -> Future<View> in
        let ctx = WelcomeContext(message: "Welcome to LeafTemplates!")
        return try req.view().render("leaf_md", ctx)
    }
    
    //leaf_md
    
    
//    router.get("display-dishes") { req -> Future<View> in
//        let dishes = [Dish(id: 1, name: "Lily", course: "iOS", price: "100", imageURL: "baidu.com", description: "Udemy course is expensive1!"),
//                      Dish(id: 2, name: "Luly", course: "iOS", price: "200", imageURL: "sina.com", description: "Udemy course is expensive2!"),
//                      Dish(id: 3, name: "Make", course: "iOS", price: "300", imageURL: "youtube.com", description: "Udemy course is expensive3!")]
//
//        let ctx = DisplayDishesContext(dishes: dishes)
//        return try req.view().render("display-dishes", ctx)
//    }
    
    
    
    
    
//    router.get("dishes") { req in
//        return Dish.init(name: "Lily", course: "Udemy", price: "$100", imageURL: "imgUrl.png", description: "youtube course is expensive")
//    }
    
    // Example of configuring a controller
    let todoController = TodoController()
    router.get("todos", use: todoController.index)
    router.post("todos", use: todoController.create)
    router.delete("todos", Todo.parameter, use: todoController.delete)
    
    
    
    
//    router.post(Dish.self, at: "/dishes") { req, dish -> Future<Dish> in
//        return dish.save(on: req)
//    }
//
//    router.get("/dishes") { req -> Future<[Dish]> in
//        return Dish.query(on: req).all()
//    }
//
//    router.get("/dishes", Dish.parameter) { req -> Future<Dish> in
//        return try req.parameters.next(Dish.self)
//    }

    
//    router.delete("/dishes", Dish.parameter) { req -> Future<Dish> in
//        return try req.parameters.next(Dish.self).delete(on: req)
//    }
//
//
//    router.put(Dish.self, at: "/dishes") { req, dish -> Future<Dish> in
//        return dish.update(on: req)
//    }
    
    
    
//    router.post(HotKeyModel.self, at: "/hotkey") { req, hotkey -> Future<HotKeyModel> in
//        return hotkey.save(on: req)
//    }
//
//    router.post("/hotkeys") { req -> Future<[HotKeyModel]> in
//        return HotKeyModel.query(on: req).all()
//    }
    
    
    try router.register(collection: HotKeyController())
    
    
    try router.register(collection: EpisodesRouteCollection())
    
}
