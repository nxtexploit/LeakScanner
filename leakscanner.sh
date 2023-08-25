#!/bin/bash

display_banner() {
    echo -e "\e[33m    ○"
    echo "    │╲"
    echo "    │ ○   LeakScanner - Inspired by Gitleaks"
    echo "    ○ ░   Scan all GitHub Repositories at once"
    echo "    ░     Owner: nxtexploit                      "
    echo "          Version: 1.0                          "
}

display_banner

# Ask the user whether to scan an organization or a profile
read -p $'\e[32m\nScan Organization repositories (1) or User repositories (2)?\e[0m [1/2]: ' CHOICE

if [[ $CHOICE == "1" ]]; then
    # Ask the user to input the GitHub organization name
    read -p $'\e[32m\nTarget ORG username:\e[0m ' TARGET_NAME
    API_URL="https://api.github.com/orgs/${TARGET_NAME}/repos?per_page=1000"
else
    # Ask the user to input the GitHub user profile name
    read -p $'\e[32m\nTarget User username:\e[0m ' TARGET_NAME
    API_URL="https://api.github.com/users/${TARGET_NAME}/repos?per_page=1000"
fi

# Fetch repositories using the GitHub REST API
echo "Fetching repositories for ${TARGET_NAME}..."
REPO_URLS=$(curl -s ${API_URL} | grep -o "git://.*\.git" | tr ' ' '\n')

if [[ -z ${REPO_URLS} ]]; then
    echo "No repositories found for ${TARGET_NAME}."
    exit 1
fi

# Loop through the repository URLs and clone each repository
echo "Found $(echo ${REPO_URLS} | tr ' ' '\n' | wc -l) repositories."

for url in ${REPO_URLS}
do
    # Extract the repository name from the URL
    REPO_NAME=$(echo ${url} | sed 's#.*/\(.*\)\.git#\1#')
    
    # Clone the repository into a temporary directory
    echo "Cloning repository ${REPO_NAME} please wait..."
    git clone https://github.com/${TARGET_NAME}/${REPO_NAME}.git
    
    # Change directory to the repository
    echo "Changing directory to ${REPO_NAME}"
    cd ${REPO_NAME}
    
    # Scan the repository using Gitleaks
    echo -e "Scanning repository \e[32m${REPO_NAME}\e[0m using Gitleaks..."
    gitleaks detect -v
    
    # Go back to the previous directory
    echo "Going back to the previous directory..."
    cd ..
    
    # Delete the temporary directory
    echo "Deleting directory ${REPO_NAME}..."
    rm -rf ${REPO_NAME}
done
