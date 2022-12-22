# UserDefaultsWrapper
A userdefaults/AppStorage property wrapper

The @AppStorage Property Wrapper was introduced in SwiftUI to allow easy access to the user defaults. Although the @AppStorage wrapper is working out great in many cases, it has a few downsides when used across an app.
This wrapper gives a convienent way to access user defaults and store user defaults. We can just treat it as a normal variable and in turn wrappper saves and retrieves from user defaults.

# How to use
We will declare the userdefaults variable as below

 @UserDefaultStorage(defaultValue: "", key: "userName")<br />
 var storedUserName: String?
 
 And to save and retrive we can just use storedUserName variable. ex: let x = storedUserName or storedUserName = "Venkat Naraharisetty"[To save].
 
 # Code:
 Code is in file UserDefaultStorage.swift file
 
 <img width="817" alt="Screen Shot 2022-12-22 at 4 20 16 PM" src="https://user-images.githubusercontent.com/41311647/209236037-d7d5941f-6e40-4578-93f8-b3f5a1fcc0ec.png">

 
