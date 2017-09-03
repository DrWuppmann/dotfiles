import logging
import os
import subprocess

logger = logging.getLogger("main")

hostname = "empty"
cwd = "empty"

def init(_hostname, _cwd):
    # Setup the installer with any options necessary
    hostname = _hostname
    logger.debug("Hostname set to: "+hostname)
    cwd = _cwd
    logger.debug("Current Working Directory set to: "+cwd)

def install():
    # Set up pacaur and install packages
    # TODO Loop through packages list and run pacaur

def setupAURHelper():
    # Download and build pacaur
    logger.info("Setting up pacaur...")
    os.mkdirs("/tmp/pacaur_install")
    subprocess.check_call("")
    
def checkHostname():
    # Check, if hostname fits one of the package files, otherwise install base packages
    # If hostname was not defined (="empty"), do nothing

    if hostname == "empty":
        logger.error("Hostname was not defined! Error in way script is called!")
    else:
        targetFile = cwd + "/resources/aux/packages."+hostname
        if os.path.isFile(targetFile):
            logger.info("Additional package file found!")
        else:
            logger.info("No additional package file found, installing just base packages")
        # TODO Assemble package list, run setupAURHelper() and install()


#TODO install regular packages, setup pacaur and pac,  install AUR packages, vim plugins
