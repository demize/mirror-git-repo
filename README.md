# mirror-git-repo

This mirrors one git repo to another. Ideally you'll use this with a webhook triggered on your source repository, with `repository_dispatch`.

Unlike the upstream version, this uses `git push --mirror` to handle the mirror, and should therefore preserve all metadata. This prevents it from being able to change branch names.

## Example workflow

```yml
name: mirror to repo

on: 
    repository_dispatch:
        types: [mirror]

# Ensures that only one mirror task will run at a time.
concurrency:
  group: mirror-git-repo

jobs:
  mirror-git-repo:
    runs-on: ubuntu-latest
    steps:
      - uses: demize/mirror-git-repo@v1 # please replace this with a commit hash
        env:
          SSH_PRIVATE_KEY: ${{ secrets.SSH_PRIVATE_KEY }}
        with:
          source-repo: "git@source:repo.git"
          destination-repo: "git@github.com:your/mirror.git"
```

## Docker

```sh
docker run --rm -e "SSH_PRIVATE_KEY=$(cat ~/.ssh/id_rsa)" $(docker build -q .) "$SOURCE_REPO" "$DESTINATION_REPO"
```

## License

This work is dual-licensed under MIT and GPL 3.0 (or any later version). You have to comply to both of them if you want to use this work.

`SPDX-License-Identifier: MIT AND GPL-3.0-or-later`

You can find the licenses in the licenses folder.
