#One way we could provide a hook into fixtures - define this module and 
# mix into Spec::Example::ExampleGroup
module ChessFixtures
  
  @@fixtures = {}
  
  def matches( which )
    #todo - get a fresh object from the object repository 
    @@fixtures[:scholars_mate] = begin
      m = Match.new
      m.moves << Move.new( :from_coord => :e2 , :to_coord => :e4 )
      m.moves << Move.new( :from_coord => :e7 , :to_coord => :e5 )
      m.moves << Move.new( :from_coord => :d1 , :to_coord => :h5 )
      m.moves << Move.new( :from_coord => :b8 , :to_coord => :c6 )
      m.moves << Move.new( :from_coord => :f1 , :to_coord => :c4 )
      m.moves << Move.new( :from_coord => :g8 , :to_coord => :f6 )
      m
    end
    @@fixtures[:unstarted_match] = begin
      m = Match.new
    end
    @@fixtures[:ready_to_castle] = begin
      m = Match.new( :board => Board[:a1 => Rook.new(:white, :queens), :e1 => King.new(:white), :h1 => Rook.new(:white, :kings)])
    end

    unless @@fixtures.keys.include? which
      raise Exception, "Dont have fixture #{which} in repository" 
    end
    @@fixtures[which]
  end

  #if match_spec is dependent on players fixtures (it is), we have an organizational issue
  def players( which )
    p = Player.new( :login => which.to_s )
    p
  end
end
