//
//  ContentView.swift
//  Assignment
//
//  Created by Basant Kumar on 18/06/25.
//

import SwiftUI
struct DietPlanView: View {
    @StateObject  var viewModel = DietPlanViewModel()
    @State var searchText = ""
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                headerView
                
                if viewModel.isLoading {
                    ProgressView().padding()
                } else if let error = viewModel.errorMessage {
                    Text(error).foregroundColor(.red)
                } else {
                    dietStreakView
                    searchBarView
                    
                    
                    
                    ForEach(filteredSections.indices, id: \.self) { index in
                        VStack(spacing: 18) {
                            MealListSection(
                                section: filteredSections[index],
                                sectionIndex: index,
                                selectedRecipeIDs: $viewModel.selectedRecipeIDs,
                                onSelectAllChanged: { viewModel.toggleSelectAll(in: index, select: $0) }
                            )
                            
                                       Rectangle()
                                           .fill(Color(.systemGray5))
                                           .frame(height: 6)
                                           .frame(maxWidth: .infinity)
                                           .padding(.horizontal, -16)
                        }
                    }
                    if !viewModel.selectedRecipeIDs.isEmpty {
                        bottomButtons
                    }
                }
            }
            .padding()
        }
        .onAppear {
            viewModel.fetchDiets()
        }
    }
    
    private var filteredSections: [MealSection] {
        if searchText.isEmpty {
            return viewModel.diets.allDiets
        } else {
            return viewModel.diets.allDiets.compactMap { section in
                let filtered = section.recipes.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
                return filtered.isEmpty ? nil : MealSection(
                    daytime: section.daytime,
                    timings: section.timings,
                    progressStatus: section.progressStatus,
                    recipes: filtered
                )
            }
        }
    }
    
}

