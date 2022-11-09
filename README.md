# "Recipe Details" module

Module that is shown after user tapps on a recipe

## To set up

This module could be opened in [Discover](https://github.com/iCookbook/Discover) and [Search](https://github.com/iCookbook/Search) modules. 

It requires `Recipe` instance that must be provided inside `RecipeDetailsContext`.

## Dependencies

This module has 4 dependencies:

- `CommonUI` for some reasons:
    * Image loader in `UIImageView`
    * Access to `UIButton`'s creators
- `Resources` for access to resources of the application
- `Models` to use `Recipe` model
- `Persistence` to save favourites recipes

## Screenshots
