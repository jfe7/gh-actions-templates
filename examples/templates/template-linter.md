# 💡 Examples

```yml
name: 'Pull Request Linting'

on:
	pull_request:
		branches:
			- main

permissions:
	contents: read
	pull-requests: write

jobs:
	lint:
		name: 'Lint'
		uses: 'jfe7/gh-actions-templates/.github/workflows/template-linter.yaml@main'
		with:
			runs_on: ubuntu-latest
		secrets:
			gh_token: ${{ secrets.GITHUB_TOKEN }}
```

The workflow runs Super-Linter against the pull request and posts its job summary as a pull request comment.

The `runs_on` input is optional and defaults to `ubuntu-latest`.
