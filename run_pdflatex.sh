#!/bin/bash 

texfile="niw_thesis"
if [ $# -eq 1 ]; then
 texfile=$1
fi

if [ -d ./out/ ]; then
   
  echo "./out/     directory found"
  echo "Compiling file: $texfile"
  echo ""
  
  #   
  #  
  #   
  pdflatex --output-directory=out $texfile 
  bibtex ./out/$texfile  
  # 
  # for glossaries ((  if needed  ))
  makeglossaries -d ./out/ $texfile 
   
  #
  # Rule is run twice to get all references and label to be correct
  #
  pdflatex --output-directory=out $texfile  && pdflatex --output-directory=out $texfile  

else
  
  echo "mkdir out ; # so compiled files will be in separate directory"
  
fi