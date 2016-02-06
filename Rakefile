require 'rake/testtask'

Rake::TestTask.new("test:all") do |t|
      t.libs = ["lib", "spec"]
      t.warning = true
      t.test_files = FileList['spec/**/*.rb']
end
