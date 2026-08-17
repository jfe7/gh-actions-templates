# 💡 Examples

```yml
name: 'Git Version'

on:
  workflow_dispatch:
    branches:
      - main

permissions:
  id-token: write
  contents: write

jobs:
  git-versioning:
    name: 'Git Versioning'
    uses: 'jfe7/gh-actions-templates/.github/workflows/template-git-versioning.yml@main'
    secrets:
      gh_token: ${{ secrets.GITHUB_TOKEN }}
```
