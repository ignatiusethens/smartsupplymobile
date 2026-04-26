# SMART SUPPLY SOURCING PLATFORM — ALL DIAGRAMS (MERMAID FORMAT)

This file contains all diagrams from the research documentation converted to Mermaid format, organized by chapter and diagram type.

---

## CHAPTER 4 — CURRENT SYSTEM DIAGRAMS

---

### Figure 4.1 — Context Diagram: Current Industrial Equipment Sourcing System

```mermaid
graph LR
    BUYER([BUYER])
    SUPPLIER([SUPPLIER])
    BANK([BANK / M-PESA])
    LOGISTICS([LOGISTICS PROVIDER])

    BUYER -->|Equipment Inquiry| SYS[Current Sourcing System]
    SYS -->|Quotation / Product Info| BUYER
    SYS -->|Quotation Request| SUPPLIER
    SUPPLIER -->|Product Info / Quotation| SYS
    SYS -->|Purchase Order| SUPPLIER
    SYS -->|Payment Request| BANK
    BANK -->|Payment Confirmation| SYS
    SYS -->|Delivery Instructions| LOGISTICS
    LOGISTICS -->|Delivery Status| SYS
    SYS -->|Invoice / Receipt / Delivery Confirmation| BUYER
```

---

### Figure 4.2 — DFD Level 0: Current Industrial Equipment Sourcing System

```mermaid
flowchart TD
    BUYER([BUYER])
    SUPPLIER([SUPPLIER])
    BANK([BANK / M-PESA])
    LOGISTICS([LOGISTICS PROVIDER])
    D1[(Transaction Archive\nManual Files / Email / Spreadsheets)]

    BUYER -->|Equipment Inquiry| P1[1.0 Inquiry & Quotation Management]
    SUPPLIER -->|Product Info| P1
    P1 -->|Quotation Request| SUPPLIER
    P1 -->|Accepted Quotation| P2[2.0 Order & Payment Processing]
    BANK -->|Payment Confirmation| P2
    P2 -->|Payment Request| BANK
    P2 -->|Purchase Order| SUPPLIER
    P2 -->|Order Record| P3[3.0 Delivery & Tracking Management]
    LOGISTICS -->|Delivery Status| P3
    P3 -->|Delivery Instructions| LOGISTICS
    P3 -->|Delivery Confirmation| BUYER
    P3 -->|Completed Transaction| P4[4.0 Documentation & Record Keeping]
    P4 -->|Invoice / Receipt| BUYER
    P4 -->|Financial Records| D1
```

---

### Figure 4.3 — DFD Level 1: Order Processing (Expansion of Process 2.0)

```mermaid
flowchart TD
    BUYER([BUYER])
    BANK_M([BANK / M-PESA])
    SUPPLIER([SUPPLIER])
    D2[(Payment Records)]
    D3[(Order Archive)]

    BUYER -->|Accepted Quotation + Payment Intent| P21[2.1 Payment Method Selection]
    P21 -->|Records| D2
    P21 -->|M-Pesa Route| P22[2.2 M-Pesa Payment Processing]
    P21 -->|Bank Route| P23[2.3 Bank Transfer Processing]
    P22 -->|M-Pesa Code| P24[2.4 M-Pesa Confirmation]
    P23 -->|Bank Reference| P25[2.5 Bank Confirmation]
    P24 -->|Payment Confirmed| P26[2.6 Purchase Order Generation]
    P25 -->|Payment Confirmed| P26
    P26 -->|Purchase Order| SUPPLIER
    P26 -->|Order Confirmation| BUYER
    P26 -->|Order Record| D3
```

---

### Figure 4.4 — Flowchart: Manual Payment Reconciliation Process

