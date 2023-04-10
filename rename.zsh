#!/usr/local/bin/zsh

zmodload zsh/datetime

for file in ./**/M.*(.) # recursively look for files starting with "M." (likely the actual articles)
do
  if [ -f "$file" ]
  then
    alltitle=$(grep '標題' $file) # grep all lines containning 標題
    alldatetime=$(grep '時間' $file) # grep all lines containning 時間
    if [ $alltitle ] && [ $alldatetime ]
    then
      firsttitle=$(echo $alltitle | head -1) # only take the first line of $alltitle
      title=${firsttitle:4} # discard the first 4 characters "標題: "
      cleantitle=$(echo $title  | sed 's/\//／/g; s/\</＜/g; s/\>/＞/g; s/\:/：/g; s/\\/＼/g; s/\|/｜/g; s/\?/？/g; s/\*/＊/g') # find half-sized "/<>:\|?*" (illegal characters for file names) and replace with full-sized "／＜＞：＼｜？＊"
      firstdatetime=$(echo $alldatetime | head -1) # only the first line (the last publish time) of $alldatetime
      datetime=${firstdatetime:8} # discard the first 8 characters "時間: Xxx " where "Xxx" is the three characters for the day of the week
      datetime=$(gdate -d $datetime "+%Y-%m-%d %H-%M-%S")
      if [ $? -ne 0 ] # catch if gdate errs out
      then
        datetime="" # then forget about date, just rename the file to title
      fi
      directory=$(dirname $file) # get the directory of $file
      newfile=$directory"/"$datetime" "$cleantitle".txt" # $newfile is of the same directory as $file but with name "${datetime} ${cleantitle}.txt"
      cat $file > $newfile
      if [ $? -eq 0 ] # catch if cleantitle might still be bad
      then
        if [[ $1 =~ ^(-v|--verbose) ]]
        then
          echo "Converted $file to $newfile"
        fi
        rm "$file"
      else
        echo "Title \"${title}\" cleaned to \"${cleantitle}\" but still invalid. Skipped $file."
      fi
    else
      echo "Skipped $file due to invalid title or datetime."
    fi
  else
    echo "Skipped $file because not a file."
  fi
done
