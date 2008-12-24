LaunchDoctor
============
I've got a PhD in [launchd][], and I'm not afraid to use it!

  [launchd]: <http://en.wikipedia.org/wiki/Launchd> "launchd on Wikipedia"

Usage
-----
LaunchDoctor is really simple. It is essentially an easy interface to
[launchd][]'s [property list][plist] files.

There are three ways to use LaunchDoctor - the simplest being directly
creating property lists and treating them as hashes:
    
    require 'launchdr'
    plist = LaunchDr::Launchd.new "name.elliottcable.launchdr.test"
    plist[:program_arguments] = ['/Applications/Calculator.app/Contents/MacOS/Calculator']
    plist.dump LaunchDr::Launchd::Paths[:user_agent]
    
The second is to use the common block idiom, provided by the `LaunchDr()`
method:
    
    require 'launchdr'
    LaunchDr "name.elliottcable.launchdr.test" do |plist|
      plist[:program_arguments] = ['/Applications/Calculator.app/Contents/MacOS/Calculator']
    end
    
LaunchDoctor will automatically add the property list to `launchctl`, and then
start it running. Once you run the above snippet, the target will immediately
be launched for the first time.

LaunchDoctor can write (`dump`) the property lists to any place on your disk,
but the idiom method assumes you're going to want to use one of the
directories that launchd checks for property lists. These are stored in the
`Launchd::Paths` array. The default is to place it in the user-owned agents
directory at `~/Library/LaunchAgents`.

LaunchDoctor also preforms some 'prettification' on the keys provided by
launchd's property list structure. All of the keys on the
[`launchd.plist` manpage][manpage] are available, but they can also be used as
true 'Ruby-ish' symbol keys. All of the following are legal:
    
    plist["UserName"] = "elliottcable"
    plist[:UserName] = "elliottcable"
    plist[:user_name] = "elliottcable"
    
Finally, you can use the Rake task interface to the last method. It simply
wraps the last method inside a rake task. This method is really great if you
want to provide a way to let users make your gem's binary run all the time:
    
    require 'launchdr/task'
    LaunchDr.task :launchd, :bin => 'jello', :arguments => ['-D', 'shortener', 'grabup']
    
This isn't very flexible, but it's not very complicated either. If you need
more control over the plist, just use the second method inside a `task` block.
This method defaults to making your gem's binary `run_at_load` and be
`keep_alive` as well, so it won't die.

  [plist]: <http://en.wikipedia.org/wiki/Property_list> "Property list on Wikipedia"
  [manpage]: <http://developer.apple.com/DOCUMENTATION/DARWIN/Reference/ManPages/man5/launchd.plist.5.html> "Mac OS X Manual Page for launchd.plist(5)"
  [rake]: <http://rake.rubyforge.org/> "Rake's RDocs"

Requirements
------------
- OSX/plist by kballard - `sudo gem install kballard-osx-plist --source=http://gems.github.com/`
- Ruby Facets - `sudo gem install facets`
