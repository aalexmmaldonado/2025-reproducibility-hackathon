#!/bin/bash

(
# Ensure we are in the directory of this script.
cd "$(dirname "$0")"

# Define array of dataset URLs
declare -a DATASET_URLS=(
    "https://huggingface.co/datasets/browndw/human-ai-parallel-corpus"
    "https://huggingface.co/datasets/browndw/human-ai-parallel-corpus-biber"
    "https://huggingface.co/datasets/browndw/human-ai-parallel-corpus-spacy"
    "https://huggingface.co/datasets/browndw/coca-ai-parallel-corpus-biber"
)

# Set the target directory, default to ../data
TARGET_DIR="../data"

# Create the target directory if it doesn't exist
mkdir -p "$TARGET_DIR"

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo "Error: git is not installed. Please install git first."
    echo "On Ubuntu/Debian: sudo apt-get install git"
    echo "On MacOS: brew install git"
    exit 1
fi

# Check if git-lfs is installed
if ! command -v git-lfs &> /dev/null; then
    echo "Error: git-lfs is not installed. Please install git-lfs first."
    echo "On Ubuntu/Debian: sudo apt-get install git-lfs"
    echo "On MacOS: brew install git-lfs"
    echo "After installation, run: git lfs install"
    exit 1
fi

# Verify git-lfs is initialized
if ! git lfs install > /dev/null 2>&1; then
    echo "Error: git-lfs is not initialized. Running 'git lfs install'..."
    if git lfs install; then
        echo "Successfully initialized git-lfs"
    else
        echo "Failed to initialize git-lfs. Please check your installation."
        exit 1
    fi
fi

# Function to download a single dataset
download_dataset() {
    local dataset_url="$1"
    local dataset_name=$(basename "$dataset_url")
    local dataset_dir="$TARGET_DIR/$dataset_name"

    # Check if dataset directory already exists
    if [ -d "$dataset_dir" ]; then
        if [ -d "$dataset_dir/.git" ]; then
            echo "Dataset already exists: $dataset_name"
            echo "Pulling latest updates..."
            (cd "$dataset_dir" && git pull)
            if [ $? -eq 0 ]; then
                echo "✓ Successfully updated dataset in: $dataset_dir"
                return 0
            else
                echo "✗ Failed to update dataset: $dataset_name"
                return 1
            fi
        else
            echo "Directory exists but is not a git repository: $dataset_dir"
            echo "Backing up existing directory..."
            mv "$dataset_dir" "${dataset_dir}_backup_$(date +%Y%m%d_%H%M%S)"
            echo "Downloading dataset: $dataset_name"
            if git clone "$dataset_url" "$dataset_dir"; then
                echo "✓ Successfully downloaded dataset to: $dataset_dir"
                return 0
            else
                echo "✗ Failed to download dataset: $dataset_name"
                return 1
            fi
        fi
    else
        echo "Downloading dataset: $dataset_name"
        if git clone "$dataset_url" "$dataset_dir"; then
            echo "✓ Successfully downloaded dataset to: $dataset_dir"
            return 0
        else
            echo "✗ Failed to download dataset: $dataset_name"
            return 1
        fi
    fi
}

# Download all datasets
failed_downloads=()
successful_downloads=0
total_datasets=${#DATASET_URLS[@]}

echo "Starting download of $total_datasets datasets..."
echo "-------------------------------------------"

for url in "${DATASET_URLS[@]}"; do
    if download_dataset "$url"; then
        ((successful_downloads++))
    else
        failed_downloads+=("$url")
    fi
    echo "-------------------------------------------"
done

# Print summary
echo "Download Summary:"
echo "✓ Successfully downloaded: $successful_downloads datasets"
if [ ${#failed_downloads[@]} -gt 0 ]; then
    echo "✗ Failed downloads: ${#failed_downloads[@]} datasets"
    echo "Failed URLs:"
    printf '%s\n' "${failed_downloads[@]}"
fi
)
