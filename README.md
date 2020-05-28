# Useful-Scripts-Algos

This repository features original scripts and algorithms that I find useful for automating repetitive tasks at work.

These scripts work by altering files directly on your computer. Please be sure to make backups of your files as some of this editing is destructive.

In order to run these scripts, please install Ruby using the instructions below.

***Windows:*** https://rubyinstaller.org/

***Mac:*** https://stackify.com/install-ruby-on-your-mac-everything-you-need-to-get-going/

<ins>**How to Use Clean Links**</ins>

This script is great for chopping off parts of links in bulk if those parts follow some predictable rule. For example, Amazon links copied directly from the product page have a "/ref" section that is useless, along with anything that comes after it. Links can also sometimes have UTM codes starting with a question mark. This script works by getting you to identify the beginning of the text that needs to be removed. Then, it goes through the CSV file containing all of your links and generates a new file of "clean" links without the text you identified or anything that comes after it. It takes seconds rather than you having to do it repetitively.

Using this tool is super simple:

1. Make sure you have Ruby installed on your computer.
2. Download this entire folder from Github. Make sure it is on your Desktop.
3. Open your computer's Terminal and enter the following:

**Windows:** cd c:\Users\your_username\Desktop\Useful-Scripts-Algos\Clean\ Links/

**Mac:** cd /Users/your_username/Desktop/Useful-Scripts-Algos/Clean\ Links/

4. Minimize the Terminal window and open the Useful-Scripts-Algos folder on your desktop and navigate to the Clean Links subfolder.
5. Clone the clean_links_template file. Inside it, add all of your "dirty" links under the "Links" column. Name the file something memorable.
6. Return to the Terminal window and type "ruby clean_links.rb"
7. Follow the on-screen prompts. Once it's all done, you'll have a file called "purged.csv" with your clean links.

Once you have this folder downloaded to your computer, you can simply use steps 3-7 whenever you need to run it.

**Common Mistakes**

If you type "ruby clean_links.rb" into Terminal and nothing seems to be happening, you may be in the wrong folder. Make sure you navigate to the correct folder's path using the instructions in step 3.

When following the on-screen prompts in the software, don't worry about typing the file extensions in. The script assumes you're dealing with CSVs.

Lastly, this tool won't work unless your links have a common identifiable portion that needs to be removed. The parts *after* that portion can be unique but there needs to be a common part.

Take this Amazon link, for example:

https://www.amazon.com/Steve-Madden-Softside-Suitcase-Collection/dp/B074KLTLVT/ref=sr_1_1?dchild=1&keywords=nicole+miller+luggage&qid=1590636361&sr=8-1

The **/ref** part needs to be removed, along with anything after it, to create a proper link. All Amazon links copied directly from the product page will look like this, meaning you can have thousands and thousands of them yet the Clean Links script will be able to clean them within seconds.

The same is true for links with UTM codes and **most** other types of links you would ever need to clean in a repetitive manner. If you're trying to clean links that are more "random," however, it won't work.
