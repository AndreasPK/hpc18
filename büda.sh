#!/bin/bash

R < roofline-mars-10tall.r --no-save
R < roofline-mars-80tall.r --no-save
R < roofline-mars-10tmarked.r --no-save
R < roofline-mars-80tmarked.r --no-save