```mermaid
flowchart TD
    A([START]) --> B[Receive Payment Notification\nM-Pesa / Bank SMS]
    B --> C[Record Payment Reference\nin Spreadsheet]
    C --> D[Locate Matching Quotation\nor Invoice in Email / Files]
    D --> E{Does Payment Amount\nMatch Invoice Amount?}
    E -->|NO| F[Contact Buyer\nfor Clarification]
    F -->|Resolved| G[Mark Invoice as Paid\nin Records]
    E -->|YES| G
    G --> H[Notify Supplier\nto Process Order]
    H --> I{Is Full Payment\nReceived?}
    I -->|NO| J[Record Partial Payment;\nAwait Balance]
    J -->|Balance Received| K[Issue Receipt to Buyer]
    I -->|YES| K
    K --> L[File Transaction Documents]
    L --> M([END])
```

---

### Figure 4.5 — Flowchart: Sourcing Request Handling Process

```mermaid
flowchart TD
    A([START]) --> B[Buyer Identifies\nEquipment Need]
    B --> C[Search Online &\nContact Known Suppliers]
    C --> D{Equipment Found\nLocally?}
    D -->|NO| E[Contact Clearing Agent\nfor Import]
    E --> G[Agent Sources\nInternational Suppliers]
    D -->|YES| F[Request Quotations\nfrom 3+ Suppliers]
    G --> H[Compare Quotations\nPrice, Quality, Lead Time]
    F --> H
    H --> I{Acceptable Quote\nReceived?}
    I -->|NO| J[Negotiate or\nSeek More Suppliers]
    J --> H
    I -->|YES| K[Issue Purchase Order\nto Selected Supplier]
    K --> L[Arrange Payment\nBank / M-Pesa]
    L --> M[Await Delivery;\nFollow Up via Phone / WhatsApp]
    M --> N{Equipment Delivered\nas Specified?}
    N -->|NO| O[Escalate Dispute\nwith Supplier]
    O -->|Resolved| P[Confirm Receipt;\nRelease Final Payment if Due]
    N -->|YES| P
    P --> Q([END])
```


---

## CHAPTER 5 — PROPOSED SYSTEM DIAGRAMS

---

### Figure 5.1 — Use Case Diagram: Buyer Module

```mermaid
graph LR
    BUYER([BUYER])

    subgraph SMART_SUPPLY[Smart Supply Sourcing Platform — Buyer Module]
        UC1(Register / Login)
        UC2(Browse Product Catalog)
        UC3(Search Products)
        UC4(View Product Details)
        UC5(Add to Cart)
        UC6(Checkout & Pay)
        UC7(Track Order Status)
        UC8(Submit Sourcing Request)
        UC9(View Quotations)
        UC10(View Order History)
    end

    BUYER --> UC1
    BUYER --> UC2
    BUYER --> UC3
    BUYER --> UC4
    BUYER --> UC5
    BUYER --> UC6
    BUYER --> UC7
    BUYER --> UC8
    BUYER --> UC9
    BUYER --> UC10
```

---

### Figure 5.2 — Use Case Diagram: Admin Module

```mermaid
graph LR
    ADMIN([ADMIN])

    subgraph SMART_SUPPLY[Smart Supply Sourcing Platform — Admin Module]
        UA1(Admin Login — Secure)
        UA2(Manage Products\nAdd / Edit / Delete)
        UA3(Manage Categories)
        UA4(View & Process Orders)
        UA5(Reconcile Payments)
        UA6(Manage Sourcing Requests)
        UA7(Submit Quotations)
        UA8(View Analytics Dashboard)
    end

    ADMIN --> UA1
    ADMIN --> UA2
    ADMIN --> UA3
    ADMIN --> UA4
    ADMIN --> UA5
    ADMIN --> UA6
    ADMIN --> UA7
    ADMIN --> UA8
```

---

### Figure 5.3 — Use Case Diagram: Payment Module

```mermaid
flowchart TD
    BUYER([BUYER])
    ADMIN([ADMIN])
    MPESA([SAFARICOM M-PESA])

    BUYER --> PM1[Select Payment Method]
    PM1 --> PM2[M-Pesa Payment]
    PM1 --> PM3[Bank Transfer Payment]
    PM2 -->|STK Push Request| MPESA
    MPESA -->|STK Push Callback| PM4[Payment Confirmation]
    PM3 -->|Reference Number Generation| PM4
    PM4 --> PM5[Payment Reconciliation]
    ADMIN --> PM5
    PM5 --> PM6[Order Release for Processing]
```

