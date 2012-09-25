class Account
  attr_reader :balance
  attr_reader :type

  def initialize(type)
    @balance = 0
    @type = type
  end

  def credit(amount)
    @balance -= amount.to_i
  end

  def debit(amount)
    @balance += amount.to_i
  end
end
