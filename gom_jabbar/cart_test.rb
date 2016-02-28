require "minitest/autorun"
require_relative 'cart'

describe Cart do
  before do
    pricing_rules = '?'
    @cart = Cart.new(pricing_rules)
  end

  describe "when adding 2x1" do
    before do
      @price = 3.14
      @items = %w(KR KR)
    end

    it "should return half price" do
      @items.each { |item| @cart.add(item) }
      @cart.total.must_equal @price
    end
  end

  describe "when adding normal products" do
    before do
      @items = %w(UN UN UN)
      @price = 2997
    end

    it 'should return the sum of their prices' do
      @items.each { |item| @cart.add(item) }
      @cart.total.must_equal @price
    end
  end

  describe "when adding 3 2X1 items" do
    before do
      @items = %w(KR ME KR KR UN)
      @price = 1047.28
    end

    it 'should charge 2 of them' do
      @items.each { |item| @cart.add(item) }
      @cart.total.must_equal @price
    end
  end

  describe "when adding 3+ discount items" do
    before do
      @items = %w(ME ME KR ME)
      @price = 103.13
    end

    it 'should charge discounted for every of them' do
      @items.each { |item| @cart.add(item) }
      @cart.total.must_equal @price
    end
  end
end
