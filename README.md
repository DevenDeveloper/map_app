# Flutter Login App with Profile Creation

This is a Flutter-based login app with OTP and email authentication, as well as profile creation functionality. The app includes a login screen, OTP verification, email verification, and a profile creation screen. After successful profile creation, users can view and edit their profile details.

## Features

### Functional Requirements:
1. **Login Options:**
    - Users can log in using a mobile number with OTP or email and password.

2. **OTP Authentication:**
    - When a user enters their mobile number, they will be prompted to input a hardcoded OTP(123456).
    - The app validates the OTP and allows the user to create a password for email case and for mobile create a profile if the OTP is correct.

3. **Email Authentication:**
    - Users can log in using their email, password, with OTP verification for email.
    - Basic validation is performed for email format and password.

4. **UI/UX Requirements:**
    - The app includes proper error messages for invalid inputs (e.g., "Invalid email format" or "Incorrect OTP").
    - A loading indicator is displayed during the mock authentication process.

### Profile Creation:
1. **Profile Fields:**
    - After a successful login, the user is navigated to a Create Profile screen.
    - Fields include:
        - First Name (Text input)
        - Last Name (Text input)
        - Date of Birth (Date picker)
        - Current Location (Use geolocator or mock text field)

2. **Profile Completion:**
    - All fields are required, with validation for empty fields.
    - Upon successful submission, a confirmation screen displays the entered details.

3. **Post-FTU (First-Time User) Flow:**
    - After FTU completion, the app opens with the login page.
    - Upon login, the profile page will be shown with an option to edit the profile.

---

## Installation

### Prerequisites
- Ensure you have Flutter installed on your machine. Follow the [Flutter installation guide](https://flutter.dev/docs/get-started/install) for setup.

### Steps to Run the App
1. Clone the repository or download the project folder.
2. Navigate to the project directory.
3. Run the following command to get the necessary dependencies:

   ```bash
   flutter pub get
   ```

4. To run the app on an emulator or physical device, use the command:

   ```bash
   flutter run
   ```

5. You can also generate an APK by running:

   ```bash
   flutter build apk
   ```

---

## Assumptions Made
- The OTP used for mobile number login is hardcoded for testing purposes(123456).
- The email OTP and password authentication are also simulated, as no backend API is implemented in this assignment.

---

## State Management Approach
This app uses the **Get** package for state management, which is a simple yet powerful solution for managing the app's state in a reactive manner. The Get package is used for managing UI state transitions, such as login state and profile state, ensuring smooth navigation and state consistency. 
I have good knowledge of provider and block as well.

---

## Structure and Code Quality
- The app is built using Flutter's best practices, ensuring a clean and modular code structure.
- State management is handled via the Get package to efficiently manage the app's UI and logic.
- Code comments are provided throughout the app to explain logic and functionality.

---

## Bonus Features
- Animations are implemented for the Splash screen.
- Maintain State management using Get Package

---

## Project Files

- **lib**: Contains the main code for the app.
    - **screens**: Folder for different screen widgets (Login, Profile Creation, etc.)
    - **widgets**: Reusable widget components like input fields and buttons.
    - **state**: GetX state management classes.

- **assets**: Contains any assets like images or icons used in the app.

---

## Contact Information
For any questions or clarifications, please reach out to:
**Devendra**
devendra.cse01@gmail.com