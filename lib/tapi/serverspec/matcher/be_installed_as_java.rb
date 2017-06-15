RSpec::Matchers.define :be_installed_as_java do
  match { |java| java.installed?(version: @version, flavor: @flavor) }
  chain(:with_version) { |version| @version = version }
  chain(:with_flavor) { |flavor| @flavor = flavor }
end
