# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

#require(File.join(File.dirname(__FILE__), 'config', 'boot'))
RAILS_ROOT = File.dirname(__FILE__)

require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

#require 'tasks/rails'
require 'source_annotation_extractor'
#monkey patch to pick up my spec dir
class SourceAnnotationExtractor
  def find(dirs=%w(app lib test spec))
    dirs.inject({}) { |h, dir| h.update(find_in(dir)) }
  end
end

desc "Enumerate all annotations"
task :notes do
  SourceAnnotationExtractor.enumerate "OPTIMIZE|FIXME|TODO|LEFTOFF", :tag => true
end

desc "Finds a LEFTOFF annotation to show you where you left off"
task :leftoff do
  SourceAnnotationExtractor.enumerate "LEFTOFF" #, :tag => true
end
