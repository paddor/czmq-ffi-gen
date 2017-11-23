base_dir = File.expand_path(File.join(__dir__, "..", ".."))
vendor_bin_dir = File.join(base_dir, "vendor", "local", "bin")
if File.exist?(vendor_bin_dir)
  # On Windows, RubyInstaller2 uses kernel32's SetDefaultDllDirectories
  # and AddDllDirectory, which disables the lookup of DLLs in the PATH, see
  # https://github.com/oneclick/rubyinstaller2/wiki/For-gem-developers#dll-loading
  begin
    require 'ruby_installer'
    RubyInstaller::Runtime.add_dll_directory vendor_bin_dir
  rescue LoadError
    ENV["PATH"] = [vendor_bin_dir, ENV["PATH"]].join(File::PATH_SEPARATOR)
  end
end
