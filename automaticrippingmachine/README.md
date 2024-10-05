
# Automatic Ripping Machine (ARM) Add-on for Home Assistant

## Overview

This add-on integrates the **Automatic Ripping Machine (ARM)** with Home Assistant. It allows you to automate the ripping of Blu-ray/DVD discs and manage media files with full configurability. The add-on leverages the official ARM Docker image.

## Features

- **Automated Ripping**: Automatically rips Blu-ray/DVDs when inserted.
- **Configurable**: All paths and settings (media directories, notifications, etc.) are configurable via the Home Assistant UI.
- **Plex Integration**: Easily direct ripped media to your Plex media directories.
- **Notification Support**: Supports notifications via email or webhooks on success or failure.

## Installation

### 1. Create the Add-on Directory

On your Home Assistant OS system, navigate to the `addons` directory and create a new folder for this add-on:

```bash
mkdir -p /addons/automatic_ripping_machine
```

### 2. Add the Required Files

Create the following files in the `automatic_ripping_machine` directory:

- `config.yaml`
- `Dockerfile`
- `run.sh`
- `README.md` (this file)

### 3. Add the Add-on Repository to Home Assistant

1. Open Home Assistant in your browser.
2. Go to **Supervisor** > **Add-on Store**.
3. Click on the **⋮** (three dots) in the top right corner, then **Repositories**.
4. Add the local add-on repository path (e.g., `/addons`).
5. The **Automatic Ripping Machine** add-on should now appear in the Add-on Store.

### 4. Install and Configure the Add-on

1. Locate the **Automatic Ripping Machine** add-on in the Add-on Store.
2. Click on **Install**.
3. After installation, go to the **Configuration** tab to set the media directories and notification preferences.
4. Start the add-on and insert a disc to test.

## Configuration

The add-on is fully configurable via the Home Assistant UI. Available options include:

- **Timezone**: Set your local timezone.
- **Media Directory**: Path to the base media directory (e.g., `/mnt/media`).
- **Movies, Music, and TV Directories**: Specific directories for movies, music, and TV shows.
- **Debug Mode**: Enable or disable debug mode.
- **Log Level**: Set the log level (`debug`, `info`, `warning`, `error`).
- **Notification Settings**: Configure email or webhook notifications for ripping success or failure.

### Example Configuration:

```yaml
timezone: "America/New_York"
media_dir: "/mnt/media"
movies_dir: "/mnt/media/movies"
music_dir: "/mnt/media/music"
tv_dir: "/mnt/media/tv"
debug: false
log_level: "info"
notify_on_success: true
notify_on_failure: true
notify_method: "email"
email_recipient: "your_email@example.com"
email_sender: "arm@example.com"
email_server: "smtp.example.com"
email_port: 587
email_username: "smtp_user"
email_password: "smtp_password"
```

## Usage

### Access the Web UI

Once the add-on is installed and running, you can access ARM's web interface via Home Assistant:

1. Go to **Supervisor** > **Automatic Ripping Machine** > **Open Web UI**.
2. You can also directly access it via `http://[YOUR_HA_IP]:5800`.

### Insert a Disc and Start Ripping

When you insert a Blu-ray/DVD disc into the drive, ARM should automatically detect it and start the ripping process based on your configuration.

Monitor progress and adjust settings in the web UI.

## Troubleshooting

- **Device Not Detected**: Ensure the Blu-ray/DVD drive is properly connected and accessible by Home Assistant.
- **Permissions Issues**: Ensure Home Assistant has the correct permissions to write to your NAS or media directories.
- **Notification Failures**: Double-check SMTP or webhook settings if you aren't receiving notifications.
- **Check Logs**: Access the logs in the add-on panel for debugging information.
