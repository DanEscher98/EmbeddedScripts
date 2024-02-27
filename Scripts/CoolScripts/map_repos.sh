root_dir="$PWD"

for git_dir in `find -type d -name "*.git"`; do
  repo=`dirname $git_dir`
  cd $repo

  remote_info=`git remote show origin 2>/dev/null`
  if [ $? -eq 0 ]; then
    remote=`echo $remote_info | grep -oE 'https://[^[:space:]]*' | head -n 1`
    echo -e "$repo\n\t$remote\n"
  fi

  cd "$root_dir"
done > repos_manifest.txt
