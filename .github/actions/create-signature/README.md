# Example for usage

# .github/workflows/create-signature.yml

name: "Create Signature"

on:
  push:
    branches:
      - main

jobs:
  create-signature:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v2

      - name: Install jfrog cli
        uses: jfrog/setup-jfrog-cli@v4

      - name: Run Create Signature Action
        uses: ./.github/actions/create-signature
        with:
          package-name: "example-project-app"
          package-repo-name: "example-project-docker-dev"
        env:
          GITHUB_ACTOR: ${{ github.actor }}
          PRIVATE_KEY: ${{ secrets.PRIVATE_KEY }}
