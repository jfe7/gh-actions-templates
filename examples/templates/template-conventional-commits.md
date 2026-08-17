# 💡 Examples

```yml
name: 'Conventional Commits'

on:
  pull_request:
    branches:
      - main
    types:
      - opened
      - edited
      - synchronize
      - reopened

permissions:
  contents: read

jobs:
  conventional-commits:
    name: 'Conventional Commits'
    uses: 'jfe7/gh-actions-templates/.github/workflows/template-conventional-commits.yaml@main'
    with:
      runs_on: ubuntu-latest
      validate_pr_title: true
      validate_commits: true
```

The workflow validates the pull request title and every commit introduced by the pull request against the Angular commit convention.

The `runs_on`, `validate_pr_title`, and `validate_commits` inputs are optional and use the values shown above by default.
