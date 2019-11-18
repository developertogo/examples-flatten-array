require 'spec_helper'

require_relative '../flatten_it'

test_inputs =
  [
    [],
    [nil],
    [-1],
    [1],
    [1, []],
    [[1], []],
    [1, [2]],
    [1, [], 2],
    [[1], [], [2]],
    [{ 1 => 2 }],
    [1, 2, 3],
    [[1, 2], 3],
    [[1, 2, [3]], 4],
    [1, 2, [3, 4]],
    [[1, 2, [3, [4], nil], []]],
    [1, 2, [3, [4, 5], 6]],
    [1, 2, [3, [4], 5], 6],
    [1, 2, 3, [4, [5, [6]]]],
    [[1], [[2], [[3], [[4], [[5], [[6], [[7]]]]]]]],
    [2, 3, [1, 6, [6, [7, 4, 0]], 9, 1], [4, 6, 3], 1],
    [[[[[[[[[[[[[[[[1]]]]]]]]]]]]]]]],
    [[[[[[[[[[[[[[[[]]]]]]]]]]]]]]]]
  ]

describe Array do
  describe 'when recursion level is nil' do
    context 'when comparing with Array#flatten' do
      test_inputs.each do |test_input|
        it 'results are the same' do
          expect(test_input.flatten).to match_array(test_input.flatten_it)
        end
      end
    end

    it 'does not flatten itself' do
      ary = [1, [2, 3]]
      ary.flatten_it
      expect(ary).to match_array([1, [2, 3]])
    end

    it 'does flatten itself' do
      ary = [1, [2, 3]]
      ary.flatten_it!
      expect(ary).to match_array([1, 2, 3])
    end

    context 'when flattening itself, there is nothing to flatten' do
      it 'returns nil' do
        ary = [1, 2, 3]
        res = ary.flatten_it!
        expect(ary).to match_array([1, 2, 3])
        expect(res).to be_falsey
      end
    end
  end

  describe 'when recursion level is not nil' do
    context 'when comparing with Array#flatten' do
      test_inputs.each do |test_input|
        (1..5).each do |level|
          it 'results are the same' do
            expect(test_input.flatten(level)).to match_array(test_input.flatten_it(level))
          end
        end
      end
    end

    it 'does not flatten itself' do
      ary = [1, [[2], 3]]
      ary.flatten_it(1)
      expect(ary).to match_array([1, [[2], 3]])
    end

    it 'does flatten itself' do
      ary = [1, [[2], 3]]
      ary.flatten_it!(1)
      expect(ary).to match_array([1, [2], 3])
    end

    context 'when flattening itself, there is nothing to flatten' do
      it 'returns nil' do
        ary = [1, 2, 3]
        res = ary.flatten_it!(1)
        expect(ary).to match_array([1, 2, 3])
        expect(res).to be_falsey
      end
    end
  end
end
