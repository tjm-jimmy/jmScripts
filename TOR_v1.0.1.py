#!/usr/bin/python
# -*- coding: utf-8 -*-
import os
    
import sys

test_path="/Users/jmokwena/Desktop/Machines.db"

con = lite.connect('$test_path')

with con:
    
    cur = con.cursor()    
    cur.execute('SELECT * FROM Cars')
    
    col_names = [cn[0] for cn in cur.description]
    
    rows = cur.fetchall()
    
    print "%s %-10s %s" % (col_names[0], col_names[1], col_names[2])

    for row in rows:    
        print "%2s %-10s %s" % row