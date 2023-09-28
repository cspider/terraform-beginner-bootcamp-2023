#!/usr/bin/env bash

# Check if the TF_API_ACCESS_TOKEN environment variable is set
if [ -z "$TF_API_ACCESS_TOKEN" ]; then
  echo "Error: TF_API_ACCESS_TOKEN environment variable is not set."
  exit 1
fi

# Directory where the credentials file should be created
credentials_dir="$HOME/.terraform.d"
credentials_file="$credentials_dir/credentials.tfrc.json"

# Check if the file already exists
if [ -f "$credentials_file" ]; then
  echo "Credentials file already exists at: $credentials_file"
  exit 0
fi

# Create the credentials directory if it doesn't exist
mkdir -p "$credentials_dir"

# Create the credentials.tfrc.json file
cat <<EOF > "$credentials_file"
{
  "credentials": {
    "app.terraform.io": {
      "token": "$TF_API_ACCESS_TOKEN"
    }
  }
}
EOF

echo "Credentials file created at: $credentials_file"