---

### Figure 5.4 — Activity Diagram: User Registration

```mermaid
flowchart TD
    A([START]) --> B[App Launches SplashScreen\n3-second animated loader]
    B --> C[Navigate to SignupScreen]
    C --> D[Fill Registration Form\nFull Name, Email, Phone, Password, Confirm Password]
    D --> E{Form Validation\nPasses?}
    E -->|NO| F[Display Inline Field Error Messages]
    F -->|User Corrects Input| D
    E -->|YES| G[Submit Registration]
    G --> H{Email Already\nRegistered?}
    H -->|YES| I[Show Error: Account Already Exists]
    I --> D
    H -->|NO| J[Hash Password — bcrypt]
    J --> K[Save User Record to Database]
    K --> L[Issue JWT Session Token]
    L --> M[Navigate to HomeScreen\npushReplacement — no back stack]
    M --> N([END])
```

---

### Figure 5.5 — Activity Diagram: Product Ordering (Flutter Mobile App)

```mermaid
flowchart TD
    A([START]) --> B[Browse CatalogScreen\nSearch & Filter Products]
    B --> C[Tap Product → ProductDetailsScreen\nView Specs, Price, Images]
    C --> D[Tap Add to Cart\nSelect Quantity]
    D --> E{Continue Shopping?}
    E -->|YES| B
    E -->|NO| F[Navigate to ShoppingCartScreen\nReview Items, Quantities, Total]
    F --> G[Tap Proceed to Checkout]
    G --> H[CheckoutScreen — Step 1\nEnter Delivery Address & Phone]
    H --> I[CheckoutPaymentScreen — Step 2\nSelect M-Pesa or Bank Transfer]
    I --> J{Payment Method?}
    J -->|M-Pesa| K[Enter M-Pesa Phone Number\nTap Pay KES Amount]
    J -->|Bank Transfer| L[View Bank Account Details\nUpload Proof of Payment]
    K --> M[CheckoutReviewScreen — Step 3\nReview Full Order Summary]
    L --> M
    M --> N{Agreed to Terms\n& Conditions?}
    N -->|NO| O[Check Terms Checkbox]
    O --> N
    N -->|YES| P[Tap Confirm Order Button]
    P --> Q[Navigate to OrderConfirmationScreen\nOrder #SS-XXXXX Placed]
    Q --> R{User Action?}
    R -->|Track Order| S[Navigate to OrderTrackingScreen\nView Shipment Timeline]
    R -->|Continue Shopping| B
    S --> T([END])
```

---

### Figure 5.6 — Activity Diagram: Sourcing Request

```mermaid
flowchart TD
    A([START]) --> B[Buyer Searches Catalog —\nItem Not Found]
    B --> C[Navigate to Sourcing Request Form]
    C --> D[Fill Request Form\nDescription, Specs, Qty, Budget]
    D --> E[Submit Request]
    E --> F[System Saves Request;\nNotifies Admin]
    F --> G[Admin Reviews Request]
    G --> H[Admin Submits Quotation]
    H --> I[Buyer Notified of Quotation]
    I --> J{Buyer Accepts\nQuotation?}
    J -->|NO| K[Buyer Requests Revision\nor Declines]
    J -->|YES| L[Proceed to Checkout & Payment]
    L --> M([END])
```


---

### Figure 5.7 — Sequence Diagram: User Authentication (Flutter Mobile App)

