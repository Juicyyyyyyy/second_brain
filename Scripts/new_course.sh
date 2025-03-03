#!/bin/bash

PROJECT_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
NOTES_DIR="$PROJECT_ROOT/Notes"
TEMPLATE_FILE="$PROJECT_ROOT/Templates/course.md"


read -p "Enter the subject of the course: " COURSE_SUBJECT
read -p "Enter the name of the course: " COURSE_NAME

COURSE_FOLDER="$NOTES_DIR/$COURSE_SUBJECT"

TODAY=$(date +"%Y-%m-%d")
COURSE_FILE="$COURSE_FOLDER/$COURSE_NAME.md"

mkdir -p "$COURSE_FOLDER"

if [ ! -f "$JOURNAL_FILE" ]; then
    if [ -f "$TEMPLATE_FILE" ]; then
        sed "s/{{date}}/$TODAY/g; s/{{course-name}}/$COURSE_NAME/g" "$TEMPLATE_FILE" > "$COURSE_FILE"
   fi
fi
