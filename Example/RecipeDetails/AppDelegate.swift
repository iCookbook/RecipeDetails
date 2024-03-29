//
//  AppDelegate.swift
//  RecipeDetails
//
//  Created by htmlprogrammist on 11/05/2022.
//  Copyright (c) 2022 htmlprogrammist. All rights reserved.
//

import UIKit
import Models
import RecipeDetails
import Resources

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        
        let context = RecipeDetailsContext(moduleOutput: nil, recipe: recipe)
        let assembly = RecipeDetailsAssembly.assemble(with: context)
        
        let navController = UINavigationController(rootViewController: assembly.viewController)
        
        // Resources.Fonts
        Fonts.registerFonts()
        navController.navigationBar.largeTitleTextAttributes = [.font: Fonts.largeTitle()]
        navController.navigationBar.titleTextAttributes = [.font: Fonts.headline()]
        
        window.rootViewController = navController
        window.makeKeyAndVisible()
        self.window = window
        
        // Reset favourite recipes to test favouriteButton
        UserDefaults.favouriteRecipes = []
        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
}

extension AppDelegate {
    var recipe: Recipe {
        Recipe(
            label: Optional("Red Pepper Jam"),
            image: Optional("https://edamam-product-images.s3.amazonaws.com/web-img/0d0/0d0b51440a81db03148000cd6b2aa917.png?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEA0aCXVzLWVhc3QtMSJHMEUCIFixMp6f%2BLymt0mvnVDrC5oDLTE0eJcjipxl1MeIagEzAiEA1JjINkyTnSm9wiEhf7A2ErRZoTLseTMvwtO6OGBA63Mq1QQI9f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgwxODcwMTcxNTA5ODYiDHRlQtxtI19f2sbtHiqpBPpVnZU9x%2FKH3UPOuO1mgLeNuidqiqSeYTcQZ26cMOhsgaw0y6xMI5Oq1WA1F5dXUAiItHbocpsLsLgG%2FyfNoGpYlkfSs3h%2BYJvdjtsOaUgdogCZUeqtPstsVil0HC5lFNJ5jaEWrrl04AaEhdTjL0Dmg9r3fBkjJfxnsHqHAXr9MSgD%2Bhw%2FjuiuSeYewPUQAaHQJdObnjnogPi3jpO0hnnnfwu1xRNvLUNEzzlkXXCiAdrgB0Zo7I%2B5g10gh97QUaL%2FDL5hKfS7PQbPS1YM0hWISaBRYmmvM0GskMK6bdR1vZ6YcNTtk8k7aEHij2NDK3WOeuwzleF2x2DUzMzNMGa7tA%2BNff1rLCeCD0PRVbbQkJy9mhOVsHf%2F8ULMhu3pqmmD0sJhFcYD%2FhcHtG%2BXnMtcr%2FizTCPcbBXSiKcUo5UuoRGrcvi2hlRwZyzEUyA9W%2FNQN4p87Fw1cUZK9WGEc1EkEX3BJ%2B%2FmwaFxsIqrq3rp88R9cZ%2BRMMyX6g62GiF4BeFG83Dyh4v8m5c2J%2Fa25gapuGE7GYo1oPOPPl5r9wnwdCwH7iS1jhfzsE14NtF8ne3kAXCYvhYMSOU00KZpgmu7E2ZvC4KJ9XbX%2BMGgfT7BNBtwWoZVW2c%2B%2FseD7e9%2FK5c6HB1d%2Bgnk0%2BFTsboq8%2FnAW7pvxGdndQxfK2069h%2Bd71uxqpxwM2P%2FMoO38Rrl2S3C9MI6fZgj1GEY4q75OMufq5aCALdLOpAwkYWbmwY6qQHB5leRvhr9i%2B%2Bot%2BJ%2Bz5X99l%2FxYgfSBWKiqDvG7rd0QSR9sAZpij6hqGCfdfm%2FGfZiZaghvz3BI4FmBZVpMAgTYefxy1LE5y8JvREBniV%2FqfvfkXTv15PUisonXdHEHWov5%2FxsdbDECtqPwWBOVekevMgwnx7bXYS%2Bt6H%2FEUWxrooJZKINU%2B4V3Uf9OiJQsQKdQwcOHOGIqJpqxk8OeUaVNqfh2C3wMFab&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20221105T214951Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFKEGRXYR3%2F20221105%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=9144035433093892c8df72bab15c44cb198f0c73443d07f82c01b0f426481ab1"),
            images: Optional(Images(
                thumbnail: Optional(Image(url: Optional("https://edamam-product-images.s3.amazonaws.com/web-img/0d0/0d0b51440a81db03148000cd6b2aa917-s.png?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEA0aCXVzLWVhc3QtMSJHMEUCIFixMp6f%2BLymt0mvnVDrC5oDLTE0eJcjipxl1MeIagEzAiEA1JjINkyTnSm9wiEhf7A2ErRZoTLseTMvwtO6OGBA63Mq1QQI9f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgwxODcwMTcxNTA5ODYiDHRlQtxtI19f2sbtHiqpBPpVnZU9x%2FKH3UPOuO1mgLeNuidqiqSeYTcQZ26cMOhsgaw0y6xMI5Oq1WA1F5dXUAiItHbocpsLsLgG%2FyfNoGpYlkfSs3h%2BYJvdjtsOaUgdogCZUeqtPstsVil0HC5lFNJ5jaEWrrl04AaEhdTjL0Dmg9r3fBkjJfxnsHqHAXr9MSgD%2Bhw%2FjuiuSeYewPUQAaHQJdObnjnogPi3jpO0hnnnfwu1xRNvLUNEzzlkXXCiAdrgB0Zo7I%2B5g10gh97QUaL%2FDL5hKfS7PQbPS1YM0hWISaBRYmmvM0GskMK6bdR1vZ6YcNTtk8k7aEHij2NDK3WOeuwzleF2x2DUzMzNMGa7tA%2BNff1rLCeCD0PRVbbQkJy9mhOVsHf%2F8ULMhu3pqmmD0sJhFcYD%2FhcHtG%2BXnMtcr%2FizTCPcbBXSiKcUo5UuoRGrcvi2hlRwZyzEUyA9W%2FNQN4p87Fw1cUZK9WGEc1EkEX3BJ%2B%2FmwaFxsIqrq3rp88R9cZ%2BRMMyX6g62GiF4BeFG83Dyh4v8m5c2J%2Fa25gapuGE7GYo1oPOPPl5r9wnwdCwH7iS1jhfzsE14NtF8ne3kAXCYvhYMSOU00KZpgmu7E2ZvC4KJ9XbX%2BMGgfT7BNBtwWoZVW2c%2B%2FseD7e9%2FK5c6HB1d%2Bgnk0%2BFTsboq8%2FnAW7pvxGdndQxfK2069h%2Bd71uxqpxwM2P%2FMoO38Rrl2S3C9MI6fZgj1GEY4q75OMufq5aCALdLOpAwkYWbmwY6qQHB5leRvhr9i%2B%2Bot%2BJ%2Bz5X99l%2FxYgfSBWKiqDvG7rd0QSR9sAZpij6hqGCfdfm%2FGfZiZaghvz3BI4FmBZVpMAgTYefxy1LE5y8JvREBniV%2FqfvfkXTv15PUisonXdHEHWov5%2FxsdbDECtqPwWBOVekevMgwnx7bXYS%2Bt6H%2FEUWxrooJZKINU%2B4V3Uf9OiJQsQKdQwcOHOGIqJpqxk8OeUaVNqfh2C3wMFab&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20221105T214951Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFKEGRXYR3%2F20221105%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=002dcc32f547e27520682646d06b4ca587d08fb9c86667333f6ac07083ab553a"), width: Optional(100), height: Optional(100))),
                small: Optional(Image(url: Optional("https://edamam-product-images.s3.amazonaws.com/web-img/0d0/0d0b51440a81db03148000cd6b2aa917-m.png?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEA0aCXVzLWVhc3QtMSJHMEUCIFixMp6f%2BLymt0mvnVDrC5oDLTE0eJcjipxl1MeIagEzAiEA1JjINkyTnSm9wiEhf7A2ErRZoTLseTMvwtO6OGBA63Mq1QQI9f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgwxODcwMTcxNTA5ODYiDHRlQtxtI19f2sbtHiqpBPpVnZU9x%2FKH3UPOuO1mgLeNuidqiqSeYTcQZ26cMOhsgaw0y6xMI5Oq1WA1F5dXUAiItHbocpsLsLgG%2FyfNoGpYlkfSs3h%2BYJvdjtsOaUgdogCZUeqtPstsVil0HC5lFNJ5jaEWrrl04AaEhdTjL0Dmg9r3fBkjJfxnsHqHAXr9MSgD%2Bhw%2FjuiuSeYewPUQAaHQJdObnjnogPi3jpO0hnnnfwu1xRNvLUNEzzlkXXCiAdrgB0Zo7I%2B5g10gh97QUaL%2FDL5hKfS7PQbPS1YM0hWISaBRYmmvM0GskMK6bdR1vZ6YcNTtk8k7aEHij2NDK3WOeuwzleF2x2DUzMzNMGa7tA%2BNff1rLCeCD0PRVbbQkJy9mhOVsHf%2F8ULMhu3pqmmD0sJhFcYD%2FhcHtG%2BXnMtcr%2FizTCPcbBXSiKcUo5UuoRGrcvi2hlRwZyzEUyA9W%2FNQN4p87Fw1cUZK9WGEc1EkEX3BJ%2B%2FmwaFxsIqrq3rp88R9cZ%2BRMMyX6g62GiF4BeFG83Dyh4v8m5c2J%2Fa25gapuGE7GYo1oPOPPl5r9wnwdCwH7iS1jhfzsE14NtF8ne3kAXCYvhYMSOU00KZpgmu7E2ZvC4KJ9XbX%2BMGgfT7BNBtwWoZVW2c%2B%2FseD7e9%2FK5c6HB1d%2Bgnk0%2BFTsboq8%2FnAW7pvxGdndQxfK2069h%2Bd71uxqpxwM2P%2FMoO38Rrl2S3C9MI6fZgj1GEY4q75OMufq5aCALdLOpAwkYWbmwY6qQHB5leRvhr9i%2B%2Bot%2BJ%2Bz5X99l%2FxYgfSBWKiqDvG7rd0QSR9sAZpij6hqGCfdfm%2FGfZiZaghvz3BI4FmBZVpMAgTYefxy1LE5y8JvREBniV%2FqfvfkXTv15PUisonXdHEHWov5%2FxsdbDECtqPwWBOVekevMgwnx7bXYS%2Bt6H%2FEUWxrooJZKINU%2B4V3Uf9OiJQsQKdQwcOHOGIqJpqxk8OeUaVNqfh2C3wMFab&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20221105T214951Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFKEGRXYR3%2F20221105%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=6353821c29b9999aaac5aebaf0264fdf4879fb2786badfc623d39a8ddc0be78a"), width: Optional(200), height: Optional(200))),
                regular: Optional(Image(url: Optional("https://edamam-product-images.s3.amazonaws.com/web-img/0d0/0d0b51440a81db03148000cd6b2aa917.png?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEA0aCXVzLWVhc3QtMSJHMEUCIFixMp6f%2BLymt0mvnVDrC5oDLTE0eJcjipxl1MeIagEzAiEA1JjINkyTnSm9wiEhf7A2ErRZoTLseTMvwtO6OGBA63Mq1QQI9f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgwxODcwMTcxNTA5ODYiDHRlQtxtI19f2sbtHiqpBPpVnZU9x%2FKH3UPOuO1mgLeNuidqiqSeYTcQZ26cMOhsgaw0y6xMI5Oq1WA1F5dXUAiItHbocpsLsLgG%2FyfNoGpYlkfSs3h%2BYJvdjtsOaUgdogCZUeqtPstsVil0HC5lFNJ5jaEWrrl04AaEhdTjL0Dmg9r3fBkjJfxnsHqHAXr9MSgD%2Bhw%2FjuiuSeYewPUQAaHQJdObnjnogPi3jpO0hnnnfwu1xRNvLUNEzzlkXXCiAdrgB0Zo7I%2B5g10gh97QUaL%2FDL5hKfS7PQbPS1YM0hWISaBRYmmvM0GskMK6bdR1vZ6YcNTtk8k7aEHij2NDK3WOeuwzleF2x2DUzMzNMGa7tA%2BNff1rLCeCD0PRVbbQkJy9mhOVsHf%2F8ULMhu3pqmmD0sJhFcYD%2FhcHtG%2BXnMtcr%2FizTCPcbBXSiKcUo5UuoRGrcvi2hlRwZyzEUyA9W%2FNQN4p87Fw1cUZK9WGEc1EkEX3BJ%2B%2FmwaFxsIqrq3rp88R9cZ%2BRMMyX6g62GiF4BeFG83Dyh4v8m5c2J%2Fa25gapuGE7GYo1oPOPPl5r9wnwdCwH7iS1jhfzsE14NtF8ne3kAXCYvhYMSOU00KZpgmu7E2ZvC4KJ9XbX%2BMGgfT7BNBtwWoZVW2c%2B%2FseD7e9%2FK5c6HB1d%2Bgnk0%2BFTsboq8%2FnAW7pvxGdndQxfK2069h%2Bd71uxqpxwM2P%2FMoO38Rrl2S3C9MI6fZgj1GEY4q75OMufq5aCALdLOpAwkYWbmwY6qQHB5leRvhr9i%2B%2Bot%2BJ%2Bz5X99l%2FxYgfSBWKiqDvG7rd0QSR9sAZpij6hqGCfdfm%2FGfZiZaghvz3BI4FmBZVpMAgTYefxy1LE5y8JvREBniV%2FqfvfkXTv15PUisonXdHEHWov5%2FxsdbDECtqPwWBOVekevMgwnx7bXYS%2Bt6H%2FEUWxrooJZKINU%2B4V3Uf9OiJQsQKdQwcOHOGIqJpqxk8OeUaVNqfh2C3wMFab&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20221105T214951Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFKEGRXYR3%2F20221105%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=9144035433093892c8df72bab15c44cb198f0c73443d07f82c01b0f426481ab1"), width: Optional(300), height: Optional(300))))),
            source: Optional("Honest Cooking"), url: Optional("http://honestcooking.com/red-pepper-jam/"),
            ingredients: Optional([
                Ingredient(text: Optional("½ cup (1 stick) unsalted butter"), quantity: Optional(0.5), measure: Optional("cup"), food: Optional("unsalted butter"), weight: Optional(113.5), foodCategory: Optional("Dairy"), foodID: Optional("food_awz3iefajbk1fwahq9logahmgltj"), image: Optional("https://www.edamam.com/food-img/713/71397239b670d88c04faa8d05035cab4.jpg")),
                Ingredient(text: Optional("5 cups yellow onions, chopped"), quantity: Optional(5.0), measure: Optional("cup"), food: Optional("yellow onions"), weight: Optional(800.0), foodCategory: Optional("vegetables"), foodID: Optional("food_bmrvi4ob4binw9a5m7l07amlfcoy"), image: Optional("https://www.edamam.com/food-img/205/205e6bf2399b85d34741892ef91cc603.jpg")),
                Ingredient(text: Optional("½ teaspoon salt"), quantity: Optional(0.5), measure: Optional("teaspoon"), food: Optional("salt"), weight: Optional(3.0), foodCategory: Optional("Condiments and sauces"), foodID: Optional("food_btxz81db72hwbra2pncvebzzzum9"), image: Optional("https://www.edamam.com/food-img/694/6943ea510918c6025795e8dc6e6eaaeb.jpg")),
                Ingredient(text: Optional("½ teaspoon coarse ground black pepper"), quantity: Optional(0.5), measure: Optional("teaspoon"), food: Optional("black pepper"), weight: Optional(1.15), foodCategory: Optional("Condiments and sauces"), foodID: Optional("food_b6ywzluaaxv02wad7s1r9ag4py89"), image: Optional("https://www.edamam.com/food-img/c6e/c6e5c3bd8d3bc15175d9766971a4d1b2.jpg")),
                Ingredient(text: Optional("¼ teaspoons crushed red pepper flakes"), quantity: Optional(0.25), measure: Optional("teaspoon"), food: Optional("red pepper flakes"), weight: Optional(0.19270833334310772), foodCategory: Optional("vegetables"), foodID: Optional("food_bispmxiaijcuxcagex14mbhk2o48"), image: Optional("https://www.edamam.com/food-img/6cb/6cb8e4510251a322178f6e191b3a7b1b.jpeg")),
                Ingredient(text: Optional("3 tablespoons granulated sugar"), quantity: Optional(3.0), measure: Optional("tablespoon"), food: Optional("granulated sugar"), weight: Optional(37.4999999993661), foodCategory: Optional("sugars"), foodID: Optional("food_axi2ijobrk819yb0adceobnhm1c2"), image: Optional("https://www.edamam.com/food-img/ecb/ecb3f5aaed96d0188c21b8369be07765.jpg")),
                Ingredient(text: Optional("3 tablespoons apple cider vinegar"), quantity: Optional(3.0), measure: Optional("tablespoon"), food: Optional("apple cider vinegar"), weight: Optional(44.7), foodCategory: Optional("Condiments and sauces"), foodID: Optional("food_ar8m7esapmfvf8bnhfzdlabndh6v"), image: Optional("https://www.edamam.com/food-img/c7d/c7dbd1846c5d08e9739930d70a404d50.jpg")),
                Ingredient(text: Optional("1 tablespoon fresh lemon juice"), quantity: Optional(1.0), measure: Optional("tablespoon"), food: Optional("lemon juice"), weight: Optional(15.2499999997422), foodCategory: Optional("100% juice"), foodID: Optional("food_bglm6vxahuauteb0n6ynfbg9eryu"), image: Optional("https://www.edamam.com/food-img/e31/e310952d214e78a4cb8b73f30ceeaaf2.jpg")),
                Ingredient(text: Optional("2 cups chopped red bell pepper"), quantity: Optional(2.0), measure: Optional("cup"), food: Optional("red bell pepper"), weight: Optional(298.0), foodCategory: Optional("vegetables"), foodID: Optional("food_a8g63g7ak6bnmvbu7agxibp4a0dy"), image: Optional("https://www.edamam.com/food-img/4dc/4dc48b1a506d334b4ab6671b9d56a18f.jpeg")),
                Ingredient(text: Optional("1 cup chicken stock"), quantity: Optional(1.0), measure: Optional("cup"), food: Optional("chicken stock"), weight: Optional(240.0), foodCategory: Optional("canned soup"), foodID: Optional("food_bptblvzambd16nbhewqmhaw1rnh5"), image: Optional("https://www.edamam.com/food-img/26a/26a10c4cb4e07bab54d8a687ef5ac7d8.jpg"))]), calories: Optional(1473.952874997522), totalWeight: Optional(1553.2927083324514), yield: Optional(8.0), totalTime: Optional(50.0), dietLabels: Optional([]),
            cuisineType: Optional([Cuisine.american]),
            mealType: Optional([Meal.breakfast]),
            dishType: Optional([Dish.condimentsAndSauces]),
            digest: Optional([
                Digest(label: Optional("Fat"), tag: Optional("FAT"), schemaOrgTag: Optional("fatContent"), total: Optional(96.71913635416662), hasRDI: Optional(true), daily: Optional(148.7986713141025)),
                Digest(label: Optional("Carbs"), tag: Optional("CHOCDF"), schemaOrgTag: Optional("carbohydrateContent"), total: Optional(141.06001104102197), hasRDI: Optional(true), daily: Optional(47.02000368034066)),
                Digest(label: Optional("Protein"), tag: Optional("PROCNT"), schemaOrgTag: Optional("proteinContent"), total: Optional(18.9561985416668), hasRDI: Optional(true), daily: Optional(37.9123970833336)),
                Digest(label: Optional("Cholesterol"), tag: Optional("CHOLE"), schemaOrgTag: Optional("cholesterolContent"), total: Optional(251.225), hasRDI: Optional(true), daily: Optional(83.74166666666666)),
                Digest(label: Optional("Sodium"), tag: Optional("NA"), schemaOrgTag: Optional("sodiumContent"), total: Optional(1565.512864583333), hasRDI: Optional(true), daily: Optional(65.22970269097222)),
                Digest(label: Optional("Calcium"), tag: Optional("CA"), schemaOrgTag: nil, total: Optional(249.6202187499826), hasRDI: Optional(true), daily: Optional(24.96202187499826)),
                Digest(label: Optional("Magnesium"), tag: Optional("MG"), schemaOrgTag: nil, total: Optional(132.94608333332644), hasRDI: Optional(true), daily: Optional(31.653829365077723)),
                Digest(label: Optional("Potassium"), tag: Optional("K"), schemaOrgTag: nil, total: Optional(2144.235645833238), hasRDI: Optional(true), daily: Optional(45.622035017728464)),
                Digest(label: Optional("Iron"), tag: Optional("FE"), schemaOrgTag: nil, total: Optional(3.7416545833334003), hasRDI: Optional(true), daily: Optional(20.78696990740778)),
                Digest(label: Optional("Zinc"), tag: Optional("ZN"), schemaOrgTag: nil, total: Optional(2.5910556249999073), hasRDI: Optional(true), daily: Optional(23.555051136362795)),
                Digest(label: Optional("Phosphorus"), tag: Optional("P"), schemaOrgTag: nil, total: Optional(408.439406249995), hasRDI: Optional(true), daily: Optional(58.34848660714214)),
                Digest(label: Optional("Vitamin A"), tag: Optional("VITA_RAE"), schemaOrgTag: nil, total: Optional(1249.461958333463), hasRDI: Optional(true), daily: Optional(138.8291064814959)),
                Digest(label: Optional("Vitamin C"), tag: Optional("VITC"), schemaOrgTag: nil, total: Optional(446.18826041656996), hasRDI: Optional(true), daily: Optional(495.76473379618886)),
                Digest(label: Optional("Thiamin (B1)"), tag: Optional("THIA"), schemaOrgTag: nil, total: Optional(0.6236530937499459), hasRDI: Optional(true), daily: Optional(51.97109114582883)),
                Digest(label: Optional("Riboflavin (B2)"), tag: Optional("RIBF"), schemaOrgTag: nil, total: Optional(0.7256946354166254), hasRDI: Optional(true), daily: Optional(55.82266426281734)),
                Digest(label: Optional("Niacin (B3)"), tag: Optional("NIA"), schemaOrgTag: nil, total: Optional(7.738417885417279), hasRDI: Optional(true), daily: Optional(48.365111783858)),
                Digest(label: Optional("Vitamin B6"), tag: Optional("VITB6A"), schemaOrgTag: nil, total: Optional(1.9889074374999607), hasRDI: Optional(true), daily: Optional(152.99287980768926)),
                Digest(label: Optional("Folate equivalent (total)"), tag: Optional("FOLDFE"), schemaOrgTag: nil, total: Optional(307.8287812499534), hasRDI: Optional(true), daily: Optional(76.95719531248835)),
                Digest(label: Optional("Folate (food)"), tag: Optional("FOLFD"), schemaOrgTag: nil, total: Optional(307.8287812499534), hasRDI: Optional(false), daily: Optional(0.0)),
                Digest(label: Optional("Folic acid"), tag: Optional("FOLAC"), schemaOrgTag: nil, total: Optional(0.0), hasRDI: Optional(false), daily: Optional(0.0)),
                Digest(label: Optional("Vitamin B12"), tag: Optional("VITB12"), schemaOrgTag: nil, total: Optional(0.19295), hasRDI: Optional(true), daily: Optional(8.039583333333335)),
                Digest(label: Optional("Vitamin D"), tag: Optional("VITD"), schemaOrgTag: nil, total: Optional(1.7025000000000001), hasRDI: Optional(true), daily: Optional(11.35)),
                Digest(label: Optional("Vitamin E"), tag: Optional("TOCPHA"), schemaOrgTag: nil, total: Optional(7.614486041666587), hasRDI: Optional(true), daily: Optional(50.76324027777725)),
                Digest(label: Optional("Vitamin K"), tag: Optional("VITK1"), schemaOrgTag: nil, total: Optional(28.318060416677245), hasRDI: Optional(true), daily: Optional(23.59838368056437)),
                Digest(label: Optional("Sugar alcohols"), tag: Optional("Sugar.alcohol"), schemaOrgTag: nil, total: Optional(0.0), hasRDI: Optional(false), daily: Optional(0.0)),
                Digest(label: Optional("Water"), tag: Optional("WATER"), schemaOrgTag: nil, total: Optional(1285.368613645596), hasRDI: Optional(false), daily: Optional(0.0))
            ])
        )
    }
}
