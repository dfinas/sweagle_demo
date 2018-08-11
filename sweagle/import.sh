#!/bin/bash
# find all YAML files in VARS directories
FILES=$(find $(pwd) -path "*vars*" -name "*.yml")
for f in $FILES
do
  # Remove current directory from filename
  file=${f#$(pwd)/}
  echo "**********************************************************"
  echo "Processing $file file..."
  # Calculate name of file replacing directories by .
  # for debug purpose echo cp "$f" "${f//\//.}"
  tempfile=${file//\//.}
  cp "$f" "$tempfile"
  #java -jar /opt/SWEAGLE/DataLoader.jar \
  #  --host https://testing.sweagle.com \
  #  --auth dfinas_testing:testtest \
  #  --autoApprove false \
  #  -s $tempfile

  # Remove temporary file
  #rm "$tempfile"
  echo "**********************************************************"
done

# sample command line
#find */ -type f -exec bash -c 'file=${1#./}; echo mv "$file" "${file//\//_}"' _ '{}' \;