```mermaid
sequenceDiagram
    participant App as Flutter App
    participant Splash as SplashScreen
    participant Signup as SignupScreen
    participant Login as LoginScreen
    participant API as Backend REST API
    participant DB as Database

    App->>Splash: Launch — initState timer 3s
    Splash->>Signup: pushReplacementNamed('/signup')
    Signup->>Signup: User fills Name, Email, Phone, Password
    Signup->>Signup: Form validation passes
    Signup->>API: POST /api/auth/register {name, email, phone, password}
    API->>DB: Check email uniqueness
    DB-->>API: Email available
    API->>DB: INSERT user record, hash password
    DB-->>API: User created
    API-->>Signup: 201 Created + JWT token
    Signup->>App: pushReplacementNamed('/home')

    Note over App,Login: Returning user flow
    Login->>Login: User enters Corporate Email & Password
    Login->>Login: Form validation passes
    Login->>API: POST /api/auth/login {email, password}
    API->>DB: Query user by email
    DB-->>API: User record
    API->>API: Verify bcrypt password hash
    API-->>Login: 200 OK + JWT token
    Login->>App: pushReplacementNamed('/home')
```

---

### Figure 5.8 — Sequence Diagram: Add to Cart (Flutter Mobile App)

```mermaid
sequenceDiagram
    participant User
    participant Catalog as CatalogScreen
    participant Detail as ProductDetailsScreen
    participant Cart as ShoppingCartScreen
    participant State as App State

    User->>Catalog: Browse products list
    User->>Detail: Tap product card
    Catalog->>Detail: Navigator.pushNamed('/product-detail')
    User->>Detail: Select quantity, tap Add to Cart
    Detail->>State: Add CartItem {productId, qty, price}
    State-->>Detail: Cart updated
    Detail-->>User: Show snackbar "Added to Cart"
    Detail-->>Catalog: Cart badge count updated
    User->>Cart: Tap cart icon
    Detail->>Cart: Navigator.pushNamed('/shopping-cart')
    Cart->>State: Read cart items
    State-->>Cart: CartItem list
    Cart-->>User: Render items, subtotal, total
```

---

### Figure 5.9 — Sequence Diagram: M-Pesa Payment Processing (Flutter Mobile App)

```mermaid
sequenceDiagram
    participant User
    participant Review as CheckoutReviewScreen
    participant PayAPI as Backend Payment API
    participant Daraja as Daraja API (Safaricom)
    participant DB as Database
    participant Confirm as OrderConfirmationScreen

    User->>Review: Select M-Pesa, tap Pay KES 58,950
    Review->>PayAPI: POST /api/payments/mpesa {phone, amount, orderId}
    PayAPI->>Daraja: STK Push Request {phone, amount, callbackUrl}
    Daraja-->>PayAPI: {CheckoutRequestID, ResponseCode: 0}
    PayAPI->>DB: INSERT payment {status: PENDING, checkoutRequestId}
    PayAPI-->>Review: {pending: true, checkoutRequestID}
    Review-->>User: Show "Waiting for M-Pesa PIN" indicator
    Note over User: User receives STK push, enters PIN on phone
    Daraja-->>PayAPI: Callback {ResultCode: 0, MpesaReceiptNumber}
    PayAPI->>DB: UPDATE payment {status: CONFIRMED, mpesaCode}
    PayAPI->>DB: UPDATE order {status: CONFIRMED}
    DB-->>PayAPI: Updated
    PayAPI-->>Review: Payment confirmed
    Review->>Confirm: Navigator.pushNamed('/order-confirmation')
    Confirm-->>User: Display Order #SS-82910 Placed Successfully
```

---

### Figure 5.10 — Sequence Diagram: Order Tracking (Flutter Mobile App)

```mermaid
sequenceDiagram
    participant User
    participant Confirm as OrderConfirmationScreen
    participant Tracking as OrderTrackingScreen
    participant API as Backend Orders API
    participant DB as Database

    User->>Confirm: Tap "Track Order" button
    Confirm->>Tracking: Navigator.pushNamed('/order-tracking')
    Tracking->>API: GET /api/orders/{orderId}/tracking
    API->>DB: Query order + shipment stages
    DB-->>API: Order record + stage statuses
    API-->>Tracking: {orderId, freightType, stages[], weight, volume}
    Tracking-->>User: Render shipment timeline\nCompleted / Active / Pending stages
    User->>Tracking: Toggle Air Freight / Sea Freight
    Tracking->>Tracking: setState — update freightType
    Tracking-->>User: Re-render timeline for selected freight type
    User->>Tracking: Tap Home in bottom nav
    Tracking->>Tracking: Navigator.popUntil(isFirst)
```


