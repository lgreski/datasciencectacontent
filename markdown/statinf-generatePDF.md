# Statistical Inference: Generating a PDF on Windows 10

Students in the Johns Hopkins University Data Science Specialization often struggle with installing the software that is necessary to generate documents in the Adobe PDF format as required for the two course projects.

One can create a PDF suitable for submission for the course project in three different ways, including:

1. Generate an HTML document with knitr, and then use a PDF printing tool like [CutePDF](http://cutepdf.com) to print the HTML document as a PDF,
2. Generate a Microsoft Word document with knitr, and print the Word document as a PDF using Word 2013+ PDF print driver, or
3. Install a version of LaTeX that is appropriate for your operating system, and use knitr to directly generate PDF files.

For the purposes of this article, we will focus on alternative 3, specifically for the Windows 10 operating system.

## What Happens when MiKTeX Isn't Installed?

If a person tries to knit an R markdown document to PDF without a version of TeX installed on the machine, knitr generates the following error:

<img src="https://github.com/lgreski/datasciencectacontent/blob/master/markdown/images/installMikTeX01.png">

Step 1: Download the Complete MiKTeX

Navigate to the [MiKTeX download page](http://www.miktex.org/download). The page shows the *Recommended Download* for the basic version. Do not download this version. Instead, expand the *Other Downloads* section, and choose the net install.  Choose the 32-bit version if your computer runs the 32-bit version of Windows, and the 64-bit version if it runs the 64-bit version of Windows.

<img src="https://github.com/lgreski/datasciencectacontent/blob/master/markdown/images/installMikTeX02.png">

The browser will prompt for a directory in which to save the file. Navigate to the desired directory in the Save As dialog box, and save the file.

<img src="https://github.com/lgreski/datasciencectacontent/blob/master/markdown/images/installMiKTeX03.png">

Once the file is downloaded, run the setup program, and it will display a Copying Conditions Agreement dialog box.

<img src="https://github.com/lgreski/datasciencectacontent/blob/master/markdown/images/installMiKTeX04.png">


Read the Copying Conditions agreement, click the checkbox in the lower left corner of the dialog box, and press the `<Next>` button.

<img src="https://github.com/lgreski/datasciencectacontent/blob/master/markdown/images/installMiKTeX05.png" >

The installer program will ask you to select a radio button to either download or install MiKTeX. Select the `download` radio button and then press the `Next` button.

<img src="https://github.com/lgreski/datasciencectacontent/blob/master/markdown/images/installMiKTeX06.png" >

On the next dialog box, select the `Complete` radio button, and then the `Next` button.

<img src="https://github.com/lgreski/datasciencectacontent/blob/master/markdown/images/installMiKTeX07.png" >

The next dialog box allows you to select a mirror site from which the software will be downloaded. Select an FTP or HTTP download site near you, and press the `Next` button.

<img src="https://github.com/lgreski/datasciencectacontent/blob/master/markdown/images/installMiKTeX08.png" >

The next dialog box asks you to select a folder into which the MiKTeX software will be downloaded. Use the `Browse` button to open a File Manager window to navigate to the desired directory, and then press the `Next` button.

<img src="https://github.com/lgreski/datasciencectacontent/blob/master/markdown/images/installMiKTeX09.png" >

Finally, the installer displays a review dialog box. Check to see that the file destination is accurate, then press the `Next` button.

<img src="https://github.com/lgreski/datasciencectacontent/blob/master/markdown/images/installMiKTeX10.png" >

At this point, the installer begins downloading the application from the source mirror, and the next step is to wait, quite a while, because the download is about 200Mb.

<img src="https://github.com/lgreski/datasciencectacontent/blob/master/markdown/images/installMiKTeX11.png" >

When the download completes, the download dialog enables the `Next` button.

*stopped here while download completes...*
