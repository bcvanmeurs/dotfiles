# https://stackoverflow.com/a/33548037
# Delete all local branches that have been deleted on the remote
function git_clean_branches
    # prune branches that have been deleted on the remote
    git fetch --prune
    # select all branches that have been "gone" on the remote
    for branch in (git for-each-ref --format '%(refname) %(upstream:track)' refs/heads | awk '$2 == "[gone]" {sub("refs/heads/", "", $1); print $1}')
        git branch -D $branch
    end
end