---

### Figure 5.11 — Class Diagram: User and Authentication

```mermaid
classDiagram
    class User {
        +String id (UUID)
        +String name
        +String email
        +String phone
        +String passwordHash
        +UserRole role
        +String companyName
        +Date createdAt
        +Date updatedAt
        +register() User
        +login() Session
        +updateProfile() User
        +getOrders() Order[]
    }

    class Session {
        +String id
        +String userId
        +String token (JWT)
        +Date expiresAt
        +validate() Boolean
        +refresh() Session
        +revoke() void
    }

    class UserRole {
        <<enumeration>>
        BUYER
        ADMIN
    }

    User "1" --> "*" Session
    User --> UserRole
```

---

### Figure 5.12 — Class Diagram: Product and Category

```mermaid
classDiagram
    class Category {
        +String id (UUID)
        +String name
        +String slug
        +String description
        +String imageUrl
        +String parentId
        +getProducts() Product[]
        +getChildren() Category[]
    }

    class Product {
        +String id (UUID)
        +String categoryId
        +String name
        +String slug
        +String description
        +Decimal price
        +Integer stockQuantity
        +String brand
        +String sku
        +JSON specifications
        +Boolean isActive
        +Date createdAt
        +Date updatedAt
        +getImages() ProductImage[]
        +updateStock() void
        +isInStock() Boolean
    }

    class ProductImage {
        +String id
        +String productId
        +String url
        +String altText
        +Boolean isPrimary
        +Integer sortOrder
    }

    Category "1" --> "*" Product : contains
    Product "1" --> "*" ProductImage : has
```

---

### Figure 5.13 — Class Diagram: Order and Payment

```mermaid
classDiagram
    class Order {
        +String id (UUID)
        +String userId
        +OrderStatus status
        +Decimal totalAmount
        +String deliveryAddress
        +String notes
        +Date createdAt
        +Date updatedAt
        +calculateTotal() Decimal
        +updateStatus() void
        +getPayments() Payment[]
    }

    class OrderItem {
        +String id
        +String orderId
        +String productId
        +Integer quantity
        +Decimal unitPrice
        +Decimal subtotal
    }

    class Payment {
        +String id (UUID)
        +String orderId
        +PaymentMethod method
        +Decimal amount
        +PaymentStatus status
        +String reference
        +String mpesaCode
        +Date paidAt
        +Date createdAt
        +initiateMpesa() void
        +confirmPayment() void
        +generateReference() String
    }

    class OrderStatus {
        <<enumeration>>
        PENDING
        CONFIRMED
        PROCESSING
        SHIPPED
        DELIVERED
        CANCELLED
    }

    class PaymentMethod {
        <<enumeration>>
        MPESA
        BANK_TRANSFER
    }

    Order "1" --> "*" OrderItem : contains
    Order "1" --> "*" Payment : has
    Order --> OrderStatus
    Payment --> PaymentMethod
```


---

### Figure 5.14 — Context Diagram: Proposed Smart Supply Sourcing Platform

```mermaid
graph LR
    BUYER([BUYER])
    ADMIN([ADMIN])
    MPESA([SAFARICOM M-PESA])
    CLOUDINARY([CLOUDINARY])
    EMAIL([EMAIL SERVICE])

    BUYER -->|Registration / Login| SYS[Smart Supply Sourcing Platform]
    SYS -->|Session Token / Dashboard| BUYER
    BUYER -->|Product Search / Browse| SYS
    SYS -->|Product Catalog / Details| BUYER
    BUYER -->|Add to Cart / Checkout| SYS
    BUYER -->|M-Pesa / Bank Payment| SYS
    SYS -->|Order Confirmation / Receipt| BUYER
    BUYER -->|Sourcing Request| SYS
    SYS -->|Quotation / Order Status| BUYER

    ADMIN -->|Product / Order Management| SYS
    SYS -->|Analytics / Reports| ADMIN

    SYS -->|STK Push Request| MPESA
    MPESA -->|STK Push Callback| SYS

    SYS -->|Image Upload| CLOUDINARY
    CLOUDINARY -->|Image URL| SYS

    SYS -->|Send Notification| EMAIL
```

