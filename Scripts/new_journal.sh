#!/bin/bash

PROJECT_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
NOTES_DIR="$PROJECT_ROOT/Journal"
TEMPLATE_FILE="$PROJECT_ROOT/Templates/journal.md"
TODAY=$(date +"%Y-%m-%d")
JOURNAL_FILE="$NOTES_DIR/$TODAY.md"

mkdir -p "$NOTES_DIR"

if [ ! -f "$JOURNAL_FILE" ]; then
    if [ -f "$TEMPLATE_FILE" ]; then
        sed "s/{{date}}/$TODAY/g" "$TEMPLATE_FILE" > "$JOURNAL_FILE"
   fi
fi
