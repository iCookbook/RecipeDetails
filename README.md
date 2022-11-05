# Recipe Details module

Module that is shown after user tapps on a recipe

## The begining

To start, it requires `Recipe` instance that should be provided inside `RecipeDetailsContext` structure.

## Dependencies

This module has 4 dependencies:

- `CommonUI` for some reasons:
    * Image loader in `UIImageView`
    * Access to `UIButton`'s creators
- `Resources` for access to resources of the application
- `Models` to use `Recipe` model
- `Persistence` to save favourites recipes
