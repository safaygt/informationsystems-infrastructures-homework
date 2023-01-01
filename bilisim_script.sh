#!/bin/bash

# Set the directory to be monitored
directory="/home/safa/private/enter"

# Set the interval (in seconds) at which the directory will be checked for changes
interval=10

# Set the file to which the names of modified files will be written
log_file="/home/safa/degisim.txt"

# Run an infinite loop to continuously monitor the directory
while true; do
  # Find all files in the directory that have been modified in the last minute
  modified_files=$(find "$directory" -maxdepth 1 -mmin -1)
  # Find all files in the directory that have been deleted in the last minute
  deleted_files=$(find "$directory" -maxdepth 1 -mmin -1 -type f ! -newerat 1)



  # If there are any modified files, write the names of the modified files to the log file
  if [ -n "$modified_files" ]; then
    echo "The following files have been modified or deleted in the last 1 minutes:" >> "$log_file"
    echo "$modified_files" >> "$log_file"
  fi

  echo "Date: $(date)" >> /home/safa/degisim.txt
  echo "" >> /home/safa/degisim.txt
  
 

  # Sleep for the specified interval before checking for changes again
    sleep "$interval"
done
