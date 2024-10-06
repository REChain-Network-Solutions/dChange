# Smart Contracts in dChange

The dChange platform uses smart contracts to automate and manage decentralized asset exchanges. Below is a summary of the key contracts and their functions.

## Main Contracts

### 1. **Exchange Contract**
- **Purpose**: Handles asset exchange between users.
- **Key Functions**:
  - `initiateExchange(assetId, amount, recipient)` - Initiates a trade with a recipient.
  - `confirmExchange(exchangeId)` - Confirms the exchange between two users.
  - `cancelExchange(exchangeId)` - Cancels a pending exchange.

### 2. **Wallet Contract**
- **Purpose**: Manages user wallets and balances.
- **Key Functions**:
  - `deposit(assetId, amount)` - Deposits a specific amount of assets into the wallet.
  - `withdraw(assetId, amount)` - Withdraws assets from the wallet.
  - `getBalance(assetId)` - Retrieves the user's balance for a specific asset.

## Events Emitted

- `ExchangeInitiated(exchangeId, sender, recipient, assetId, amount)`
- `ExchangeCompleted(exchangeId)`
- `BalanceUpdated(user, assetId, newBalance)`

---

For more details, check the [contract source code](../contracts/).
