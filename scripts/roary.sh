#!/bin/bash

# Directory containing GFF files
GFF_DIR="/home/asus/Desktop/Test_Docker/gff_commercial"

# Get the directory where the script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Output directory for Roary
OUTPUT_DIR="${SCRIPT_DIR}/roary_output"

# Create output directory if it doesn't exist
mkdir -p "${OUTPUT_DIR}"

# Start the Docker command
DOCKER_CMD="docker run --rm -it -v ${GFF_DIR}:/data -v ${OUTPUT_DIR}:/output sangerpathogens/roary roary -e --mafft -p 8 -f /output"

# Loop over GFF files and append them to the Docker command
for GFF_FILE in ${GFF_DIR}/*.gff; do
    DOCKER_CMD+=" /data/$(basename ${GFF_FILE})"
done

# Execute the Docker command
echo "Running command: $DOCKER_CMD"
eval $DOCKER_CMD

