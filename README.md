# Create a query application for the [GitHub] API (https://github.com) #

Create an application to query the [GitHub API] (https://developer.github.com/v3/) and bring the most popular repositories.

- List of repositories.
    * Pagination on the list screen, with infinite endless scroll / scroll (incrementing the `page` parameter).
    * Each repository displays Repository Name, Repository Description, Author Name / Photo, Number of Stars, Number of Forks
    * When touching an item, it takes the list of Pull Requests from the repository
- Pull Requests from a repository. 
    * Each item in the list displays Name / Photo of the PR author, PR Title, PR Date and Body PR
    * When touching an item, you can open in the browser the page of the Pull Request in question
