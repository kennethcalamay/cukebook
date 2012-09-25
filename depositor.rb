class Depositor
  attr_reader :accounts

  def initialize
    @accounts = []
  end

  def deposit(account_type, amount)
    find_account(account_type).debit(amount)
  end

  def transfer(amount, source, destination)
    source = find_account(source)
    destination = find_account(destination)

    destination.debit(source.credit)
  end

  def find_account(account_type)
    account = accounts.select{|account| account.type == account_type}.first
    account ||= create_account(account_type)
    account
  end

  def create_account(account_type)
    account = Account.new(account_type)
    accounts << account
    account
  end
end
