# Globus DataFed Application

## Overview
This application manages data using Globus configuration and data paths. 

## Environment Setup

### Prerequisites
- Ensure you have the necessary permissions to access the data directories
- A display server should be available (for GUI applications)

### Environment Configuration
1. Create a `.env` file in the root directory of the project
2. Configure the following environment variables:

```env
# Data Paths
ConfigPath="E:\globus_data\config"  # Path to configuration directory
DataPath="E:\globus_data\data"      # Path to data directory

# Display Settings
DISPLAY=:0                          # Display server configuration

# Additional Paths
FILE_PATH=/home/                    # Base file path
```

You can modify these paths according to your system setup:
- For Windows: Use Windows-style paths (e.g., `E:\your\path`)
- For Linux/Mac: Use Unix-style paths (e.g., `/your/path`)

### Customizing Environment Variables
1. Open the `.env` file in a text editor
2. Update the paths to match your system's directory structure
3. Save the file

## Running the Application

### Globus container
- Build globus container
- docker build -t globus_container -f Dockerfile.globus-connect .
- docker run -it globus_container
- setup globus with login and endpoint

### Running whole application
- docker-compose up --build 

## Directory Structure 
```
├── .env # Environment configuration
├── globus_data/
│ ├── config/ # Configuration files
│ └── data/ # Data files
```


## Notes
- Ensure all paths in the `.env` file exist on your system
- The application requires a display server (`:0` is the default)
- Make sure you have appropriate read/write permissions for the configured directories

## Troubleshooting
- If you encounter path-related errors, verify the paths in your `.env` file
- For display issues, check if your display server is running and accessible
- Ensure all required directories exist and have proper permissions

---

