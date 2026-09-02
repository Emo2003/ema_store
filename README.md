<div align="center">

# EMA STORE

### A modern e-commerce experience, built with Flutter

*Browse. Search. Wishlist. Checkout. All in one clean, scalable app.*

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![BLoC](https://img.shields.io/badge/State_Management-BLoC%2FCubit-4285F4?style=for-the-badge)
![REST API](https://img.shields.io/badge/REST-API-FF6F00?style=for-the-badge)

</div>

<br>

## About the Project

**Ema Store** is a fully functional Flutter e-commerce application that takes a user from their first login all the way through to placing an order. It was built to demonstrate a production-style approach to mobile development — clean architecture, predictable state management, and a UI that feels considered rather than default.

Every screen was designed around one idea: **the shopping experience should feel effortless.** Behind that simplicity sits a feature-based codebase built for scale, testability, and long-term maintenance.

<br>

---

## Feature Overview

<table>
<tr>
<td width="50%" valign="top">

### Authentication
- User login
- User registration
- Forgot password
- Password reset

### Home
- Product browsing
- Category browsing
- Brand browsing
- Product search
- Featured product highlights

### Products
- Browse by category
- Browse by brand
- Full product search
- Detailed product view
- Add to cart
- Add / remove from wishlist

</td>
<td width="50%" valign="top">

### Wishlist
- Add to wishlist
- Remove from wishlist
- View saved favorites

### Shopping Cart
- Add products to cart
- Adjust quantity
- Remove items
- Live cart summary
- Automatic total calculation

### Checkout
- Order review
- Delivery details, pulled from the saved profile address
- Simulated payment flow
- Order placement

### Profile
- View account information
- Manage profile details
- Add and manage delivery address
- View order history

</td>
</tr>
</table>

<br>

---

## Screenshots

<div align="center">

### Authentication

<img src="https://github.com/user-attachments/assets/e875fd43-5772-48c4-aae1-5af64bf84b02" width="170"/>
<img src="https://github.com/user-attachments/assets/c53e0b0f-0dc4-4f02-ba09-760ea60c72d0" width="170"/>
<img src="https://github.com/user-attachments/assets/6483bbc0-4a37-4c68-8c50-339fca5e2d08" width="170"/>
<img src="https://github.com/user-attachments/assets/04fe7bfb-876d-4b16-8337-2ed16ebb22bf" width="170"/>
<img src="https://github.com/user-attachments/assets/ab941ab6-8938-4645-8d8c-69330c971cd1" width="170"/>

<br><br>

### Home & Product Discovery

<img src="https://github.com/user-attachments/assets/b8b96a8a-0b74-49e4-b791-201133a33990" width="170"/>
<img src="https://github.com/user-attachments/assets/062fa1de-ff8e-499b-b98e-4daa034b7bee" width="170"/>
<img src="https://github.com/user-attachments/assets/0330b646-64cd-4419-9aa7-5a9221325b5d" width="170"/>

<br><br>

### Products & Wishlist

<img src="https://github.com/user-attachments/assets/51140878-3e45-4647-95cb-e5d9ff8fd66f" width="170"/>
<img src="https://github.com/user-attachments/assets/28397c39-44b5-418d-899b-9e6a2ce5a158" width="170"/>
<img src="https://github.com/user-attachments/assets/cdf64222-f5d9-4fa7-9a27-88136e4634ce" width="170"/>

<br><br>

### Cart & Checkout

<img src="https://github.com/user-attachments/assets/9a986f82-4f48-4e01-a8cd-05e4e70a61ba" width="170"/>
<img src="https://github.com/user-attachments/assets/a82adac3-5681-4cc0-944b-aa570c06629e" width="170"/>
<img src="https://github.com/user-attachments/assets/99c2649a-578b-4f8b-8195-ad8542a70a2c" width="170"/>
<img src="https://github.com/user-attachments/assets/8cfb927e-711a-4edd-8851-7a64f0a73cbc" width="170"/>

<br><br>

### Profile & Orders

<img src="https://github.com/user-attachments/assets/0f5e2779-9614-478f-8274-52bdfc48ad49" width="170"/>
<img src="https://github.com/user-attachments/assets/859b3eaa-7124-48e7-b27c-001d44e29bc2" width="170"/>
<img src="https://github.com/user-attachments/assets/f3bbcd78-5727-48bd-b55a-2d10325c5efc" width="170"/>

</div>

<br>

---

## Tech Stack

| Layer | Tools |
|---|---|
| **Framework** | Flutter, Dart |
| **State Management** | BLoC / Cubit |
| **Networking** | Dio, REST APIs |
| **Dependency Injection** | GetIt, Injectable |
| **UI Utilities** | Flutter ScreenUtil, SVG Assets |
| **Version Control** | Git & GitHub |

<br>

---

## Architecture

Ema Store follows a **feature-based clean architecture**, separating presentation, business logic, and data concerns so each part of the app can evolve independently.

```text
lib/
├── core/
│   ├── config/
│   ├── error_handling/
│   ├── resources/
│   ├── routes/
│   └── widgets/
│
└── features/
    ├── auth/
    ├── home/
    ├── category/
    ├── products/
    ├── cart/
    ├── wishlist/
    ├── checkout/
    └── profile/
```

### State Management

Each feature owns its own **Cubit**, keeping UI, logic, and data flow cleanly separated:

| Cubit | Responsibility |
|---|---|
| `HomeCubit` | Home feed, featured products, categories & brands |
| `CategoryCubit` | Category-based product filtering |
| `CartCubit` | Cart items, quantities, totals |
| `WishlistCubit` | Saved / favorite products |
| `ProfileCubit` | User profile data, saved delivery address, order history |

This structure keeps the UI layer dumb and declarative, while all business logic lives in a single, testable place per feature.

<br>

### Profile-Driven Delivery

The user's **delivery address is managed from their Profile** and reused automatically at checkout, so returning users can review and place an order without re-entering their details every time. The same Profile section surfaces a **full history of past orders**, giving users a single place to manage both their account and their purchase activity.

<br>

---

## Application Flow

<div align="center">

**Authentication**  →  **Home**  →  **Categories / Brands**  →  **Products**
→ **Product Details**  →  **Cart**  →  **Checkout**  →  **Payment**  →  **Place Order**

</div>

<br>

---

## API Integration

The app talks to a RESTful backend for all core data:

**Products · Categories · Brands · Users · Wishlist · Cart · Orders**

All network calls are handled through **Dio**, with each Cubit orchestrating requests, loading states, and error handling — keeping the UI reactive to every stage of a request.

<br>

---

## Getting Started

### Prerequisites

Make sure Flutter is installed and configured on your machine:

```bash
flutter doctor
```

### Installation

**1. Clone the repository**

```bash
git clone https://github.com/your-username/ema_store.git
```

**2. Navigate into the project**

```bash
cd ema_store
```

**3. Install dependencies**

```bash
flutter pub get
```

**4. Run the app**

```bash
flutter run
```

<br>

---

## Project Goals

This project was built to:

- Deliver a complete, real-world e-commerce app using Flutter
- Practice scalable state management with BLoC/Cubit
- Integrate and manage data through REST APIs
- Apply clean, maintainable, feature-based architecture
- Build reusable, consistent UI components
- Handle complex, multi-step navigation flows
- Recreate a full shopping journey — from first browse to placed order
- Connect user profile data (like saved addresses) directly into the checkout flow

<br>

---

<div align="center">

## Developer

**Eman Medhat**

*Flutter Developer · Computer Science Graduate*

</div>
