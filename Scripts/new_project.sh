#!/bin/bash

PROJECT_ROOT="$(cd "$(dirname "$0")/.." && pwd)"

PROJECTS_DIR="$PROJECT_ROOT/Projects"
TEMPLATE_DIR="$PROJECT_ROOT/Templates"

read -p "Enter project name: " PROJECT_NAME

FOLDER_NAME="${PROJECT_NAME// /-}"
PROJECT_PATH="$PROJECTS_DIR/$FOLDER_NAME"
README_FILE="$PROJECT_PATH/README.md"
PLAN_FILE="$PROJECT_PATH/plan.md"
RESOURCES_FILE="$PROJECT_PATH/ressources.md"

mkdir -p "$PROJECT_PATH"

create_file() {
    local FILE_PATH=$1
    local TEMPLATE_FILE=$2

    if [ ! -f "$FILE_PATH" ]; then
        if [ -f "$TEMPLATE_FILE" ]; then
            sed "s/{{project_name}}/$PROJECT_NAME/g" "$TEMPLATE_FILE" > "$FILE_PATH"
        fi
    fi
}

create_file "$README_FILE" "$TEMPLATE_DIR/project.md"

create_file "$PLAN_FILE" "$TEMPLATE_DIR/plan.md"

create_file "$RESOURCES_FILE" "$TEMPLATE_DIR/ressources.md"
