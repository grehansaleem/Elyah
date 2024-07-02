//
//  Defaults.swift
//  Elyah
//
//  Created by Appcrates_Dev on 9/29/20.
//  Copyright © 2020 Appcrates. All rights reserved.
//

import Foundation

// MARK: Top Featured Products
let TopFeatured: [Product] = [
    wallpapers
]

// MARK: Featured Products
let Featured: [Product] = [
    wallpapers, recipeBooks, photoshops, hosting, woodworking
]

// MARK: Ebooks Products
let EBooks: [Product] = [
    poetryBooks, recipeBooks, magazines, documentTemplates, coverLetters
]

/// eBooks List

fileprivate let poetryBooks = Product(
    id: 0,
    name: "Poetry books",
    image: "poetry-books"
)

fileprivate let recipeBooks = Product(
    id: 1,
    name: "Recipe books",
    image: "recipe-books"
)

fileprivate let magazines = Product(
    id: 2,
    name: "Magazines",
    image: "magazines"
)

fileprivate let documentTemplates = Product(
    id: 3,
    name: "Document templates",
    image: "dicuments"
)

fileprivate let coverLetters = Product(
    id: 4,
    name: "Cover Letters",
    image: "covers"
)


// MARK: Comics Products
let Comics: [Product] = [
    wallpapers, posters, photoshops, threedmodels, iconSets
]

/// Comics List

fileprivate let wallpapers = Product(
    id: 0,
    name: "Wallpapers",
    image: "wallpapers"
)

fileprivate let posters = Product(
    id: 1,
    name: "Posters",
    image: "posters"
)

fileprivate let photoshops = Product(
    id: 2,
    name: "Photoshop",
    image: "photoshops"
)

fileprivate let threedmodels = Product(
    id: 3,
    name: "3D models",
    image: "3d-models"
)

fileprivate let iconSets = Product(
    id: 4,
    name: "Icon sets",
    image: "icon-sets"
)


// MARK: Technologies Products
let Techs: [Product] = [
    apps, browserPlugins, games, hosting, codeSnippets
]

let TechsRowOne: [Product] = [
    apps, browserPlugins
]

let TechsRowTwo: [Product] = [
    games, hosting
]

let TechsRowThree: [Product] = [
    codeSnippets
]

/// Technologies List

fileprivate let apps = Product(
    id: 0,
    name: "Apps",
    image: "apps"
)

fileprivate let browserPlugins = Product(
    id: 1,
    name: "Browser Plugins",
    image: "browser-plugins"
)

fileprivate let games = Product(
    id: 2,
    name: "Games",
    image: "games"
)

fileprivate let hosting = Product(
    id: 3,
    name: "Hosting",
    image: "hosting"
)

fileprivate let codeSnippets = Product(
    id: 4,
    name: "Code Snippets",
    image: "code-snippet"
)


// MARK: Miscellaneous Products
let Miscellaneous: [Product] = [
    nutritionPlans, workoutPlans, architecturalPlans, worksheets, woodworking
]

/// Miscellaneous List

fileprivate let nutritionPlans = Product(
    id: 0,
    name: "Nutrition plans",
    image: "nutrition"
)

fileprivate let workoutPlans = Product(
    id: 1,
    name: "Workout plans",
    image: "workout"
)

fileprivate let architecturalPlans = Product(
    id: 2,
    name: "Architectural plans",
    image: "architecture"
)

fileprivate let worksheets = Product(
    id: 3,
    name: "Worksheets",
    image: "worksheet"
)

fileprivate let woodworking = Product(
    id: 4,
    name: "Woodworking",
    image: "Woodwork"
)
