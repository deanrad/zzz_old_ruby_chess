module DbFreeIncludes

  IRB_REQUIRES = %w{
   rubygems 
   irb/completion
   logger
   util
   active_record_mock
   load_models
   spec/spec_helper
   chess_active_record_mock
  }

  IRB_LOAD_PATHS = %w{
    lib
    app/models
    app/models/pieces
  }

end
