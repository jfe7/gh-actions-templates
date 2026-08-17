# 🚀 GitHub Actions Templates

This repository contains a collection of reusable GitHub Actions templates for common CI/CD tasks across various technologies.

Examples on how to use each template can be found [here](examples/).

# 📂 Workflow Naming Convention

All workflows are located in [.github/workflows](.github/workflows/) and follow this naming pattern:

| Pattern                                            | Purpose                                         |
| -------------------------------------------------- | ----------------------------------------------- |
| &lt;purpose&gt;.yaml                               | GitHub Workflow for this repository only.       |
| template-&lt;tech-or-tool&gt;-&lt;purpose&gt;.yaml | Re-usable templates to be called via workflows. |

#### Examples:

```
- template-linter.yml
- template-terraform-plan-apply-factory-deploy.yml
```

The workflow files which are not prefixed with `template-` are workflows for this repository.

For example `pull-request-validation.yml` which runs on a pull request and validates the code quality in this repository.

# 🛠️ How to Use These Workflows & Actions

You can call these reusable workflows or actions from any other repository using the `uses:` keyword.

The [examples](examples) folder holds an example of each Workflow & Action.

# 🪝 Commit Message Convention

This repository uses the [Angular commit convention](https://www.conventionalcommits.org/).

Enable the tracked Git hook once after cloning, this will ensure all commits must match the angular convention:

```powershell
.\.githooks\Install-GitHooks.ps1
```

Commit messages must use one of these formats:

```text
type(optional-scope): lowercase description
type(optional-scope)!: lowercase breaking-change description
```

For example:

```text
feat(workflows): add reusable validation
fix: handle missing input
refactor(api)!: remove deprecated parameter
```
