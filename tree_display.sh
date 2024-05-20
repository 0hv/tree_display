#!/bin/bash

# Constants
EXPORT_FILE="tree.txt"
LIMIT=5
MAX_DISPLAY=15
EXCLUDE_DIR="venv"

# Function to display the directory tree
display_tree() {
  local prefix="$1"
  local dir="$2"
  local indent="${3:-}"
  local last="${4:-1}"

  # Exclude the specified directory
  if [[ "$dir" == *"$EXCLUDE_DIR"* ]]; then
    echo "Excluding directory: $dir" >> "$EXPORT_FILE"
    return
  fi

  echo "${indent}${prefix} $(basename "$dir")" >> "$EXPORT_FILE"
  ((DIRECTORIES++))

  indent="$indent$(test $last == 1 && echo '    ' || echo '│   ')"

  local elements=()
  mapfile -t elements < <(find "$dir" -maxdepth 1 -mindepth 1 -not -path "*$EXCLUDE_DIR*" -not -name '.*')

  local count=${#elements[@]}
  local i=0

  if ((count > MAX_DISPLAY)); then
    elements=("${elements[@]:0:LIMIT}")
    elements+=("[...]")
  fi

  for element in "${elements[@]}"; do
    ((i++))
    test $i == ${#elements[@]} && local last=1 || local last=0
    if [[ "$element" == "[...]" ]]; then
      echo "${indent}└── ${element}" >> "$EXPORT_FILE"
    elif [[ -d "$element" ]]; then
      display_tree "└──" "$element" "$indent" $last
    elif [[ -f "$element" ]]; then
      echo "${indent}└── $(basename "$element")" >> "$EXPORT_FILE"
      ((FILES++))
    fi
  done
}

# Main script
main() {
  local DIRECTORIES=0
  local FILES=0

  display_tree "" "$(pwd)"

  echo "Tree structure created in '$EXPORT_FILE'."
  echo "It contains $DIRECTORIES directories and $FILES files."
}

main "$@"
