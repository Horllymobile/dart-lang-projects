class Account {
  String account_name;
  String account_number;
  double account_balance;

  Account(this.account_name, this.account_number, this.account_balance) {}

  get balance {
    return account_number;
  }

  void debosit(double amount) {
    if (amount >= 1) {
      this.account_balance += amount;
    } else {
      throw AccountException('Invalid amount');
    }
  }

  void withdraw(double amount) {
    if (amount <= this.account_balance) {
      this.account_balance -= amount;
    } else {
      throw AccountException('Insuficient fund');
    }
  }
}

class AccountException implements Exception {
  String message;

  AccountException(this.message);

  @override
  String toString() {
    return this.message;
  }
}

void main() {
  var account1 = Account("Abraham James", "569", 0.0);
  print(
      "${account1.account_name}-${account1.account_number} you account balance is ${account1.account_balance}");
  try {
    account1.debosit(6000);
  } on AccountException catch (e) {
    print(e.message);
  }
  print(
      "${account1.account_name}-${account1.account_number} you account balance is ${account1.account_balance}");
  try {
    account1.withdraw(600);
  } on AccountException catch (e) {
    print(e.message);
  }
  print(
      "${account1.account_name}-${account1.account_number} you account balance is ${account1.account_balance}");
  try {
    account1.debosit(-1);
  } on AccountException catch (e) {
    print(e.message);
  }
  print(
      "${account1.account_name}-${account1.account_number} you account balance is ${account1.account_balance}");
  try {
    account1.withdraw(7000);
  } on AccountException catch (e) {
    print(e.message);
  }
  print(
      "${account1.account_name}-${account1.account_number} you account balance is ${account1.account_balance}");
}
