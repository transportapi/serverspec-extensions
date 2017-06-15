require 'serverspec'

module ServerspecExtensions
  module Type
    class Java < Serverspec::Type::Base
      def installed?(version: nil, flavor: nil)
        return false unless cmd_line_tool_installed?
        return false if version && !version_installed?(version)
        return false if flavor && !flavor_installed?(flavor)

        true
      end

      private

      def cmd_line_tool_installed?
        cmd_java = 'java -version'
        Serverspec::Type::Command.new(cmd_java).exit_status == 0
      end

      def version_installed?(version)
        cmd_version = "java -version 2>&1 | grep #{version}"
        Serverspec::Type::Command.new(cmd_version).exit_status == 0
      end

      def flavor_installed?(flavor)
        unless flavor == :oracle
          raise ArgumentError, 'the only supported flavor is :oracle'
        end

        cmd_flavor =
          'java -version 2>&1 | grep "Java(TM) SE Runtime Environment"'

        Serverspec::Type::Command.new(cmd_flavor).exit_status == 0
      end

      def to_s?
        'Java'
      end
    end

    def java
      Java.new
    end
  end
end
