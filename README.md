# MVVM-details

This is an iOS app built using the **MVVM (Model-View-ViewModel)** design pattern, along with a **Networking Layer**, **Repository Pattern**, and **Navigation** to fetch and display user data.

## Features

- Fetches user data from a public API (JSONPlaceholder).
- Displays a list of users with their names and email addresses.
- Navigates to a detail screen when a user is selected.
- Follows the **MVVM** pattern for separating concerns.

## Architecture

### **MVVM:**
- **Model**: The `UserData` model represents the data structure fetched from the API.
- **ViewModel**: The `UserDataViewModel` fetches data, processes it, and provides it to the view.
- **Views**: The `UsersViewController` presents the data to the user and handles user interactions and `UserDetailViewController` presents the detail of the user in a different screen.

### **Networking Layer:**
- `NetworkManager` is responsible for making network requests and decoding the JSON response into the model.

### **Repository Pattern:**
- `UserRepository` abstracts the data fetching logic and provides it to the ViewModel.

### **Navigation:**
- When a user is tapped in the list, the app navigates to a detail screen (`UserDetailViewController`) to show more user details.

## Setup

### Prerequisites
Make sure you have the following installed:
- **Xcode**: Version 16.2 or higher.

### Installation
1. Clone the repository to your local machine:
   ```bash
   git clone https://github.com/freeze1131/MVVM-details.git
2. Navigate to the project directory.
3. Build and Run the project.
