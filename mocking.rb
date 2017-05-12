
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
      
    end
  end
end
