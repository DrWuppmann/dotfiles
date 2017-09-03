# Imports
import argparse
import logging
import os
import socket

from src import FileGenerator

processPackages = True;
processConfig = True;

cwd = os.getcwd()
testenv = cwd + "/testenv"
confTarget = os.path.expanduser("~")
pkgs = []

# argparse
parser = argparse.ArgumentParser(description="Initial System Setup")

verbosity = parser.add_mutually_exclusive_group()
verbosity.add_argument("-v", "--verbose", help="Prints information in Addition to writing logs", action="store_true")
verbosity.add_argument("-q", "--quiet", help="No information printed to screen, no logs written", action="store_true")

mode = parser.add_mutually_exclusive_group()
mode.add_argument("-p", "--packages", help="Only install the packages, do not create configs", action="store_true", default=False)
mode.add_argument("-c", "--config", help="(Re)create config files, do not try to install packages", action="store_true", default=False)

parser.add_argument("-t", "--target", help="Specifiy the hostname of the target instead of using system hostname", action="store", default="hostname")
parser.add_argument("-d", "--dry", help="Do not write changes to regular file location, instead outputs to dotfiles/test-home", action="store_true")

args = parser.parse_args()


# Setup Logging
logger = logging.getLogger("main")
logger.setLevel(logging.DEBUG)
ch = logging.StreamHandler()
if args.verbose:
    ch.setLevel(logging.DEBUG)
elif args.quiet:
    ch.setLevel(logging.ERROR)
else:
    ch.setLevel(logging.INFO)

formatter = logging.Formatter('%(name)s - %(levelname)s - %(message)s')
ch.setFormatter(formatter)
logger.addHandler(ch)

# Process Arguments
## --dry: Place config files in subfolder of cwd, not in the actual system
if args.dry:
    # Disable installation of packages
    processPackages = False;
    # Create and set test environment
    if not os.path.exists(testenv): os.makedirs(testenv)
    confTarget = testenv
    
# Functions
def installPackages(path):
    logger.info("Processing package file")
    # Read package file
    with open(path, "r") as pkgfile:
        for pkg in pkgfile:
            pkg = pkg.strip()
            if not (pkg == "" or pkg[0] == "#"):
                # Remove empty lines
                logger.info("Installing packages " + pkg)
                # TODO Install packages


# Identify System via hostname (?)
logger.info("Trying to identify system...")

hostname = args.target

if hostname=="hostname":
    logger.info("Target not provided, using system hostname")
    hostname = socket.gethostname()
    logger.info("Fetched Hostname: " + hostname)
else:
    logger.info("Provided Target: " + hostname)

# Search for files with required extension
if args.packages and not args.dry:
    logger.info("Setting up packages...")
    PackageInstaller.init(hostname)
    PackageInstaller.run()
# Trigger FileGenerator accordingly
if args.config or not args.packages:
    logger.info("Creating config files...")
    logger.debug("Running FG.init")
    FileGenerator.init(confTarget)
    logger.debug("Running FG.ranger")
    FileGenerator.ranger()
    logger.debug("Running FG.aliases")
    FileGenerator.aliases()
    logger.debug("Running FG.i3")
    FileGenerator.i3()

# Trigger Package Install Scripts/AUR Building

## basic packages

## AUR Helper Setup

## AUR Packages

## vim plugins


