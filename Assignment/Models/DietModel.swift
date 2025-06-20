//
//  Model.swift
//  Assignment
//
//  Created by Basant Kumar on 19/06/25.
//

import Foundation

struct DietResponse: Decodable {
    let status: String
    let message: String
    let data: DietData
}

struct DietData: Decodable {
    let diets: Diets
}

struct Diets: Decodable {
    let dietStreak: [String]
    let allDiets: [MealSection]
}

struct MealSection: Identifiable, Decodable {
    var id: UUID { UUID() }
    let daytime: String
    let timings: String
    let progressStatus: ProgressStatus
    let recipes: [Recipe]
}

struct ProgressStatus: Decodable {
    let total: Int
    let completed: Int
}

struct Recipe: Identifiable, Decodable {
    let id: Int
    let title: String
    let timeSlot: String
    let duration: Int
    let image: String
    let isFavorite: Int
    let isCompleted: Int
}
