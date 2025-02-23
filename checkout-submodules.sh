#!/bin/bash

# This command will reset the submodules to the commit they were at when the last commit to the superproject was made.
git submodule update --recursive --checkout
