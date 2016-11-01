export VISUAL="vim"

# Ruby
PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
export GEM_HOME=$(ruby -e 'print Gem.user_dir')

# Python
# Conda
export PATH="/home/colin/miniconda3/bin:$PATH"
source activate py3
