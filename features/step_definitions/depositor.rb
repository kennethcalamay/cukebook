class Depositor
  attr_reader :accounts

  def initialize
    @accounts = []
  end

  def deposit(account_type, amount)
    find_account(account_type).debit(amount)
  end

  def transfer(amount, source, destination)
    find_account(source).credit(amount)
    find_account(destination).debit(amount)
  end

  def find_account(account_type)
    account = accounts.select{|account| account.type == account_type}.first
    account ||= create_account(account_type)
  end

  def create_account(account_type)
    account = Account.new(account_type)
    accounts << account
    account
  end
end
