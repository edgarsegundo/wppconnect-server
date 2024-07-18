#!/bin/bash

# Find the process using port 21465
PID=$(sudo lsof -t -i :21465)

# Check if a process was found
if [ -z "$PID" ]; then
  echo "No process found using port 21465."
else
  # Kill the process
  echo "Killing process $PID using port 21465."
  sudo kill -9 $PID

  # Verify the process has been killed
  if [ $? -eq 0 ]; then
    echo "Process $PID has been killed."
  else
    echo "Failed to kill process $PID."
  fi
fi
