module Specs
class ActiveRecordMockSpec
  class BelongsToTest < ActiveRecord::Base
    belongs_to :parent
  end
  class ParentTest < ActiveRecord::Base
    has_many :children
  end
  class ChildTest < ActiveRecord::Base
    belongs_to :parent
  end
  class PreValidateTest < ActiveRecord::Base
    before_validation :foo
    
    def foo; true; logger.info "foo called by validation" ; end
  end
  
  def belongs_to_should_add_accessors
    b = BelongsToTest.new
    b.methods.include?("parent").should == true
    b.methods.include?("parent=").should == true
    b.methods.include?("not").should == false
  end
  
  def has_many_should_add_read_accessor
    p = ParentTest.new
    p.methods.include?("children").should == true
    p.methods.include?("children=").should == false
  end
  
  def can_add_to_has_many_assoc
    p = ParentTest.new
    p.children.count.should == 0
    p.children << c = ChildTest.new
    p.children.count.should == 1
    p.children.first.should == c
  end

  def child_in_has_many_has_ref_to_parent
    p = ParentTest.new
    p.children << c = ChildTest.new
    c.parenttest.should == p
  end
  
  def do_validate_calls_before_validators
    p = PreValidateTest.new
    p.do_validate
    p.errors.count.should == 0
  end
end
end #module Specs