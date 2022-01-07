# frozen_string_literal: true

require_relative '../lib/custom_enumerables'
require_relative './spec_helper'

describe 'Custom enumerables' do
  describe '#my_each parity with #each' do
    it 'produces the same output as #each' do
      numbers = [1, 2, 3, 4, 5]
      my_each_result = []
      each_result = []

      numbers.my_each { |item| my_each_result.append(item) }
      numbers.each { |item| each_result.append(item) }

      expect(my_each_result).to eq(each_result)
    end
  end

  describe '#my_each_with_index parity with #each_with_index' do
    it 'produces the same output as #each_with_index' do
      numbers = [1, 2, 3, 4, 5]
      my_each_with_index_result = []
      each_with_index_result = []

      numbers.my_each_with_index { |item, index| my_each_with_index_result.append([item, index]) }
      numbers.each_with_index { |item, index| each_with_index_result.append([item, index]) }
      expect(my_each_with_index_result).to eq(each_with_index_result)
    end
  end

  describe '#my_select parity with #select' do
    it 'produces same output as #select' do
      numbers = (0..9).to_a
      my_select_result = numbers.my_select(&:even?)
      select_result = numbers.select(&:even?)
      expect(my_select_result).to eq(select_result)
    end
  end

  describe '#my_all? parity with #all?' do
    it 'produces the same output as #all? when the statment should be true' do
      numbers = [2, 4, 6, 8]
      my_any_result = numbers.my_all?(&:even?)
      any_result = numbers.all?(&:even?)
      expect(my_any_result).to eq(any_result)
    end

    it 'produces the same output as #all? when the statment should be false' do
      numbers = [2, 5, 6, 8]
      my_any_result = numbers.my_all?(&:even?)
      any_result = numbers.all?(&:even?)
      expect(my_any_result).to eq(any_result)
    end
  end

  describe '#my_any? parity with #any?' do
    it 'produces the same output as #any? when the statment should be false' do
      numbers = [1, 3, 5, 7]
      my_any_result = numbers.my_any?(&:even?)
      any_result = numbers.any?(&:even?)
      expect(my_any_result).to eq(any_result)
    end

    it 'produces the same output as #any? when the statment should be true' do
      numbers = [1, 3, 4, 7]
      my_any_result = numbers.my_any?(&:even?)
      any_result = numbers.any?(&:even?)
      expect(my_any_result).to eq(any_result)
    end
  end

  describe '#my_none? parity with #none?' do
    it 'produces the same output as #none? when the statment should be true' do
      numbers = [1, 3, 5, 7]
      my_none_result = numbers.my_none?(&:even?)
      none_result = numbers.none?(&:even?)
      expect(my_none_result).to eq(none_result)
    end

    it 'produces the same output as #none? when the statment should be false' do
      numbers = [1, 3, 4, 7]
      my_none_result = numbers.my_none?(&:even?)
      none_result = numbers.none?(&:even?)
      expect(my_none_result).to eq(none_result)
    end
  end

  describe '#my_count parity with #count' do
    it 'produces the same output as #count' do
      numbers = (0..19).to_a
      my_count_result = numbers.my_count(&:even?)
      count_result = numbers.count(&:even?)
      expect(my_count_result).to eq(count_result)
    end
  end

  describe '#my_map parity with #map' do
    it 'produces the same output as #map' do
      numbers = (0..19).to_a
      expect(numbers.my_map { |number| number * 2 }).to \
        eq(numbers.map { |number| number * 2 })
    end
  end

  describe '#my_inject parity with #inject' do
    it 'produces the same output as #inject' do
      numbers = (0..19).to_a
      expect(numbers.my_inject { |product, number| product * number }).to \
        eq(numbers.inject { |number, product| product * number })
    end
  end
end
