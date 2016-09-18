base_dir = File.expand_path(File.join(__dir__, "..", ".."))
vendor_bin_dir = File.join(base_dir, "vendor", "local", "bin")
if File.exist?(vendor_bin_dir)
  ENV["PATH"] = [vendor_bin_dir, ENV["PATH"]].join(File::PATH_SEPARATOR)
end
