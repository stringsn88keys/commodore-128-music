require "rake/testtask"
$:. << "lib"

task default: "test"

desc "Run tests"
task :test do
  Rake::TestTask.new do |task|
    task.pattern = "test/*_test.rb"
  end
end

desc "Count lines of code"
task :loc do
  puts Dir['**/*.rb']
    .map { |f| [f.split(File::SEPARATOR)[0], File.read(f).each_line.count] }
    .inject({"file/dir"=> "", "--------------------"=> "-----"}) { |a,i| (a[i[0]] ||= 0; a[i[0]] += i[1]); a }
    .tap { |a| a["===================="] = "=====" }
    .tap { |a| a["total"] =  a.values.map(&:to_i).inject(&:+) }
    .map { |d,c| "%20s | %5s" % [d,c.to_s] }
end
