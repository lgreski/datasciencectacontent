# Overview
Github Pages is a tool to create a website from a github repository. During prior runs of the *Practical Machine Learning* course, students expressed frustration at the work required to correctly configure Github Pages.

This guide has been created as a reference to help students quickly set up Github, a local repository, and RStudio per requirements for the *Practical Machine Learning* course project:

1. Create a project-specific github repository to host content for the Practical Machine Learning course project,
2. Configure the repository to enable Github Pages,
3. Configure the remote repository so the Github pages branch is the default for `push` and `pull` requests,
4. Clone the Github Pages branch to a local machine and configure it for use with RStudio, and
5. Create an R Markdown file for the project content that is accessed as the default webpage on the project Github Pages site.


### Step 1: Create a Github Repository for Practical Machine Learning

Use a web browser to navigate to your github home page, `https://github.com/username`, and select the `Repositories` tab to display the list of your repositories. If you are not already logged into Github, press the `Sign in` button in the upper right corner of your github home page, and enter your credentials on the login page. Next, press the `New` button to create a new repository.

<img src="./images/gh-pages01.png">

From the *Create a new repository* page, enter `practicalmachinelearning` as the repository name, and a description. Since all of the Github Pages content is public, there is no need to make this repository private if your account has private repositories enabled.

Optionally, select R for `.gitignore`, initialize the repository with a README, and add a license, as illustrated below. Then press the `Create repository` button.

<img src="./images/gh-pages02.png">

### Step 2: Create a gh-pages Branch

From the `practicalmachinelearning` repository home page, select the `Branch: ` button, type `gh-pages` in the search box, and then press the `Create branch: gh-pages` button to create the new branch.

<img src="./images/gh-pages03.png">

### Step 3: Make gh-pages the Default Branch

From the repository home page, select the `Settings` tab to access the *Repository Settings* page.

<img src="./images/gh-pages04.png">

Next, select the `Branches` option on the left navigation pane to bring up the branches configuration panel.

<img src="./images/gh-pages05.png">

Next, in the *Default Branch* area of the page, press the `master` button, and then select `gh-pages` to set it as the default branch in the repository.

<img src="./images/gh-pages06.png">

Next, press the `Update` button to confirm your choice of `gh-pages` as the default branch for the repository.

<img src="./images/gh-pages07.png">

Github will display a confirmation dialog box to confirm your understanding that all subsequent `clone` and `pull` requests for the remote repository will now be executed from the `gh-pages` branch. Press the `I understand` button to continue.

<img src="./images/gh-pages08.png">

### Step 4: Configure RStudio to work with the Repository

If you have previously configured RStudio to work with Github, you can use RStudio to clone the repository by creating a new project. For instructions on how to configure RStudio to work with Github, see the following:

* [Configure RStudio with Github - OSX]()
* [Configure RStudio with Github - Windoes]()
