Fresno
======

Fresno is a framework and generator for writing FRC controller code in [Mirah](http://mirah.org), a JVM language that compiles down to Java but offers a friendlier syntax.

Installation
------------

To get started, follow the instructions for setting up a Java environment in the [FRC Getting Started guide](http://www.usfirst.org/sites/default/files/uploadedFiles/Robotics_Programs/FRC/Game_and_Season__Info/2012_Assets/Getting%20Started%20with%20the%202012%20FRC%20Control%20System_2.pdf), including the updates for the Sun SPOT environment.

Once you have Java setup along with the FRC dependencies, hop over to the [JRuby website](http://jruby.org) and install the JRuby package.  Mirah uses JRuby as its language for parsing and compiling to Java, and Fresno uses it to run the generator code.

To install Fresno, simply run `gem install fresno` (or `jgem install fresno`) with a JRuby powered installation of [RubyGems](http://rubygems.org), which should be installed by default with your JRuby package.

Generator usage
---------------

By default, Fresno's generator will create a directory structure and setup an [Ant](http://ant.apache.org) `build.xml` to build a project using WPILib's `IterativeRobot` class as its base.  To create a project, simply execute:

    fresno create MyRobot

...where MyRobot is the name of your robot/project.  Fresno will then create a directory with the name of the robot/project and place inside of it a few files:

* A `LICENSE` file with a license for the code contained within.  By default, this is the [MIT Open Source License](http://opensource.org/licenses/MIT), but feel free to change or delete that file, especially if you never plan to open source your code.
* A `LICENSE_FOR_WPI_LIB` file which contains the BSD license for all the WPILib code as required by its license.
* A `build.xml` and `build.properties` file for building with Ant.  These are heavily based on the files from WPILib's Netbeans templates with a few alterations and clarifications.
* A `.gitignore` file to ignore build files when committing to a Git repository.
* A `README.md` file in Markdown format; you should definitely keep a current `README` for your project!
* A robot source file in `src`.

To build your robot's code, execute `ant compile`.  To deploy a new release, execute `ant deploy`.  If you're using Netbeans, you can add a Netbeans project file to your Fresno project with the `--netbeans` option:

    fresno create MyRobot --netbeans

If you'd like to use `SimpleRobot` as your base rather than `IterativeRobot`, you can specify the `--simple` option to the generator:

    fresno create MyRobot --simple

A command based template is coming soon!

Framework usage
---------------

Currently, the Fresno framework isn't hooked into anything, and in reality, it's only a single class right now.  

Now that the generator is functional, features can begin to be added to the framework.  In the future, the framework will be built at the time of the gem build (or install?) and then subsequently added to the classpath at build time.

TODO
----

* Implement the command template
* Build out a bit of the convenience framework
* Tweak the ant build so that we can build bytecode using Mirah and deploy that; otherwise, we lose a couple of the cool features of Mirah
* Documentation!  Documentation!  Documentation!
* 