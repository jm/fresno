require 'fileutils'

module Fresno
  class AppGenerator < Thor
    include Thor::Actions

    def self.source_root
      @source_root ||= File.join(File.dirname(__FILE__), 'generator_data')
    end

    def initialize(args=[], options={}, config={})
      @args = args
      @options = options
      @config = config
    end

    no_tasks do
      def generate(name)
        @name = name
        puts "Generating new project in `#{name}`..."
        puts

        # Where are these files going?
        self.destination_root = File.join(Dir.pwd, name)

        # Build files for Ant
        template('build.xml.template', "build.xml")
        template('build.properties.template', "build.properties")

        # Which project template are we starting with?
        robot_filename = "src/#{@name.capitalize}Robot.mirah"
        if @options["command"]
          template('command.mirah.template', robot_filename)          
        elsif @options["simple"]
          template('simple.mirah.template', robot_filename)
        else
          template('iterative.mirah.template', robot_filename)
        end

        # IDE MADNESS
        if @options["netbeans"]
          template('netbeans.template', "netbeans/project.xml")
        end
        
        # Licenses!
        copy_file "MITLICENSE", "LICENSE"
        copy_file "BSD_FOR_WPILIB", "WPILIB_LICENSE"

        # Git goodness
        copy_file "gitignore.template", ".gitignore"

        template('README.md.template', "README.md")

        puts
        puts "All done!"
      end
    end
  end
end