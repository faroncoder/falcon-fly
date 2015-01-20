#!/bin/bash
 dvgrab -noavc -format dv2 -guid 1 - | ffplay -
exit 0