---

### Figure 5.15 — DFD Level 0: Proposed Smart Supply Sourcing Platform

```mermaid
flowchart TD
    BUYER([BUYER])
    ADMIN([ADMIN])
    SAFARICOM([SAFARICOM M-PESA])
    D1[(Products DB)]
    D2[(Cart / Orders DB)]
    D3[(Payments DB)]

    BUYER -->|Registration / Login / Browse / Order| P1[1.0 User & Auth Management]
    ADMIN -->|Admin Actions| P1
    P1 -->|Session / Profile| BUYER

    P1 -->|Authenticated User| P2[2.0 Product Catalog Management]
    D1 -->|Product Data| P2
    P2 -->|Catalog / Search Results| BUYER

    P2 -->|Selected Products| P3[3.0 Cart & Order Processing]
    D2 -->|Cart Data| P3
    P3 -->|Order Confirmation| BUYER

    P3 -->|Order + Payment Intent| P4[4.0 Payment Processing]
    SAFARICOM -->|M-Pesa Callback| P4
    P4 -->|STK Push Request| SAFARICOM
    P4 -->|Payment Receipt| BUYER

    P4 -->|Confirmed Payment| P5[5.0 Order Tracking & Fulfillment]
    P5 -->|Order Status| BUYER
    P5 -->|Fulfillment Tasks| ADMIN

    P5 -->|Sourcing Needs| P6[6.0 Sourcing Request Management]
    P6 -->|Quotation| BUYER
    P6 -->|Request Details| ADMIN
```

---

### Figure 5.16 — DFD Level 1: User Management

```mermaid
flowchart TD
    BUYER([BUYER])
    EMAIL_SVC([EMAIL SERVICE])
    D1[(Users Table — PostgreSQL)]

    BUYER -->|Registration Data| P11[1.1 Registration Processing]
    P11 -->|Hashed Password| D1
    P11 -->|Welcome Email| EMAIL_SVC

    P11 -->|User Record Created| P12[1.2 Authentication — NextAuth.js]
    D1 -->|User Record| P12
    P12 -->|JWT Session Token| BUYER

    P12 -->|Authenticated Session| P13[1.3 Profile Management]
    D1 -->|Profile Data| P13
    P13 -->|Updated Profile| BUYER
```

---

### Figure 5.17 — DFD Level 1: Order Management

```mermaid
flowchart TD
    BUYER([BUYER])
    ADMIN([ADMIN])
    EMAIL_SVC([EMAIL SERVICE])
    D2[(Products Table)]
    D3[(Orders Table)]
    D4[(Payments Table)]

    BUYER -->|Cart Contents + Delivery Details| P31[3.1 Order Creation]
    D2 -->|Product Prices| P31
    P31 -->|Order Record| D3

    P31 -->|Order ID| P32[3.2 Order Confirmation]
    D4 -->|Payment Confirmation| P32
    P32 -->|Confirmation Email| EMAIL_SVC
    P32 -->|Order Status: CONFIRMED| D3

    P32 -->|Confirmed Order| P33[3.3 Order Status Management]
    ADMIN -->|Admin Update| P33
    P33 -->|Status Update| D3
    P33 -->|Status Email| BUYER
```

---

### Figure 5.18 — DFD Level 1: Payment Management

