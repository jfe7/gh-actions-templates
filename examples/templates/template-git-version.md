# 💡 Examples

```yml
name: 'Git Version'

on:
  pull_request:
    branches:
      - main
  push:
    branches:
      - main

permissions:
  id-token: write
  contents: write

jobs:
  git-version:
    name: 'Git Version'
    uses: 'jfe7/gh-actions-templates/.github/workflows/template-git-version.yaml@main'
    with:
      dry_run: ${{ github.event_name == 'pull_request' }}
    secrets:
      gh_token: ${{ secrets.GITHUB_TOKEN }}
```

Pull requests analyse the head branch and write the proposed release version to the workflow log without creating a tag or release.

A push to `main` creates the tag.
