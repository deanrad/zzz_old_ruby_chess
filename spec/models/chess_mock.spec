
describe "Chess Mock Spec" do
  it "should remember from_coord" do
    match = Match.new ; move  = Move.new( :match => match, :from_coord => "d2", :to_coord => "d4" )
    move.from_coord.should == :d2
  end
  
  it "can append move to match" do
    match = Match.new ; move  = Move.new( :match => match, :from_coord => "d2", :to_coord => "d4" )
    match.moves << move
    match.moves.last.should == move
    match.moves.last.valid?.should == true
  end
  
  it "board will reflect new move" do
    match = Match.new ; move  = Move.new( :match => match, :from_coord => "d2", :to_coord => "d4" )
    match.instance_variable_get( "@board" ).should == nil 
    match.moves << move
    match.board[:d2].should == nil
    match.board[:d4].role.should == :pawn
  end

end


# Proof that we can use DSL style of test writing when we mock rspec layer with out own,
# actually very easy DSL implementation
#describe "Any Mock Specification" do
#  it "should do an it test" do  
#    logger.it_test "im doing it arent i ?"
#  end
#end