```mermaid
flowchart TD
    BUYER([BUYER])
    ADMIN([ADMIN])
    SAFARICOM([SAFARICOM M-PESA])
    D3[(Orders Table)]
    D4[(Payments Table)]

    BUYER -->|Payment Method + Amount| P41[4.1 Payment Method Routing]
    P41 -->|M-Pesa Route| P42[4.2 M-Pesa STK Push Processing]
    P41 -->|Bank Route| P43[4.3 Bank Transfer Processing]

    P42 -->|STK Push Request| SAFARICOM
    SAFARICOM -->|Callback| P44[4.4 Payment Confirmation]
    P43 -->|Reference Number| D4
    D4 -->|Bank Record| P44

    P44 -->|Payment Record| D4
    P44 -->|Order Update| D3

    P44 -->|Confirmed Payment| P45[4.5 Payment Reconciliation]
    ADMIN -->|Admin Action| P45
    P45 -->|Reconciled Status| D4
    P45 -->|Receipt| BUYER
```


---

### Figure 5.19 — Entity-Relationship Diagram: Smart Supply Sourcing Platform

```mermaid
erDiagram
    users {
        UUID id PK
        VARCHAR name
        VARCHAR email
        VARCHAR phone
        VARCHAR password_hash
        VARCHAR role
        VARCHAR company_name
        TIMESTAMP created_at
        TIMESTAMP updated_at
    }

    categories {
        UUID id PK
        VARCHAR name
        VARCHAR slug
        TEXT description
        UUID parent_id FK
        VARCHAR image_url
        TIMESTAMP created_at
    }

    products {
        UUID id PK
        UUID category_id FK
        VARCHAR name
        VARCHAR slug
        TEXT description
        DECIMAL price
        INTEGER stock_quantity
        VARCHAR brand
        VARCHAR sku
        JSONB specifications
        BOOLEAN is_active
        TIMESTAMP created_at
        TIMESTAMP updated_at
    }

    product_images {
        UUID id PK
        UUID product_id FK
        VARCHAR url
        VARCHAR alt_text
        BOOLEAN is_primary
        INTEGER sort_order
    }

    orders {
        UUID id PK
        UUID user_id FK
        VARCHAR status
        DECIMAL total_amount
        TEXT delivery_address
        TEXT notes
        TIMESTAMP created_at
        TIMESTAMP updated_at
    }

    order_items {
        UUID id PK
        UUID order_id FK
        UUID product_id FK
        INTEGER quantity
        DECIMAL unit_price
        DECIMAL subtotal
    }

    payments {
        UUID id PK
        UUID order_id FK
        VARCHAR method
        DECIMAL amount
        VARCHAR status
        VARCHAR reference
        VARCHAR mpesa_code
        VARCHAR checkout_request_id
        TIMESTAMP paid_at
        TIMESTAMP created_at
    }

    sourcing_requests {
        UUID id PK
        UUID user_id FK
        VARCHAR title
        TEXT description
        INTEGER quantity
        DECIMAL budget
        VARCHAR status
        TIMESTAMP created_at
        TIMESTAMP updated_at
    }

    quotes {
        UUID id PK
        UUID request_id FK
        DECIMAL amount
        INTEGER lead_time_days
        TEXT notes
        VARCHAR status
        TIMESTAMP created_at
    }

    users ||--o{ orders : "places"
    users ||--o{ sourcing_requests : "submits"
    categories ||--o{ products : "contains"
    categories ||--o{ categories : "parent of"
    products ||--o{ product_images : "has"
    products ||--o{ order_items : "included in"
    orders ||--o{ order_items : "contains"
    orders ||--o{ payments : "paid via"
    sourcing_requests ||--o{ quotes : "receives"
```

---

### Figure 5.20 — Navigation Flow Diagram (Flutter Mobile App)

