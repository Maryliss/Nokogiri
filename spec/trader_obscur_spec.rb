require_relative '../lib/trader_obscur'

describe "The trading method" do
    it "should get the symbol and price of each cryptocurrencies, return an array with nested hashes for each cryptocurrencies and not to be nil" do
        expect(trading.class).not_to be_nil
    end
    it "the type returned is an array" do
        expect(trading.class).to eq(Array)
  end 
end

