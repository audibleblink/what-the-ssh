require 'termnote'
include TermNote

# slideshow start
show.add chapter title: "What the SSH?!", subtitle: "Dirty Shell Tricks"

# -

show.add code language: "c", source: <<-SOURCE
  /* Follow Along! */

  ssh -l demo brooklan.nyc
SOURCE

# -

show.add text title: "Incoming", content: <<-LIST
  * authentication
  * authorized_keys
  * configs
  * tunnels
    * bypassing outbound firewalls
    * bypassing inbound firewalls
  * executing remote commands
  * client control
LIST


# -

show.add chapter title: "Authentication"

# -

show.add text title: "Passwords", content: <<-LIST
  * classic challenge response model
LIST

# -

show.add text title: "Key Pairs", content: <<-LIST
  * Asymetric, Public Key Encryption
  * Private key: Local computer. SSH client
  * Public Key: Remote computer. SSH host / server
LIST

# -

show.add text title: "Key Exchange", content: <<-LIST

  1. Client generates a session ID and signals its intent to connect to the server
    a. tells server which pubkey to use
  2. Server receives the intent to connect.
    a. Generates a random string and encrypts it. Sends to client
    b. Hashes the string and the session ID and waits

  3. Client receives the string, hashes it along with the sessions ID

  4. Server receives the hash and compares it against its own hash from step 2b
LIST

# -

show.add text title: "Key Gen and Initial Setup Demo", content: ""

# -

show.add chapter title: "Configuration"

# -

show.add text title: "User Config", content: <<-LIST
  * Located in `~/.ssh/config`
  * store server-specific configurations
  * store global client configurations
  * show config file
LIST

# -

show.add text title: "Server Config", content: <<-LIST
  * Located in `/etc/ssh/sshd`
  * PasswordAuthenticate
  * AllowUsers
  * show server config
LIST

# -

show.add text title: "authorized_keys", content: <<-LIST
  * SSH host/server keeps track of who is allowed to connect
    * public keys
  * Entry Format: <command> <options> <pub_key> <comments>
  * Show demo entry
LIST

# -

show.add chapter title: "Tunnels"

# -

show.add text title: "Remote Tunnels", content: <<-LIST
  * useful for exposing your application to the world
LIST

# -

show.add code language: "c", source: <<-SOURCE
  ssh -R 0.0.0.0 5000:localhost:3000 droplet
SOURCE

# -

show.add text title: "Local Tunnels", content: <<-LIST
  * useful for bringing a remote service locally
  * you can also make local any resource that the remote SSH host can access too! Not just localhost
LIST

# -

show.add code language: "c", source: <<-SOURCE
# bring the remote psql service and bind it locally
ssh -L 5432:localhost:5432 droplet

# bind a service locally that only the remote machine can access
ssh -L 5432:<IP_ONLY_DROPLET_HAS_ACCESS_TO>:5432 droplet
SOURCE

# -

show.add text title: "Dynamic Tunnels", content: <<-LIST
  * send all traffic through this port
  * use the remote server as an exit node
LIST

# -

show.add code language: "c", source: <<-SOURCE
  ssh -D 9999 droplet
SOURCE

# -

show.add chapter title: "Remote Command Execution"

# -

show.add text content: <<-LIST
  * send the remote machine one-off commands
  * use their output locally!
LIST

# -

show.add code language: "c", source: <<-SOURCE
  ssh droplet 'cat ~/laptop/.cellar' | xargs brew install
SOURCE

# -

 show.add chapter title: "Client Control"

# -

show.add text content: <<-LIST
  * ~. - kills current ssh connection
  * ~z - background the connection
  * ~C - enter a client command prompt
  * ~? - for more commands
LIST

# -

show.add text title: "Resources", content: <<-TXT
  - [ssh-config](linux.die.net/man/5/ssh_config)
  - [tldr](tldr-pages.github.io)
  - [explainshell](explainshell.com)
  - [Digital Ocean SSH Rundown](j.mp/1SZpWbd)
  - [Black Magic of SSH (Vimeo)](vimeo.com/54505525)
TXT

# -

show.add text title: "Fin", content: <<-TXT

  github  : audibleblink/ssh-talk
  twitter : @4lex

TXT




show.start
