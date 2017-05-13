class ObjectUnderTest
  def initialize(other_object)
    @other_object = other_object
  end

  def delegated_method
    @other_object.dangerous_operation
  end
end

# MANUAL IMPLEMENTATION OF A DOUBLE #
### DOUBLE OBJECT ###
class FakeOtherObject
  def dangerous_operation
    "expected_value"
  end
end
#####################



describe ClassThatMakesObjectsUnderTest do
  let(:other_object) { double(:other_object, dangerous_operation: "expected_value") }
  subject(:object_under_test) { described_class.new(other_object) }

  describe '#delegated_method' do
    it 'return some values' do
      expect(object_under_test.delegated_method).to eq :expected_value
    end
  end
end
