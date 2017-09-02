# Imports
import logging
# TODO Create Files in home directory directly, not symlinking, issues with branching

confTarget = ""

# Setup Logging
logger = logging.getLogger("main")

def init(target):
    confTarget=target

def combineFiles(*args):
    # Combine files
    for file in args:
        logger.debug(file)
        
def ranger():
    # Generate ranger config file(s)
    # Needed: ./resources/config/ranger.base + Shortcuts
    logger.info("Creating ranger config files...")
    # Target: ./out/ranger.conf
def aliases():
    # Generate alias file, which is sourced by bashrc and zshrc
    # Needed: Shortcuts
    logger.info("Creating alias source file...")
    # Target: ./out/aliases

def i3():
    # Generate i3 Config file
    # Needed: ./resources/config/i3/i3.base + [...]/i3.hostname
    logger.info("Creating i3 config file...")
    # Target: ./out/i3-config
    # Symlinked to: ~/.config/i3/i3-config

