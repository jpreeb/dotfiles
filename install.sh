#!/bin/bash

#
# Create symlinks from version controlled dot files.
#

# list all files
ls -A |

  # grep for .dotfiles
  egrep "^\.[a-z]" |

    # skip .git file
    egrep -v "^\.git$" |

      # for each match
      while read line;

        # create a symlink in the home directory
        do ln -sf $HOME/.dotfiles/$line $HOME/;
done;
