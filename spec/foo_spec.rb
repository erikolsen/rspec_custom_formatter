require_relative '../lib/foo'

50.times do |num|
  describe Foo do
    it 'returns false' do
      sleep 0.1
      value = num % 10 != 0
      expect(Foo.is_true?).to be value
    end
  end
end
