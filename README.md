# 🌳 Tree display

## 📄 Description

`tree_display` is a Bash script that generates a directory tree structure and saves it to a file named `tree.txt`. The script excludes specified directories, limits the number of displayed elements, and provides a clear and organized view of the directory contents.

## ✨ Features

- **Excludes specified directories**: Easily exclude directories like `venv` from the tree structure.
- **Limits displayed elements**: Display up to 5 elements per directory, with an option to show more if needed.
- **Customizable output**: Adjust the maximum number of elements displayed and the file where the tree is saved.

## 📚 Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [Example Output](#example-output)


## 🛠️ Installation

To use `tree_display`, simply clone the repository and make the script executable:

```bash
git clone https://github.com/your_username/tree_display.git
cd tree_display
chmod +x tree_display.sh
```

## 🚀 Usage

Run the script from the command line to generate the directory tree:

```bash
./tree_display.sh
```

The script will create a file named tree.txt in the current directory, containing the tree structure.

## ⚙️ Script Options

- EXPORT_FILE: The name of the file where the tree structure is saved (default: tree.txt).
- LIMIT: The maximum number of elements displayed per directory (default: 5).
- MAX_DISPLAY: The threshold for displaying the continuation message ([...]) (default: 15).
- EXCLUDE_DIR: The directory to exclude from the tree structure (default: venv).

## 📝 Example Output

Here is an example of the output saved in tree.txt:

```bash
project
    ├── src
    │   ├── main.py
    │   ├── utils.py
    │   └── [...]
    ├── tests
    │   ├── test_main.py
    │   └── [...]
    └── README.md
```
