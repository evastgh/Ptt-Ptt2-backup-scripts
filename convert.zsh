#!/usr/local/bin/zsh


for file in ./**/*(.) # recursively look for files
do
  if [ -f "$file" ]
  then
    iconv -f big5 -t utf-8//IGNORE "$file" > "${file}.txt" # //IGNORE makes iconv ignore characters it can't recognize as big5 and continue
    if [ $? -eq 0 ] # catching if iconv fails for any file
    then
      rm "$file" # if iconv succeeded, then remove the original file
      if [[ $1 =~ ^(-v|--verbose) ]]
      then
        echo "Converted $file from Big5 to UTF-8 encoding."
      fi
    else
      echo "Tried but failed to convert $file from Big5 to UTF-8 encoding."
    fi
  else
    echo "Skipped $file because not a file."
  fi
done
