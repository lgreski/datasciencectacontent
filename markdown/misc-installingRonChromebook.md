# Running R and RStudio on Chromebook?

Since its introduction in 2013, the Chromebook has become a common computing platform in primary and secondary education settings. Its low cost, ease of administration, and accessibility of the Google Apps suite make the Chromebook a compelling standard for [educational technology](https://thejournal.com/Articles/2015/04/14/3-Reasons-Chromebooks-Are-Shining-in-Education.aspx?Page=1), as highlighted in [THE Journal](https://thejournal.com/pages/about-the-journal.aspx), an education and technology publication.

However, the characteristics that make the Chromebook great for most students can be a challenge for more advanced students, such as those taking advanced placement courses in computer science or statistics. These types of courses typically require students to use software that is not designed for the Chromebook, including various programming languages and interactive development environments.

Fortunately, over the past 4 years enterprising developers have built tools such as [crouton](https://github.com/dnschneid/crouton) to unlock the Linux environment on which the [Chrome Operating System](https://en.wikipedia.org/wiki/Chrome_OS) is built, enabling people to install and run traditional Linux development tools devices that run Chrome OS.

## The Challenge: Integrating R with Google Sheets for AP Statistics

In my role as Community Mentor in the Johns Hopkins University Data Science Curriculum on [Coursera](https://www.coursera.org/specializations/jhu-data-science), a student in the July 2017 run of *R Programming* asked a question about how to load R packages onto the [r-fiddle](http://www.r-fiddle.org/#/) website. R-fiddle is a cloud based implementation of the statistics language R, and it enables people to develop and share small amounts of R code.

This particular student is a high school math teacher and is preparing to introduce R to high school students in an upcoming advanced placement statistics class. Students who take the class will have Chromebook laptops, and r-fiddle would be a good way to introduce R in a way that would work on a Chromebook.

Students will also be required to collect data and store it in Google Sheets prior to analyzing it with R. Ideally, students would use the `googlesheets` package to analyze the data within r-fiddle. Unfortunately, r-fiddle does not have the the capability for end users to install R packages, so it's not currently possible to use Google spreadsheets with r-fiddle.

## Another solution: Install R and RStudio Directly on the Chromebook

One approach to making R work on the Chromebook is to install the Linux operating system with a tool called [crouton](https://github.com/dnschneid/crouton), short for Chromium OS [chroot](https://en.wikipedia.org/wiki/Chroot) Environment. Crouton enables the Chrome OS to install a linux partition, as well as the ability to toggle back and forth between Chrome and Linux. Once Linux is installed on the Chromebook, one can install R and RStudio, following instructions such as those in a 2016 [](r-bloggers.com) article on [Installing RStudio on Ubuntu Xenial](https://www.r-bloggers.com/how-to-install-r-on-linux-ubuntu-16-04-xenial-xerus/).

## Prerequisites

Before we begin, we'll list a few prerequisites for the process, including:

* Administrator access to the Chromebook, <br><br>
* USB memory stick for additional storage, and <br><br>
* The "hacker mentality," and <br><br>
* Enough Linux knowledge to be "dangerous."

### Administrator Access

Most of the Linux work requires administrator rights to the operating system. In Linux this means one must have the ability to run programs as "superuser." In practice, one's user account in the Linux operating system must have administrator privileges so s/he can run commands with superuser privileges via the  [sudo](https://en.wikipedia.org/wiki/Sudo) (or "superuser do") command.

### The "hacker mentality"

Students in the Johns Hopkins University Data Science Specialization are [introduced to this concept early in the specialization](http://bit.ly/2nGskYS). The "hacker  mentality" is the idea that a data scientist needs to have a certain tenacity to solve ill-defined problems, and the resourcefulness necessary to pull together enough information to solve a problem from any available resource.

As an example, the question of how to integrate Google Sheets with r-fiddle is well outside the scope of the *R Programming* course, but since it was an interesting problem I did the research necessary to write this article. In the process of writing the article I had to piece together content from a wide variety of sources to deliver a working system that could access Google spreadsheets. I also had to learn a fair amount by trial and error (i.e. multiple installs of Linux to test out various sets of parameters / graphical desktops).

If one takes the time to complete all the steps in this article, one will have a good start in understanding how to install a sophisticated operating system that is used by a wide variety of businesses, to configure it, and to install various types of open source software.

### USB memory stick

Since the typical Chromebook has only 16Gb of on device storage, we'll need extra space to store data and R programs. I like to use the low profile USB memory sticks that are made by SanDisk and Samsung that look like the following image.

<img src="./images/misc-rOnChromebook01.png">

Once installed in the Chromebook the low profile makes it easy to leave the memory stick attached to the device rather than removing it each time the device is turned off. The low profile stick is also less likely to be damaged while inserted into the device.

### Enough Linux knowledge to be "dangerous"

1. Ability to use a command line terminal
2. Installing software
3. Interpreting error messages
4. Setting locale

# Step 1: Install Linux on Chromebook

## Before you begin

Configuring a Chromebook to run in Developer mode with Linux does have consequences. First, the boot time will increase from about 5 seconds to about 30 seconds each time the Chromebook is booted. This impact can be mitigated by putting the Chromebook into sleep mode rather than doing a complete shutdown.

Second, a specific sequence of commands must be entered each time you wish to run a Linux session on the Chromebook. Given the value of being able to run a full version of RStudio on the device, these are minor inconveniences.

Finally, it's important to know that you are never more than a [Powerwash](https://www.laptopmag.com/articles/how-to-reset-a-chromebook) away from starting over. Since the base Chrome installation stores most items to the Google cloud, there is little downside risk to experimenting with the device.

## The Process

The remainder of this section is based on Whitson Gordon's 2013 article on [](lifehacker.com), [How to Install Linux on a Chromebook and Unlock its Full Potential](http://lifehacker.com/how-to-install-linux-on-a-chromebook-and-unlock-its-ful-509039343). The content is copied here to make it easier to follow the entire set of instructions without jumping back and forth to multiple websites.

* Enable developer mode <br><br>
* Install Crouton <br><br>
* Optimize the Linux Desktop for your Chromebook <br><br>

### Enable Developer mode

This step will wipe local data, so make sure you back up anything that is not already stored in the cloud prior to proceding.

1. Press and hold the `<ESC>` and `<Refresh>` keys together, then press the `Power button` (while still holding the other two keys). This will reboot the Chromebook into Recovery Mode. <br><br>
2. As soon as you see Recovery Mode pop up -- the screen with the yellow exclamation point -- press `<CTRL>+<D>`. THis will bring up a prompt asking if you want to turn on Developer Mode. <br><br>
3. Press `<Enter>` to continue, and then allow the machine time to process. It will pop up with a new screen for a few moments, then reboot and go through the process of enabling Developer Mode. This will take some time, as much as 15 - 20 minutes, and will wipe out your local information. <br><br>
4. When the process is complete, it will return to the screen with the red exclamation point. Leave this alone until it reboots to the Chrome OS, which should take another 30 seconds or so.

<img src="./images/misc-rOnChromebook02.png">

Note that some older Chromebooks have a physical switch that must be flipped in order to turn on Developer Mode. Consult the user manual for your specific device for additional instructions for enabling Developer Mode.

At this point you will need to login to the Chromebook with its original factory settings, connect to a wireless access point, and reconnect to your Google account.

### Install Crouton

Installing Crouton and loading Ubuntu Linux is multi-step process.

1. [Download Crouton](http://goo.gl/fd3zc) and save it in your `Downloads` folder.  <br><br>
2. Press `<CNTL>+<ALT>+<T>` to bring up a terminal in your Chromebook. <br><br>
3. At the terminal, enter the `shell` command to enter an Ubuntu shell.

       shell

4. Next, run the following command to install Crouton with the xfce desktop:

       sudo sh -e ~/Downloads/crouton -t xfce

5. If you would prefer to run the Unity desktop, which is the standard for Ubuntu Linux but takes up more space than xfce, run the following command:

       sudo sh -e ~/Downloads/crouton -t unity
<img src="./images/misc-rOnChromebook03.png"> <br><br>**NOTE:** the name of the new environment defaults to the version of the operating system being installed. For the default install of Ubuntu Linux, the current production version is named `xenial`. This is important if you need to uninstall the image at a later point.

6. If you're installing Linux on a device that has a touchscreen, such as the Chromebook Pixel or the HP Chromebook 11 G5 EE, enter the following to install touch support with the xfce desktop:

       sudo sh -e ~/Downloads/crouton -t touch,xfce
7. Optional: you can encrypt your desktop with the optional `-e` flag, since Developer Mode weakens the security of the Chromebook. See the [Crouton Github site](https://github.com/dnschneid/crouton/blob/master/README.md) for more information about encryption. <br><br> At this point your computer will install crouton and Ubuntu. Depending on the speed of your machine and internet connection, this may take 20 - 30 minutes.<br><br> When the install is complete, it will ask you for a username and password for the new Ubuntu installation. This userid will have administrator rights, so it's important to guard the userid and password carefully. <br><br>
8. Once installation is complete, enter the following command if you've installed xfce as your desktop environment.

       sudo startxfce4
9. If you installed Unity as your desktop, enter the following command to start the desktop.

       sudo startunity

If you've installed Unity, the desktop will look similar to this.

<img src="./images/misc-rOnChromebook04.png">

 Note that there are other desktop interfaces that can be installed instead of xfce or Unity, such as LXDE, KDE, or the Gnome Desktop. Please refer to the [Crouton Wiki](https://github.com/dnschneid/crouton/wiki) for information on the desktops that are supported by Crouton.

 If you don't like the desktop that you installed, you can use crouton to uninstall the Linux partition, and start over again. To uninstall an Ubuntu partition installed with the default name of `xenial`, enter the following command in the crosh window in Chrome OS.

       sudo delete-chroot xenial


### Optimize Linux Desktop for Chromebook  

Discuss various bits of housekeeping here...

# Step 2: Prepare Linux for RStudio

In this step we will install a number of Linux software applications that will be useful to someone working in RStudio, including Git for source code version control,and Linux libraries on which R packages depend, such as `libxml2`, `curl`, and `libcurl`. We will also set the Linux locale to U.S. English with UTF-8 encoding, which is required for RStudio in the U.S.

## Install Linux libraries

List the Linux libraries that one needs to install in advance to support installation of R and RStudio. These libraries are necessary to download files in R via the `download.files()` function, and to use secure sockets with Google Sheets.

1. Install libcurl with the following commands in a Linux terminal.
        sudo apt-get -y install libcurl4-gnutls-dev
        sudo apt-get -y build-dep libcurl4-gnutls-dev
2. Install curl with the following command from a Linux terminal.
        sudo apt-get install curl
3. Install openssl with the following command from a Linux terminal.
        sudo apt-get install openssl

## Install Key Linux applications

At this point we will install a couple of applications that make the rest of the process easier, including the Chromium browser and the Atom text editor.

### Install the Chromium browser

Chromium is the open source browser on which Google Chrome is based. The [Chromium version excludes a number of proprietary software extensions](https://askubuntu.com/questions/6253/whats-the-difference-between-google-chrome-and-or-chromium-what-are-the-advant) such as Adobe Flash that are included in Google's version. To install Chromium, open a Linux terminal and enter the following command.

      sudo apt-get install chromium  

### Install the [Atom](http://atom.io) text editor

As students interact with various forms of data, sometimes it is helpful to look at the raw data files to understand their content, such as "does this file have a header row of variable names?" The open source text editor, [Atom](http://atom.io), is useful for this purpose. To install Atom, take the following steps.

1.  Download Atom from the Atom website's [download page](http://atom.io/download/deb).<br><br>
2. Once the software has completed the download, open the file viewer, navigate to the Downloads folder, and double click on the atom-amd64.deb package to start the Ubuntu Package Installer.<br><br>
3. The Package Installer will analyze the file, confirm that all required Linux libraries are present, and enable the `<Install Package>` button. Press the button to install the package.<br><br>
4. When complete, you can find Atom in the Applications folder or by searching for Atom from the Unity search button in the upper left corner of the Desktop.  <br><br>
<img src="./images/misc-rOnChromebook05.png"><br><br>
5. Double click the icon to start Atom.

### Install Git for source code version control

Git and [GitHub](https://github.com) are components of a larger toolkit used by professional data scientists to create [reproducible research](https://simplystatistics.org/2014/06/06/the-real-reason-reproducible-research-is-important/). As one begins to learn R programming, it is useful to write and save small snippets of code in case one needs to revert to a prior version of a program.

Git is a version control application that saves and tracks multiple versions of software source. To install git, open a Linux terminal and type the following command.

      sudo apt-get install git

### Install Ubuntu Software Center

The [Ubuntu Software Center](https://apps.ubuntu.com/cat/applications/precise/software-center/) is a graphical user interface that allows one to access a large volume of open source software that runs on Ubuntu. A searchable list of applications available for Ubuntu is also available via web browser as the [Ubuntu Apps Directory](https://apps.ubuntu.com/cat/).

[Ubuntu Software Center](https://apps.ubuntu.com/cat/applications/precise/software-center/) may be installed in a Linux terminal via the following command.  

      sudo apt-get install software-center

## Configure Linux Locale to US English

The default installation of Ubuntu does not set the locale (i.e. language and country settings) to a specific language and country. RStudio will generate warning messages about the need to set the locale to `en_US.UTF-8` unless we set it in advance. To set the locale, use the following command in a Linux terminal.

      sudo dpkg-reconfigure locales

This will bring up a character-based application where we can set the locale to the right format.<br><br>
<img src="./images/misc-rOnChromebook06.png"><br><br>
The formats are based on 2 character language codes, and underscore, a country code, and an encoding format. Scroll down to `en_US.UTF-8` and press the `<space bar>` to toggle the selection, as illustrated below.  
<br><br>
<img src="./images/misc-rOnChromebook07.png"><br><br>
Next, press the `<TAB>` key to move to the pushbuttons below the scrollable list. Highlight the `<OK>` button by tabbing to it, and then press `<ENTER>` to select it. This will generate the appropriate encodings into the environment.

To access the new encodings, one must logout of the Linux environment and log back in.

After logging in, one can confirm that the locale has been set correctly by entering the following command in a Linux terminal.

       locale

The output should match the following image.

<img src="./images/misc-rOnChromebook08.png">


# Step 3: Install R and RStudio

Now we're finally ready to install R and RStudio. This section is largely based on an [r-bloggers article](https://www.r-bloggers.com/how-to-install-r-on-linux-ubuntu-16-04-xenial-xerus/)  by [Kris Eberwein](https://www.r-bloggers.com/author/kris-eberwein/) that describes how to install R and RStudio on Ubuntu Linux.  As with Whitson Gordon's article on installing Crouton and Linux on Chromebook, we've replicated the steps here as I used them on my Chromebook to reduce the number of websites one must have open in order to follow the directions. We have also edited the instructions so they reference the most recent version of RStudio.

## Install R

As described in Kris Eberwein's article, we will install the most recent version of R versus the one that is available through the Ubuntu Software Center.

1. Add the R Repository to the `/etc/apt/sources.list` file by executing the following commands in a terminal window. <br>
        sudo echo "deb http://cran.rstudio.com/bin/linux/ubuntu xenial/" | sudo tee -a /etc/apt/sources.list
2. Add R to the Ubuntu Keyring by entering the following commands in a terminal window. <br>
        gpg --keyserver keyserver.ubuntu.com --recv-key E084DAB9
        gpg -a --export E084DAB9 | sudo apt-key add -
3. Update the application repository and install `r-base` and `r-base-dev` with the following terminal commands.
        sudo apt-get update
        sudo apt-get install r-base r-base-dev
The R installation will take 15 - 30 minutes depending on the speed of your machine and internet connection. The install will compile R from source, versus installing it from compiled modules as is the case with R on Windows or Mac OS X.

## Install RStudio

Since we're installing most of our software through the terminal window instead of the Ubuntu Software Center or the Synaptic Package Manager, we'll use the following commands to install RStudio.

        sudo apt-get install gdebi-core
        wget https://download1.rstudio.org/rstudio-0.99.896-amd64.deb
        sudo gdebi -n rstudio-0.99.896-amd64.deb

**NOTE:** Once RStudio is installed, we will need to run it with administrator privileges in order to install packages in the correct folders within the operating system.

## Test the Installation

To test the R installation, enter `sudo R` at a terminal prompt. THis will bring up an R session, into which one can execute R functions.

<img src="./images/misc-rOnChromebook09.png">

Here, we'll create a vector and calculate its mean.

<img src="./images/misc-rOnChromebook10.png">

So far, so good. to exit R, enter `quit()` at the R command prompt. Answer `n` when asked whether to save the workspace, and you will be returned to the terminal window.

Next, we'll test the RStudio. To start RStudio, we'll enter `sudo rstudio` in the terminal window. RStudio will display its four-paned user interface. To run a simple test, we'll create an R Markdown document by selecting it from the menu bar.

<img src="./images/misc-rOnChromebook11.png">

Next, we'll enter `Sample` as the title and `Sample` as the author. Leave HTML selected as the output format, and press the `<OK>` button.

<img src="./images/misc-rOnChromebook12.png">

RStudio automatically generates a simple markdown document based on the Motor Trend cars dataset that is part of the R `datasets` package. The markdown document generates a scatterplot of data from the `mtcars` dataset.

<img src="./images/misc-rOnChromebook13.png">

To execute the program, press the `<knit>` icon at the top of the code editor pane in the upper left quadrant of RStudio. From the  popup menu that displays, select `<Knit to HTML>` to start the process of generating the graph.

<img src="./images/misc-rOnChromebook14.png">

At this point RStudio may ask to install a number of packages that are required to knit the document. Press the `Yes` button to update these packages. Once the packages are updated, RStudio will knit the document.  

Enter `sample` as the name of the file when RStudio presents a file window, and then RStudio will generate an HTML document as listed below.

<img src="./images/misc-rOnChromebook15.png">

Congratulations! You now have a working version of RStudio installed on your Chromebook. 

# Step 4: Install R Packages

# Step 5: Register for Github and Connect with Local Git

# Using the System

## Setting Working Directory

## Storing Application Code

## Storing & Accessing Data

## Making it Work

### Size of Problems One Can Solve

### Runtime Performance

We ran two tests to check the performance of the Chromebook relative to other platforms on which I run RStudio. The first test was a run of an analysis conducted on data from the National Oceanographic and Atmospheric Administration regarding extreme weather events.

The output is an R Markdown document published to RPubs, [NOAA Storm Data Analysis -- Chromebook Version](http://bit.ly/2trj5RC). This version of the analysis runs in less than 2 minutes. Not bad for a data file that consumes over 500Mb of RAM in R.

The second test...

# Conclusion

At this point you've configured a professional operating system with leading tools for data science, including statistics, integration with Google Spreadsheets, and professional grade source code version control.

# Appendix

## Chromebook Hardware Specifications

We installed R and RStudio on an early model Chromebook that has what would be considered in 2017 the "minimal" level of compute power available on a Chromebook. As of 2017 one can purchase Chromebooks that have significantly more capacity than the HP 14-q010nr, if we can make the install work on this machine, we can be confident that it will work on any Chromebook, even those in use in middle and high schools in the U.S.

<table>
    <tr>
        <th>Computer</th>
        <th>Configuration</th>
    </tr>
    <tr>
        <td valign=top>HP Chromebook 14-q010nr</td>
        <td>
            <ul>
                <li>Operating system: Chrome OS</li>
                <li>Processor: 1.4GHz Intel Celeron 2955U Processor, two cores </li>
                <li>Memory: 2 gigabytes 1600Mhz DDR3L SDRAM</li>
                <li>Disk: 16 gigabytes, solid state drive</li>
                <li>Date built: November 2013</li>
            </ul>
        </td>
     </tr>
</table>

## References

[Installing Linux on Chromebook](https://lifehacker.com/how-to-install-linux-on-a-chromebook-and-unlock-its-ful-509039343)

[Installing R on Ubuntu Linux 16.04](https://www.r-bloggers.com/how-to-install-r-on-linux-ubuntu-16-04-xenial-xerus/)

[crouton Wiki](https://github.com/dnschneid/crouton/wiki)
