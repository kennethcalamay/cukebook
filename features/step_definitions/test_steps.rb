Given /I have deposited \$(\d+) in my (\w+) Account/ do |amount, account_type|
  @depositor ||= Depositor.new
  @depositor.deposit(account_type, amount)
end

When /I transfer \$(\d+) from my (\w+) Account into my (\w+) Account/ do |amount, from_account, to_account|
  @depositor.transfer(amount, from_account, to_account)
end

Then /the balance of the (\w+) Account should be \$(\d+)/ do |account_type, balance|
  @depositor.find_account(account_type).balance.should eq(balance.to_i)
end
