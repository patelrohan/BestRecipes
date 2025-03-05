# Summary: 
**BestRecipes** is a curated recipe app that showcases the finest dishes from various cuisines around the world. Each recipe includes a link to a detailed article and, when available, a YouTube video for guided cooking.

### Technologies Used
* SwiftUI
* MVVM
* Swift Concurrency (async/await)
* Image Caching using NSCache for efficient network usage
* Unit Testing (XCTest) 
* DocC
* Git & GitHub
  
  
# Focus Areas: 
I prioritized the following aspects to ensure both code quality and user experience:  
- **Networking with Swift Concurrency** – Swift’s new concurrency model is a powerful tool for writing efficient and safe asynchronous code. Since Apple encourages developers to adopt it, implementing `async/await` helped future-proof the project while making the code more readable and manageable.
  
- **Caching** – Caching images and data minimizes redundant network requests, improving performance and reducing API load. This enhances the user experience by ensuring faster load times, especially for users with slow internet connections.  
- **Alerts & Error Handling** – Implementing robust error handling prevents unexpected crashes and provides informative feedback to users. A well-handled error state ensures a smoother experience, improving overall app reliability.  
- **UI/UX Design** – A polished and intuitive UI is crucial in a competitive app marketplace. Given my background in **Human-Computer Interaction (HCI) and UI/UX**, I wanted to showcase not just technical skills but also the ability to create an accessible and visually appealing interface following iOS Human Interface Guidelines.
- **Code Quality & Documentation** - Followed consistent coding conventions aligned with Swift style guidelines


# ⏳ Time Spent ⏳ 
- **Understanding Requirements, Planning & Feature Breakdown** – 2-3 hrs 
- **UI Implementation** (RecipeListView, Empty State) – 4-5 hrs
- **API Calls Implementation** (including research & learning Swift Concurrency basics) – 3-4 hrs
- **Image Caching** – 1 hr  
- **Alerts & Error Handling** – 2 hrs  
- **Unit Testing** (Swift Testing research, refactoring code, dependency injection research) – 5-6 hrs  
- **Bug Fixes** – 2 hrs  
- **UI Enhancements** – 2 hrs  
- **Project Organization & Documentation** – 1 hr  
- **README Creation** (researching & learning Rotaro tool, screen recording) – 3 hrs  

# ⚖️ Trade-offs and Decisions ⚖️ 
- **Basic Unit Tests** – Due to time constraints, the networking code is tightly coupled, which isn't ideal. Unit tests should be isolated and not rely on real network calls, as an unreliable API could cause tests to fail even if the code is correct. A future improvement would be implementing **mocking** and **dependency injection** to decouple networking and follow a more **Test-Driven Development (TDD)** approach.
  
- **Network Manager Reusability** – Currently, the `NetworkManager` is designed specifically for fetching recipes. Refactoring it into a **generic networking layer** would make it more scalable and reusable for handling different API calls in the future.  


# ⚠️ Weakest Part of the Project/ Known Issues ⚠️ 

- **Delayed ProgressView & Unresponsive UI** – On the first launch, the `ProgressView` takes a while to appear, and the UI becomes unresponsive while images are loading, despite networking being handled on background threads. Investigating this further using **Instruments (Time Profiler)** would help diagnose performance bottlenecks.
   
- **Limited Dependency Injection & TDD** – Due to a basic understanding of **Dependency Injection** and **Test-Driven Development (TDD)**, the current implementation isn't fully optimized for testability. Future improvements could involve refactoring to enhance modularity and better testability.


# ✨ Nice to Have ✨: 
Given more time, I would enhance the app with the following features to further develop my skills:  

- **Accessibility** – Ensure the app is fully accessible by testing compatibility with VoiceOver, Dynamic Text, and other accessibility features.
  
- **Filtering** – Add the ability to filter recipes by cuisine type for a more personalized user experience.  
- **Dependency Injection & TDD** – Improve testability by implementing dependency injection and adopting a test-driven development (TDD) approach.  
- **Swift Testing** – Explore using Swift Testing instead of XCTest for a more modern and streamlined testing experience.  
