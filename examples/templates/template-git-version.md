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
  git-version:
    name: 'Git Version'
    uses: 'jfe7/gh-actions-templates/.github/workflows/template-git-version.yml@main'
    secrets:
      gh_token: ${{ secrets.GITHUB_TOKEN }}
```
