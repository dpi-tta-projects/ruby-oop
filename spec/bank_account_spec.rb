require "spec_helper"

RSpec.describe "bank_account.rb" do
  describe "output" do
    it "prints updated balances after deposit and withdrawal", points: 3 do
      output = run_script_and_capture_lines("bank_account.rb")
      expect(output).to include("Your balance is $100", "Your balance is $150", "Your balance is $120")
    end
  end

  describe "code" do
    let(:source) { strip_comments(File.read("bank_account.rb")) }

    it "defines a BankAccount class", points: 1 do
      expect(source).to match(/class\s+BankAccount/)
    end

    it "uses instance variable @balance", points: 2 do
      expect(source).to match(/@balance/)
    end

    it "uses public methods for deposit, withdraw, and balance", points: 2 do
      expect(source.scan(/def\s+(deposit|withdraw|balance)/).flatten).to match_array(["deposit", "withdraw", "balance"])
    end

    it "does not expose @balance directly", points: 2 do
      expect(source).not_to match(/attr_accessor\s+:balance/)
    end
  end
end
