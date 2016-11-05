require "bundler/gem_tasks"
require "rspec/core/rake_task"
require "rubygems/package"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec


windows_architectures = [
  :x86,
  :x64,
]

namespace :build do
  namespace :windows do
    windows_architectures.each do |architecture|
      desc "Build gem for Windows #{architecture}"
      task architecture => "pkg" do
        sh("docker", "build",
           "--tag", "czmq-ffi-gen-builder",
           "--rm",
           ".")
        sh("docker", "run",
           "--rm",
           "--interactive",
           "--tty",
           "--volume", "#{Dir.pwd}:/czmq-ffi-gen",
           "czmq-ffi-gen-builder",
           "/bin/bash",
           "-c",
           "/czmq-ffi-gen/windows/build.sh #{architecture}")

        spec = Bundler::GemHelper.gemspec.dup
        spec.platform = "#{architecture}-mingw32"
        spec.files += Dir.glob("vendor/local/**/*")
        package = Gem::Package.new(File.join("pkg", spec.file_name))
        package.spec = spec
        package.build
      end
    end
  end

  windows_architectures.each do |architecture|
    task :windows => "build:windows:#{architecture}"
  end
end

namespace :release do
  namespace :windows do
    namespace :rubygem_push do
      windows_architectures.each do |architecture|
        task architecture => "build:windows:#{architecture}" do
          helper = Bundler::GemHelper.instance
          if helper.__send__(:gem_push?)
            spec = helper.gemspec.dup
            spec.platform = "#{architecture}-mingw32"
            helper.__send__(:rubygem_push, "pkg/#{spec.file_name}")
          end
        end
      end
    end
  end
end

windows_architectures.each do |architecture|
  task :release => "release:windows:rubygem_push:#{architecture}"
end

namespace :release do
  dependencies = [
    "build",
    "release:source_control_push",
    "release:rubygem_push",
  ]
  windows_architectures.each do |architecture|
    dependencies << "release:windows:rubygem_push:#{architecture}"
  end

  desc "Release already built gems"
  task :no_windows_build => dependencies
end
