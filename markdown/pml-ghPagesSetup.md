# Overview
Github Pages is a tool to create a website from a github repository. During prior runs of the *Practical Machine Learning* course, students expressed frustration at the work required to correctly configure Github Pages.

This guide has been created as a reference to help students quickly set up Github, a local repository, and RStudio per requirements for the *Practical Machine Learning* course project:

1. Create a project-specific github repository to host content for the Practical Machine Learning course project,
2. Configure the repository to enable Github Pages,
3. Configure the remote repository so the Github pages branch is the default for `push` and `pull` requests,
4. Clone the Github Pages branch to a local machine and configure it for use with RStudio, and
5. Create an R Markdown file for the project content that is accessed as the default webpage on the project Github Pages site.

### Prerequisites: Data Scientist's Toolbox

Since *The Data Scientist's Toolbox* is a prerequesite for this course, this article expects students to already have git installed on their local machine, and that they have completed the peer reviewed assignment that requires students to work with git and github. 

For information on how to install and configure git and github, please review the relevant content int the *Git and Github* section of the *Data Scientist's Toolbox* page on the [Data Science Specialization Website](http://datasciencespecialization.github.io/toolbox/). 

### Step 1: Create a Github Repository for Practical Machine Learning

Use a web browser to navigate to your github home page, `https://github.com/username`, and select the `Repositories` tab to display the list of your repositories. If you are not already logged into Github, press the `Sign in` button in the upper right corner of your github home page, and enter your credentials on the login page. Next, press the `New` button to create a new repository.

<img src="./images/gh-pages01.png">

From the **Create a new repository** page, enter `practicalmachinelearning` as the repository name, and a description. Since all of the Github Pages content is public, there is no need to make this repository private if your account has private repositories enabled.

Initialize the repository with a README. A README is required for Github to allow a branch to be created from the repository immediately upon initialization. Optionally, select R for `.gitignore.` and add a license, as illustrated below. Then press the `Create repository` button.

<img src="./images/gh-pages02.png">

### Step 2: Create a gh-pages Branch

From the `practicalmachinelearning` repository home page, select the `Branch: ` button, type `gh-pages` in the search box, and then press the `Create branch: gh-pages` button to create the new branch.

<img src="./images/gh-pages03.png">

**NOTE:** It is very important to make sure this branch is named **gh-pages** versus another name like *ghpages*, which will not work correctly. 

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

* [Configure RStudio with Github - OSX](https://github.com/lgreski/datasciencectacontent/blob/master/markdown/configureRStudioGitOSXVersion.md)
* [Configure RStudio with Github - Windows](https://github.com/lgreski/datasciencectacontent/blob/master/markdown/configureRStudioGitWindowsVersion.md)

Start RStudio, and then select `New Project...` from the RStudio pulldown menu bar.

<img src="./images/gh-pages09.png">

Next, from the **New Project** Dialog Window, select `Version Control`.

<img src="./images/gh-pages10.png">

Next, select `Git` from the **Create Project from Version Control** Dialog.

<img src="./images/gh-pages11.png">

In the **Clone Git Repository** Dialog, enter the repository URL, the local directory name where the repository will be stored on the local machine, and the parent directory where the project directory will be created. Then press the `Create Project` button.

<img src="./images/gh-pages12.png">

After pressing the `Create Project` button, RStudio and Git will clone the remote repository from the `gh-pages` branch into the directory specified in the **Clone Git Repository** Dialog, create a `projectName.Rproj` file, and return you to the main RStudio window.

### Step 5: Create an R Markdown File & Save as index.Rmd

Select `File > R Markdown...` from the main pulldown menu bar in RStudio to create a new R Markdown file.

<img src="./images/gh-pages13.png">

On the **New R Markdown** Dialog Window, enter a title and author name, then select the `HTML` radio button to set the default output format for the docuent. Then press the `OK` button to generate the Rmd file.

<img src="./images/gh-pages14.png">

At this point the R Markdown file is named "untitled". To make this file the default file for the Github Pages website, we will need to save it as `index.Rmd`. First, select `File > Save As...` from the main pulldown menu bar.

<img src="./images/gh-pages15.png">

Enter `index.Rmd` as the file name, and press the `Save` button. _Note that the file name must begin with a lower case 'i' or the HTML page generated by `knitr()` will not load correctly on Github Pages_.

<img src="./images/gh-pages16.png">

### Step 6: Knit to HTML, Commit, and Push to Github

We've made some edits to the default Rmd file that RStudio creates. To move the required content back to Github, we'll need to Knit to HTML, commit the resulting HTML file to the local Git branch, then push the committed changes up to the remote branch.

First, press the `Knit HTML` button in the icon bar within the *Source* pane of the main RStudio window.

<img src="./images/gh-pages17.png">

RStudio will render an HTML file from the R Markdown file, and display it in a window. Close the window after reviewing the output.

To save the changes to git, we'll commit both the `index.Rmd` and `index.html` files. Select the `Git` tab in the upper right window pane in RStudio. Notice that the branch that is active in RStudio is `gh-pages`, which is listed on the right side of the icon bar near the top of the **Environment / History / Git** pane.

Check the `Staged` checkboxes for the `index.Rmd` and `index.html` files, and press the `Commit` button.

<img src="./images/gh-pages18.png">

From the **Review Changes** window, confirm that `index.Rmd` and `index.html` are checked to be staged, enter a commit message in the text entry window in the upper right portion of the window, and press the `Commit` button.

<img src="./images/gh-pages19.png">

RStudio will display the **Git Commit** dialog, which will confirm that both files have been added to the local repository. Press the `Close` button to close the dialog box.

<img src="./images/gh-pages20.png">

To push the changes to Github, press the `Push` button in the **Review Changes Window**.

<img src="./images/gh-pages21.png">

RStudio will display the **Git Push** dialog to confirm that the files have been pushed to the remote repository. Review the message and press the `Close` button, and RStudio returns to the **Main Window**.

<img src="./images/gh-pages22.png">

### Step 7: Confirm that index.html is visible on github.io

<strong>Note that it may take up to 15 minutes for the content you publish into your github repository to become visible on the public internet via the github.io domain.</strong> Open a web browser and navigate to http://username.github.io/repositoryname to view the HTML version of your R Markdown file.

Note that a few students have reported difficulties accessing the index.html file without including the file name in the URL, as http://username.github.io/repositoryname/index.html. If accessing the file by repository name alone does not work, try accessing it with the fully specified file name. 

<img src="./images/gh-pages23.png">

### Closing Considerations

Note that if you want to also push the markdown file (index.md) and its associated resources, you'll need to configure knitr to keep the markdown file. To do this, select the gear icon from the menu bar in the Source pane of RStudio (it's just to the right of the `Knit HTML` button), press the `Advanced` button, and click the checkbox for *Keep Markdown source file*.  You'll need to add the .md file and any subdirectories / support files that were created during the knit process in order for the .md file to render complete with graphics on github. 

Finally, please be aware that all content published to Github Pages is public. Do not post content you wish to remain private on Github Pages, such as content from a private repository.
