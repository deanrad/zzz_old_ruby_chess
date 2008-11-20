#require File.dirname(__FILE__) + '/../spec_helper'

describe 'King' do
  before(:all) do
    @castling_board = Board[:a1 => Rook.new(:white, :queens), :e1 => King.new(:white), :h1 => Rook.new(:white, :kings)]
  end
  
  it 'should be able to move two squares toward rook and have rook hop over (castling kingside)' do
    match = Match.new( :board => @castling_board.dup )
    move  = Move.new(  :from_coord => :e1, :to_coord => :g1)
    
    match.moves << move

    match.board[:g1].role.should == :king
    match.board[:f1].role.should == :rook
    match.board[:f1].which.should == :kings
    puts match.board
  end

  it 'should be able to hop two squares toward rook and have rook hop over (castling queenside)' do
    match= Match.new( :board => @castling_board.dup )
    move = Move.new( :from_coord => :e1, :to_coord => :c1)
    match.moves << move
    match.board[:c1].role.should == :king
    match.board[:d1].role.should == :rook
    match.board[:d1].which.should == :queens
    puts match.board
  end

  it 'should not be allowed to castle across an attacked square' do
    match= Match.new( :board => @castling_board.dup )
    match.board.store(:g3, Knight.new(:black, :kings)) #knight threatening :f1
    move = Move.new(:from_coord => :e1, :to_coord => :g1)
    lambda{
      match.moves << move
    }.should_not change{ match.moves.count }
    puts match.board
  end

  # NOTE: the lack of *negative* tests as recently added below caused a bunch of lost time
  # when a situation incorrectly mistaken for a castle caused a knight to disappear randomly
  it 'should not be allowed to castle across occupied squares'
  
  #these are the stronger versions which forbid castling if a piece has moved and returned
  #in practice allowing this would come up one match in 1000 and confer little advantage
  it 'should not be allowed to castle if it has been moved'
  it 'should not be allowed to castle if the rook has been moved'

end
