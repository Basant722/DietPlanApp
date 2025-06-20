# 🍽️ DietPlanApp

A clean, modular, and well-structured iOS app built using **SwiftUI** and **MVVM** architecture. The app helps users visualize and interact with a daily diet plan, track meal progress, and select meals with a smart UI experience.

---

## 🚀 Features

- Meal Selection UI** with smart checkbox logic
- Meal Streaks (Morning, Afternoon, Evening, Night)
- Real-time UI updates with `@Binding` and `@Published`
- Live search to filter meals
- Progress indicator for meal completion
- Built using `URLSession` and `async/await` for data fetching
- Responsive layout with reusable custom views

---

## 🧱 Architecture

The project follows **MVVM (Model-View-ViewModel)** design pattern:

- Model → Data structure (`DietModel.swift`)
- ViewModel → Handles logic and state (`DietPlanViewModel.swift`)
- Views → UI components and pages (`DietPlanView`, `MealListSection`, `MealCardView`, `CheckBoxView`)
- Extensions → Separated UI modules for readability (`Header`, `SearchBar`, etc.)
- Resources → Shared UI styles like fonts/colors

---

## Project Structure

Assignment/
├── AssignmentApp.swift # App Entry Point
│
├── Extensions/ # Modular UI parts of DietPlanView
│ ├── DietPlanView+Header.swift
│ ├── DietPlanView+SearchBar.swift
│ ├── DietPlanView+DietStreak.swift
│ └── DietPlanView+BottomButtons.swift
│
├── Models/
│ └── DietModel.swift # Contains DietResponse, MealSection, Recipe models
│
├── Preview Content/
│ └── Preview Assets/ # SwiftUI previews (optional)
│
├── Resources/
│ ├── Assets.xcassets # Image and color assets
│ └── TextStyles.swift # Common text styles
│
├── ViewModels/
│ └── DietPlanViewModel.swift # Business logic and API handling
│
├── Views/
│ ├── DietPlanView.swift # Main screen with diet data
│ ├── MealListSection.swift # Each meal time block
│ ├── MealCardView.swift # Individual meal card
│ └── CheckBoxView.swift # Custom checkbox component

yaml
Copy
Edit

---

#Networking

- Endpoint**: `GET https://uptodd.com/fetch-all-diets`
- Method**: `URLSession` with `async/await`
- Parsed into `Diets` model and stored in `@Published var diets`
- Completed meals are automatically marked as selected on load

---

## Data Flow & State Management

- `@StateObject` → Instantiates `DietPlanViewModel` in the main view
- `@Binding` → Used to pass selected meal IDs to subviews
- `@Published` → Triggers UI refresh when the meal selection or API data changes

## Two-Way Binding Examples:

- Meal selection checkboxes
- "Select All" toggles per section
- Live search input

---

##  Key Logic

- If no meals are selected, only "Customize" and "Fed" buttons show
- If meals are selected, bottom buttons appear and "Fed" button hides
- If a recipe is `isCompleted == 1` (from API), it shows as selected
- Smart border and checkbox visibility based on selection

---

## Search Functionality

Search bar filters meals across all sections using SwiftUI's built-in `TextField`. Filtered results show real-time updates as users type.

---

## UI Details

- Progress Ring shows completion status per meal section
- Checkboxes allow per-meal and full-section selection
- Border highlights** selected meals
- Section separators (light grey strips) visually distinguish sections
---

## Requirements

- iOS 15.0+
- Xcode 14+
- Swift 5.7+

---

## ▶️ Run the App

1. Clone the repository
2. Open `Assignment.xcodeproj`
3. Run on simulator or physical device (iPhone preferred)
