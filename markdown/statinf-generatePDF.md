# Statistical Inference: Generating a PDF on Windows 10

Students in the Johns Hopkins University Data Science Specialization often struggle with installing the software that is necessary to generate documents in the Adobe PDF format as required for the two course projects.

One can create a PDF suitable for submission for the course project in three different ways, including:

1. Generate an HTML document with knitr, and then use a PDF printing tool like the Windows 10 built-in "Microsoft Print to PDF" printer driver or [CutePDF](http://cutepdf.com) to print the HTML document as a PDF,
2. Generate a Microsoft Word document with knitr, and save the Word document as a PDF using Word 2016+ or print the Word document as a PDF using Word 2013+ PDF print driver, or
3. Install a version of LaTeX that is appropriate for your operating system, and use knitr to directly generate PDF files.

For the purposes of this article, we will focus on alternative 3, specifically for the Windows 10 operating system.

## What Happens when MiKTeX Isn't Installed?

If a person tries to knit an R markdown document to PDF without a version of TeX installed on the machine, knitr generates the following error:

<img src="./images/installMikTeX01.png">

Step 1: Download the Complete MiKTeX

Navigate to the [MiKTeX download page](http://www.miktex.org/download). The page shows the *Recommended Download* for the basic version. Do not download this version. Instead, expand the *Other Downloads* section, and choose the net install.  Choose the 32-bit version if your computer runs the 32-bit version of Windows, and the 64-bit version if it runs the 64-bit version of Windows.

<img src="./images/installMikTeX02.png">

The browser will prompt for a directory in which to save the file. Navigate to the desired directory in the Save As dialog box, and save the file.

<img src="./images/installMikTeX03.png">

Once the file is downloaded, run the setup program, and it will display a Copying Conditions Agreement dialog box.

<img src="./images/installMikTeX04.png">


Read the Copying Conditions agreement, click the checkbox in the lower left corner of the dialog box, and press the `<Next>` button.

<img src="./images/installMikTeX05.png" >

The installer program will ask you to select a radio button to either download or install MiKTeX. Select the `download` radio button and then press the `Next` button.

<img src="./images/installMikTeX06.png" >

On the next dialog box, select the `Complete` radio button, and then the `Next` button.

<img src="./images/installMikTeX07.png" >

The next dialog box allows you to select a mirror site from which the software will be downloaded. Select an FTP or HTTP download site near you, and press the `Next` button.

<img src="./images/installMikTeX08.png" >

The next dialog box asks you to select a folder into which the MiKTeX software will be downloaded. Use the `Browse` button to open a File Manager window to navigate to the desired directory, and then press the `Next` button.

<img src="./images/installMikTeX09.png" >

Finally, the installer displays a review dialog box. Check to see that the file destination is accurate, then press the `Next` button.

<img src="./images/installMikTeX10.png" >

At this point, the installer begins downloading the application from the source mirror, and the next step is to wait, quite a while, because the download is about 200Mb.

<img src="./images/installMikTeX11.png" >

...and here we are, 30 minutes into the download process. As noted above, the download takes a long time!

<img src="./images/installMikTeX12.png" >

When the download completes, the download dialog enables the `Next` button. In my case, it took 1 hour 42 minutes, on an internet connection with 90mbps download speed.

<img src="./images/installMikTeX15.png" >

Press the `Next` button to complete the installation.

<img src="./images/installMikTeX13.png" >

At this point in the process, the final dialog appears.

<img src="./images/installMikTeX14.png" >

## Step 2: Install MiKTeX

Restart the installation software from the location where you downloaded it. As it did on for the download process, the installer displays the Copying Conditions Agreement. Select the checkbox and then press the `Next` button to continue.

<img src="./images/installMikTeX16.png" >

Select the radio button for the complete install, and then press the next button.

<img src="./images/installMikTeX17.png" >

Next, the installer asks whether MiKTeX should be accessible by all users or the current user on the machine where the installation is taking place. Select the `all users` radio button, and then press the `Next` button.

<img src="./images/installMikTeX18.png" >

Next, the installer allows you to specify a directory to which the MiKTeX software will be installed. If you want to install in a directory other than the default, either type the directory name in the text window, or select the `Browse` button to use File Manager to select a directory. Then press the `Next` button to continue.

<img src="./images/installMikTeX19.png" >

The next dialog allows you to set a preferred paper size, and to install missing packages. Select `Letter` and `Yes`and then press `Next`.

<img src="./images/installMikTeX20.png" >

The installer displays a summary dialog so you can review your selections. If you're satisfied with the entries you've made, press `Next` to start the installation. Otherwise press the `Back` button to return to the dialog whose values you want to change.
<img src="./images/installMikTeX21.png" >

The install process begins, and note that it will install over 113,000 files.

<img src="./images/installMikTeX22.png" >

Once the install process completes, press the `Next` button to continue.

<img src="./images/installMikTeX23.png" >

The installer displays the final dialog box indicating that the installation has completed. On my machine \(Intel i7 processor, solid state disk\), the install process took about 30 minutes.

Press the `Close` button to end the installation process.

<img src="./images/installMikTeX24.png" >

Restart RStudio, and knit an R markdown document to confirm that MiKTeX allows knitr to generate a PDF.

<img src="./images/installMikTeX25.png" >

...and the output from knitr.

<img src="./images/installMikTeX26.png" >

After a lot of time downloading code and watching the disk spin through the installation of MiKTeX on the local disk, we're now able to knit to PDF.

Have fun with your analyses!
