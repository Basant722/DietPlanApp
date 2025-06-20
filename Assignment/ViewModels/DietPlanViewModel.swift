//
//  vm.swift
//  Assignment
//
//  Created by Basant Kumar on 20/06/25.
//
import Foundation

@MainActor
class DietPlanViewModel: ObservableObject {
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    @Published var diets: Diets = Diets(dietStreak: [], allDiets: [])
    @Published var selectedRecipeIDs: Set<Int> = []

    func fetchDiets() {
        isLoading = true
        errorMessage = nil

        guard let url = URL(string: "https://uptodd.com/fetch-all-diets") else {
            isLoading = false
            errorMessage = "Invalid URL"
            return
        }

        Task {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let decoded = try JSONDecoder().decode(DietResponse.self, from: data)
                
                diets = decoded.data.diets
                let completed = diets.allDiets
                    .flatMap { $0.recipes }
                    .filter { $0.isCompleted == 1 }
                    .map { $0.id }

                selectedRecipeIDs = Set(completed)
                isLoading = false
            } catch {
                errorMessage = "Failed to load diets: \(error.localizedDescription)"
                isLoading = false
            }
        }
    }

    func toggleSelectAll(in sectionIndex: Int, select: Bool) {
        guard diets.allDiets.indices.contains(sectionIndex) else { return }

        let ids = diets.allDiets[sectionIndex].recipes.map { $0.id }

        if select {
            selectedRecipeIDs.formUnion(ids)
        } else {
            selectedRecipeIDs.subtract(ids)
        }
    }
}
