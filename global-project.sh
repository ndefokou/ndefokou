#!/bin/bash

echo "Welcome to the global project initialization script"
echo "**********************************************"

echo "Enter the project name you want to carry out:"
read project_name

echo "Enter the starter file name and extension:"
read file_name_extension

# Create the project directory
project_dir=~/Desktop/"$project_name"
mkdir -p "$project_dir"

echo "Great! You have decided to carry out the $project_name project."
echo "*********************************************"

# Create the starter file
if [[ -d "$project_dir" ]]; then
    touch "$project_dir/$file_name_extension"
    echo "$file_name_extension file created successfully."

    # Check if the file extension is .py
    if [[ "$file_name_extension" == *.py ]]; then

        # Create a virtual environment using venv and activate it
        python3 -m venv "$project_dir/venv"
        source "$project_dir/venv/bin/activate"
        echo "Virtual environment created and activated."
        echo "Enter a tool you would like to install in your virtual environment:"
        read tool
        pip install "$tool"
    fi

    # Generate README with run instructions
    readme_file="$project_dir/README.md"
    snake_case_name=$(echo "$project_name" | sed -E 's/[^[:alnum:]]+/_/g' | tr '[:upper:]' '[:lower:]')
    echo "# $project_name" > "$readme_file"
    echo "" >> "$readme_file"
    echo "## Running the project" >> "$readme_file"
    echo "" >> "$readme_file"
    echo "To run the project, follow these steps:" >> "$readme_file"
    echo "" >> "$readme_file"
    echo "1. Navigate to the project directory:" >> "$readme_file"
    echo "   \`cd $project_dir\`" >> "$readme_file"
    echo "" >> "$readme_file"
    echo "2. Activate the virtual environment (if applicable):" >> "$readme_file"
    echo "   \`source venv/bin/activate\`" >> "$readme_file"
    echo "" >> "$readme_file"
    echo "3. Run the project:" >> "$readme_file"
    echo "   \`./$file_name_extension\`" >> "$readme_file"
    echo "" >> "$readme_file"
    echo "That's it! The project will now run." >> "$readme_file"
else
    echo "Failed to create the project directory."
fi

echo "**********************************************"
