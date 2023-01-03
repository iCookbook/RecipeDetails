# "Recipe Details" module

Module that is shown after user tapps on a recipe

## To set up

This module could be opened in [Discover](https://github.com/iCookbook/Discover) and [Search](https://github.com/iCookbook/Search) modules. 

It requires `Recipe` instance that must be provided inside `RecipeDetailsContext`.

## Dependencies

This module has 4 dependencies:

- `CommonUI` for some reasons:
    * Image loader in `UIImageView`
    * Usage `WebViewController` class
    * Identifiers of the cells
    * RecipeDetailsViewController requires to import it's ancestor
- `Resources` for access to resources of the application
- `Models` to use `Recipe` model
- `Persistence` to save favourites recipes

## Screenshots

| <img width=300 src="https://user-images.githubusercontent.com/60363270/200943946-6b736b4d-5516-4919-8dab-6abf6891488e.png"> | <img width=300 src="https://user-images.githubusercontent.com/60363270/200943981-b91e7a58-35d3-4cf4-90aa-e250d04e5572.png"> | <img width=300 src="https://user-images.githubusercontent.com/60363270/200944012-b6a73c53-7f3a-4f5b-bdd3-747830e338fc.png"> |
|---|---|---|

---

For more details, read [GitHub Wiki] documentation(https://github.com/iCookbook/RecipeDetails/wiki)
