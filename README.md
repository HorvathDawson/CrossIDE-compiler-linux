# CrossIDE_compiler_linux
Derived from zacharyrodwatkins https://github.com/zacharyrodwatkins/CrossIDE


Welcome to assembly lets make your life a bit easier to you linux users
=======================================================================

first things first we need to install/check some dependencies
-------------------------------------------------------------
1. Make sure your locate command in shell is updated, `sudo updatedb && locate -e bench-repo`
2. Install wine with aptitude to help with dependecy tree on ubuntu 18.04
  i. `Sudo apt install aptitude`
  ii. `Sudo aptitude install wine-stable`
3. Install linux quartus lite (I am running v.19.1.0)
4. make sure the altera De0-cv board is being detected by external jtag
  i. to check plug in board to usb then navigate to /home/user/intelFPGA_lite/19.1/quartus/bin (or where ever quartus was installed) then run ./jtagconfig the output should look like the below picture.
  ii. if there is a issue with permission then run this command to fix the root acces to jtag `wget https://raw.githubusercontent.com/atomminer/QuartusTweaks/master/usbblaster.sh && chmod +x usbblaster.sh && ./usbblaster.sh`
  more info on the script can be found at this link, [link to webpage](https://blog.atomminer.com/fighting-altera-usb-blaster-on-ubuntu/)
  iii. furthermore, if you now have issues where the board recognizes the usb blaster name but says "Unable to read device chain - JTAG chain broken" then I havent found a fix to this issue yet except unplugging/replugging in, switching usb ports, turning device off with red button instead of usb. one of these will make it get recognized just test it with the jtagconfig file listed above.
5. use your IDE of choice to code assembly, I personally use atom and it has a few 8051 markups to make life nice.

Now that we have our device being detected on the computer clone this repo 
-------------------------------------------------------------------------
##after cloning
1. add source to bash for convience `echo 'source ~/path_to_folder/CrossIDE_compiler_linux/cross_utils.sh' >> ~/.bashrc `

compiling and flashing the code
--------------------------------
to compile the code open a terminal in the folder containing our *.asm file 
####important!! make sure the path to this file contains no spaces as winepaths wont be able to properly parse it.
now to compile your assembly files use the command,
`hexcompile filename.asm`
this will compile the *.asm file into a *.hex file inside the same directory, if their is a error the error message will be displayed in the terminal
now to flash your device, make sure it is connected with ./jtagconfig if it is good then use 
`flash filename.hex`
and voila no more cross IDE and your stuff works on linux without needing a shitty VM like virtual box (trust me you dont want to use it your computer will hate you)


  
  
