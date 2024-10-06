
# dChange

**The Ultimate Business Software Solution for P2P Trading**

dChange is a powerful, feature-packed peer-to-peer (P2P) trading platform, designed specifically for entrepreneurs and businesses. Built with Flutter, it supports Android, iOS, and web platforms, providing a seamless, cross-platform experience. dChange is your comprehensive solution for managing trades, currency exchanges, and negotiations with ease.

## Key Features

- **Trade Marketplace**: Create, manage, and engage in trades, defining currency amounts, exchange rates, and pricing parameters.
- **Offer & Counter Offer System**: Engage in personalized negotiations and submit counter offers to reach fair terms.
- **Currency Buy-Sell-Exchange**: Execute versatile currency operations with ease.
- **Trade Dashboard**: Monitor real-time trading activity and track ongoing trades with insightful analytics.
- **QRCode-Driven Trading**: Simplify trades using QR codes for fast and secure transactions.
- **Get Offer Convenience**: Easily view and interact with active trade offers.
- **Fee Calculator**: Transparent and accurate fee calculations for all transactions.
- **KYC & 2FA Security**: Ensure the safety of trades with Know Your Customer (KYC) protocols and two-factor authentication (2FA).

## How It Works

1. **Create a Trade**: Entrepreneurs create a trade, specifying currency, amount, exchange rate, and other parameters.
2. **Admin Approval**: Trades go through an approval process to ensure a secure environment.
3. **Live Trade**: Approved trades are visible to potential buyers.
4. **Negotiation**: Buyers can accept terms or submit a counter offer, while sellers can engage in back-and-forth negotiations.
5. **Finalize Trade**: Upon agreement, both parties finalize the trade, and funds are securely exchanged.

## Tech Stack

- **Frontend**: Built using **Flutter** for cross-platform mobile and web development.
- **Backend**: Node.js with Express.js for APIs, and PostgreSQL for database management.
- **Security**: Integrated KYC and 2FA for secure user authentication.
- **Currency Exchange**: Third-party APIs for real-time currency rates and secure payment handling.

## Installation

To get started with dChange, follow the steps below:

### Prerequisites

- **Flutter** SDK installed ([Flutter installation guide](https://flutter.dev/docs/get-started/install))
- **Node.js** and **npm** for the backend setup
- **PostgreSQL** for database management

### Clone the Repository

```bash
git clone https://github.com/REChain-Network-Solutions/dChange.git
cd dChange
```

### Backend Setup

1. Navigate to the backend folder:
   ```bash
   cd backend
   ```
2. Install the required dependencies:
   ```bash
   npm install
   ```
3. Set up environment variables by creating a `.env` file:
   ```
   DATABASE_URL=your_postgres_db_url
   JWT_SECRET=your_jwt_secret
   ```

4. Run database migrations:
   ```bash
   npm run migrate
   ```

5. Start the backend server:
   ```bash
   npm start
   ```

### Frontend Setup (Flutter)

1. Navigate to the main project folder:
   ```bash
   cd dChange
   ```
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Run the app on your desired platform:
   ```bash
   flutter run
   ```

To run the web version, ensure that you have the web environment set up and execute:

```bash
flutter run -d chrome
```

### Admin Panel

The admin panel is also built using Flutter and can be accessed through the same repository. This panel allows administrators to approve trades, manage users, and oversee the overall system.

## Contributing

We welcome contributions to improve dChange! To contribute:

1. Fork the repository.
2. Create a new branch:
   ```bash
   git checkout -b feature-branch
   ```
3. Make your changes and commit them:
   ```bash
   git commit -m 'Add new feature'
   ```
4. Push to the branch:
   ```bash
   git push origin feature-branch
   ```
5. Open a pull request on GitHub.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
