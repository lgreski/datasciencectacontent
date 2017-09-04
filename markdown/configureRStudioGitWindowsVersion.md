# Configuring RStudio / Github Integration -- Windows Version

In addition to using the command line version of git to synchronize a local repository with Github, it is possible to configure RStudio to work with it directly.

### Prework Steps

This walkthrough is intended for students who have already completed Week 2 in the Johns Hopkins University *The Data Scientist's Toolbox* on Coursera. During the week 2 lectures, students are taught how to install git, register for an account on Github, create / fork a repository, and clone a repository from Github to one's local machine. 

Key steps that must be complete prior to this walkthrough include:

1. Install R
2. Install RStudio
3. Setup an account on Github.com
4. If necessary, install git on the local machine, and configure your username and email address (they are saved to the `.gitconfig` file) as explained during the Week 2 lectures in *The Data Scientist's Toolbox*. 
5. Clone a remote repository from Github to git on o local machine. 

For detailed instructions on how to configure git on your local machine, please review the *Git / Github* section on the [Data Science Specialization: Toolbox](http://bit.ly/2c9FGMa) page of the *DSS community content* that has been posted to the internet. 

Once you've made it this far, you should be able to start RStudio, and run git from a command line.

### Configure RStudio

Start RStudio, and from the main pulldown menu, select **Tools \> Global Options** 

![](https://coursera-forum-screenshots.s3.amazonaws.com/6c/0aaa2078ff11e58f7c0ba58a5e0b12/config1.png)

From the Global Options window, (1) click on the Git/SVN icon, and make the following changes to the version control configuration -- (2) press the checkbox to enable version control, and (3) configure the path to the git executable, using Browse if needed. When finished, press the **Apply **button. 

![](https://coursera-forum-screenshots.s3.amazonaws.com/e2/4cb66078ff11e5965fe95ce254af91/config2.png)

Now you are ready to configure a Github project to work with RStudio.

From the main menu, select **File \> New Project**

**![](https://coursera-forum-screenshots.s3.amazonaws.com/1c/65c260790011e58ef4636bbf5e8dbe/config3.png)**

From the **New Project** window, select **Existing Directory** to link RStudio with an existing local git project directory. To set up a new repository, select New Directory. 

![](https://coursera-forum-screenshots.s3.amazonaws.com/8c/7b4d40790011e5abd02fdc6f0c3333/config4.png)  
RStudio will display the **New Project** window. Press the **Browse** button to bring up the File Manager (Windows) or Finder (OSX), and... 

![](https://coursera-forum-screenshots.s3.amazonaws.com/1e/70b820790111e59faaad285feed583/config5.png)

Select the folder where the repository to be linked with RStudio is located, and press the **Open** button. 

![](https://coursera-forum-screenshots.s3.amazonaws.com/2a/f90840790111e5a6fb99ebec1768f4/config6.png)

Back at the **New Project** window, press the **Create Project** button. 

![](https://coursera-forum-screenshots.s3.amazonaws.com/5d/7f4c20790111e5b2cc1d74429b7f3a/config7.png)

Once you return to the main RStudio window, you can now see a list of files in the Files tab of the lower right pane of RStudio. 

![](https://coursera-forum-screenshots.s3.amazonaws.com/9d/af0790790111e5a13c9f15b2593997/config8.png)

We'll select README.md by clicking the link on README.md in the Files pane, which displays the file in the RStudio code editor. I added the line "adding some content..." so we can illustrate how to commit to the local machine and push the changes to Github. 

![](https://coursera-forum-screenshots.s3.amazonaws.com/cd/705f10790111e5a6fb99ebec1768f4/config9.png)

Save the edited code, and then **select the Git tab** in the upper right pane of RStudio. From the Git window, **select the checkbox in the Staged column** to select the file for commit, and press the **Commit** button. 

![](https://coursera-forum-screenshots.s3.amazonaws.com/43/9c7250790211e5b13cadfd9bab444d/config10.png)

This causes RStudio to display the Git commit window box. Enter a commit message into the message entry area, and press the **Commit** button to commit the changes to your local repository. 

![](https://coursera-forum-screenshots.s3.amazonaws.com/94/df3620790211e5a7bc5358342f66ff/config11.png)

RStudio will commit the changes to the repository and display a dialog box communicating the status of the commit. Review the message and press the **Close** button. 

![](https://coursera-forum-screenshots.s3.amazonaws.com/bd/8e4020790211e5963ecd8a6abfc3d2/config12.png)

Back at the Commit window, press the **Push** button to push the changes that were committed to your local repository up to Github. 

![](https://coursera-forum-screenshots.s3.amazonaws.com/f4/740d90790211e5bf599fba84e60099/config13.png)

RStudio may prompt you for your Github userid and password here, depending on your local git configuration. 

![](https://coursera-forum-screenshots.s3.amazonaws.com/64/1f16d0790311e58f7c0ba58a5e0b12/config13a.png)

![](https://coursera-forum-screenshots.s3.amazonaws.com/80/739770790311e584339b7db0a2e4bf/config13b.png)

RStudio will display a dialog box to display the status of the push to the remote repository. This may take 30 seconds to a minute if your internet connection is slow. Note that if your local repository isn't up to date with the remote repository, RStudio will display a message instructing you to conduct a **Pull** before attempting a **Push**.

After reviewing the message to confirm the push command completed successfully, press the **Close** button. 

![](https://coursera-forum-screenshots.s3.amazonaws.com/a3/1a9800790311e5b0465de2dfe801f0/config14.png)

Now you can check the file on _github.com_ and see that it has been updated with the latest changes. 

![](https://coursera-forum-screenshots.s3.amazonaws.com/2e/674ca0790411e58ef4636bbf5e8dbe/config15.png)


