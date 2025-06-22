#!/bin/bash

# Define API URL and output files
POKEMON="pikachu"
URL="https://pokeapi.co/api/v2/pokemon/$POKEMON"
OUTPUT_FILE="data.json"
ERROR_FILE="errors.txt"

# Make the API request
response=$(curl -s -w "%{http_code}" -o "$OUTPUT_FILE" "$URL")

# Check if the request was successful (status code 200)
if [ "$response" -ne 200 ]; then
    echo "[$(date)] Error fetching data for $POKEMON. Status code: $response" >> "$ERROR_FILE"
    rm -f "$OUTPUT_FILE"
else
    echo "Data for $POKEMON saved to $OUTPUT_FILE"
fi
