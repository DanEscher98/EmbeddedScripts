#!/bin/bash

# Function to check if a word is removed from a file in a commit
check_commit() {
    commit_hash=$1
    file_path=$2
    word_to_search=$3

    # Use git show to get the contents of the file in the specific commit
    file_content=$(git show ${commit_hash}:${file_path} 2>/dev/null)

    # Use grep to check if the word is present in the file content
    if echo "$file_content" | grep -q "$word_to_search"; then
        return 0  # Word found in the file
    else
        return 1  # Word not found in the file
    fi
}

# Specify the starting commit hash
start_commit="$1"

# Specify the file path and the word to search
file_path="$2"
word_to_search="$3"
head_commit=$(git log -1 --pretty=format:%H)

# Iterate over commits starting from the specified commit
while [ -n "$start_commit" ]; do
    #echo "Checking commit: $start_commit"

    # Check if the word is present in the file content for the current commit
    check_commit $start_commit $file_path "$word_to_search"

    # If the word is not found, print the commit and exit
    if [ $? -eq 1 ]; then
        commit_message=$(git log -1 --pretty=format:"(%h - %ad)\n%s" --date=short $start_commit)
        echo -e "\n$commit_message"
        exit 0
    fi

    # Get the parent commit for the next iteration
    start_commit=$(git log --pretty=format:%H --reverse $start_commit..$head_commit | head -1)

    # If there is no parent commit, exit the loop
    [ -z "$start_commit" ] && break
done

echo "Word not found in any commit."