```mermaid
flowchart TD
    SPLASH[SplashScreen\n3-second loader] --> SIGNUP[SignupScreen\nCreate Account]

    SIGNUP -->|Create Account| HOME[HomeScreen]
    SIGNUP -->|Log In link| LOGIN[LoginScreen]
    LOGIN -->|Sign In| HOME
    LOGIN -->|Request Access| SIGNUP

    HOME --> CATALOG[CatalogScreen\nProduct Catalog]
    HOME --> REQUESTS_LIST[RequestsListScreen\nSourcing Requests]
    HOME --> ACCOUNT[AccountScreen\nUser Profile & Metrics]

    CATALOG --> PRODUCT[ProductDetailsScreen\nProduct Detail]
    PRODUCT --> CART[ShoppingCartScreen\nCart Review]

    CART --> CHECKOUT[CheckoutScreen\nStep 1 — Shipping Address]
    CHECKOUT --> PAYMENT[CheckoutPaymentScreen\nStep 2 — Payment Method]
    PAYMENT --> REVIEW[CheckoutReviewScreen\nStep 3 — Order Review]
    REVIEW -->|Confirm Order| ORDER_CONFIRM[OrderConfirmationScreen\nOrder Placed Successfully]
    ORDER_CONFIRM -->|Track Order| TRACKING[OrderTrackingScreen\nShipment Progress Timeline]
    ORDER_CONFIRM -->|Continue Shopping| HOME
    TRACKING -->|Home nav| HOME

    REQUESTS_LIST --> STEP1[NewRequestStep1Screen]
    STEP1 --> STEP2[NewRequestStep2Screen]
    STEP2 --> STEP3[NewRequestStep3Screen]
    STEP3 --> STEP4[NewRequestStep4Screen]
    STEP4 --> STEP5[NewRequestStep5Screen]
    STEP5 --> DRAFT[DraftSavedScreen]
    STEP5 --> QUOTE[QuoteReviewScreen]
```

---

### Figure 5.21 — Three-Tier Architecture Diagram (Flutter Mobile App)

```mermaid
graph TB
    subgraph PRESENTATION[Presentation Layer — Flutter Mobile Client]
        UI1[Flutter Screens & Widgets\n20 Screens across 6 Feature Modules]
        UI2[Material Design 3 Theming\nCustom AppColors & AppTextStyles]
        UI3[StatefulWidget State Management\nsetState & Navigator]
    end

    subgraph BUSINESS[Business Logic Layer — Backend REST API]
        BL1[RESTful API Endpoints]
        BL2[JWT Authentication & Authorization]
        BL3[M-Pesa Daraja STK Push Integration]
        BL4[Cloudinary Media Management]
        BL5[Email Notification Service]
    end

    subgraph DATA[Data Layer — Database]
        DB1[PostgreSQL]
        DB2[users Table]
        DB3[products & categories Tables]
        DB4[orders & order_items Tables]
        DB5[payments Table]
        DB6[sourcing_requests & quotes Tables]
    end

    subgraph EXTERNAL[External Services]
        EXT1[Safaricom Daraja API\nM-Pesa STK Push]
        EXT2[Cloudinary CDN\nProduct Images]
        EXT3[Email Provider\nOrder Notifications]
        EXT4[Google Play Store\nApp Distribution]
    end

    PRESENTATION <-->|HTTP / REST / JSON| BUSINESS
    BUSINESS <-->|SQL Queries| DATA
    BUSINESS <-->|API Calls| EXTERNAL
```

---

### Figure 5.22 — Technology Stack Diagram

```mermaid
graph LR
    subgraph MOBILE[Mobile Frontend]
        F1[Flutter SDK 3.x]
        F2[Dart Programming Language]
        F3[Material Design 3]
        F4[StatefulWidget / setState]
    end

    subgraph BACKEND[Backend / API]
        B1[RESTful API]
        B2[JWT Authentication]
        B3[Node.js / Python Runtime]
    end

    subgraph DATABASE[Database]
        D1[PostgreSQL]
        D2[Neon Serverless]
    end

    subgraph INTEGRATIONS[Third-Party Integrations]
        I1[Safaricom Daraja API\nM-Pesa STK Push]
        I2[Cloudinary\nImage Management]
        I3[Email Service\nTransactional Emails]
    end

    subgraph DEPLOYMENT[Deployment]
        DEP1[Google Play Store\nAndroid Distribution]
        DEP2[Apple App Store\niOS Distribution]
    end

    MOBILE --> BACKEND
    BACKEND --> DATABASE
    BACKEND --> INTEGRATIONS
    MOBILE --> DEP1
    MOBILE --> DEP2
```

---

*End of Diagrams — Smart Supply Sourcing Platform Research Documentation*
