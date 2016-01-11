require 'termnote'

include TermNote

show.add chapter title: "What the SSH?!", subtitle: "Dirty Shell Tricks"

show.add text title: "Incoming", content: <<-LIST
  * authentication 
  * tunnels
  * bypassing outbound firewalls 
  * bypassing inbound firewalls 
  * executing remote commands 
  * configs 
  * authorized_keys
LIST 

show.add code language: "Ruby", source: <<-SOURCE
  puts "Hello, world!"
SOURCE

show.start
