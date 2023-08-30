<h1 align="center">
  <br>
  LeakScanner
  <br>
</h1>

<h4 align="center">Scan All GitHub Repositories at Once: Effortless Leak Detection</h4>


LeakScanner is a Bash script inspired by Gitleaks, that allows you to scan multiple GitHub repositories at once for sensitive information leaks like passwords, api keys, and tokens. It automates the process of cloning repositories and running the Gitleaks tool to detect potential leaks.

<h1 align="center">
  <br>
  <a href="https://github.com/nxtexploit/LeakScanner"><img src="https://i.imgur.com/QpYpp7J.png" alt="LeakScanner"></a>

</h1>

## Table of Contents

- [Features](#features)
- [Prerequisites](#prerequisites)
- [Usage](#usage)
- [Configuration](#configuration)
- [Contributing](#contributing)
- [License](#license)

## Features

- Scan both GitHub user profiles and organizations.
- Fetch up to 1000 repositories per scan (GitHub API limitation).
- Automatically clone all repositories and run Gitleaks to detect potential leaks.


## Prerequisites

To perform leak detection, you need to Install [GitLeaks](https://github.com/gitleaks/gitleaks#installing) first. In order to Install this:
1. Clone this repository to your local machine
    ```bash
    git clone https://github.com/gitleaks/gitleaks.git
    ```
2. Navigate to the cloned directory:
    ```bash
    cd gitleaks
    ```
3. Run this command:
    ```bash
    make build
    ```
Or follow the instructions on the [GitLeaks](https://github.com/gitleaks/gitleaks#installing) GitHub repository for your platform.

## Usage

1. Clone this repository to your local machine:

   ```bash
   git clone https://github.com/nxtexploit/LeakScanner.git
   ```
2. Navigate to the cloned directory:
    ```bash
    cd LeakScanner
   ```
3. Make the script executable:
    ```bash
    chmod +x leakscanner.sh
    ```
4. Run the script:
    ```bash
   ./leakscanner.sh
    ```
5. If you want to scan a **Organization account** then choose 1st options[1] of if want to scan a **Personal account** then choose the 2nd options[2]. And enter the username of your target. And it will detect all the sensitive info like passwords, api keys, and tokens and so on.


6. There are plenty of feature that you use after the scan over like [Verify Findings](https://github.com/gitleaks/gitleaks#verify-findings) and many more.
---
## Configuration

+ The script is interactive and will prompt you for the necessary inputs.
+ Make sure to review the script's source code to understand its behavior before using it.

## Contributing

Contributions are welcome! If you find any issues or have suggestions for improvements, feel free to open an issue or submit a pull request.

## License


This project is licensed under the [MIT License](LICENSE).

The MIT License is a permissive open source license that allows you to do almost anything with the code. It gives you the permission to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the software.



