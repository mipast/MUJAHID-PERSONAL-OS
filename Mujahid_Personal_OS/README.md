# Mujahid Personal OS

A dark-mode, English-language, responsive personal productivity web app. It includes:
- Dashboard overview
- 30-day consistency tracker (2-hour / 30-minute / not logged)
- Task manager with priorities and completion
- Goal manager with progress and deadlines
- Journal and daily reviews
- Weekly activity snapshot and analytics
- Local JSON backup/restore and CSV task export
- PWA install support and basic offline shell caching
- Optional Supabase account + cloud workspace sync

## Run locally
1. Extract this ZIP.
2. Open `index.html` in a modern browser for basic local use.
3. For PWA/service-worker features, serve the folder from `localhost` or HTTPS. One easy option:
   - Install VS Code and the Live Server extension, then choose **Open with Live Server**.
   - Or use Python: `python -m http.server 8000`, then visit `http://localhost:8000`.
4. On Android Chrome, open the hosted HTTPS site and choose **Install app** / **Add to Home screen**.
5. On desktop Chrome/Edge, use the install icon in the address bar or browser menu.

## Data and backup
- By default, data is stored in this browser's local storage. It does not automatically move between devices.
- Use Settings & Backup → Export JSON backup regularly. Keep a copy in a safe place (for example, OneDrive plus a USB drive).
- Restore with the JSON file input. Restore replaces the current browser data.
- Task CSV export is also available.
- Do not clear browser data unless you have a backup.

## Optional cloud sync (Supabase)
Cloud sync is optional and requires setup by the app owner:
1. Create a Supabase project.
2. In Supabase → SQL Editor, run `supabase-schema.sql`.
3. In Project Settings → API, copy the Project URL and the **publishable/anon key**. Never use the `service_role` secret key in a browser app.
4. Host this app over HTTPS.
5. Open Settings & Backup, enter the URL and public key, then click Connect.
6. Choose Create account, confirm your email if required, then Sign in on each device.
7. Sign in on both devices to sync the same workspace.

**Important:** The current sync is a simple whole-workspace sync, not a conflict-merging engine. Before syncing devices with different unsynced changes, export a backup. If a newer cloud copy is detected, the app asks whether to load it; otherwise it uploads the local copy. Avoid editing the same workspace simultaneously on two devices.

## Security notes
- The Supabase publishable/anon key is designed for browser use when Row Level Security is configured correctly.
- Never put a Supabase service-role key in this app.
- Use a strong, unique password and enable email confirmation in Supabase Auth.
- Local browser data is not encrypted by this app. Protect your device account and backups.
- This is a personal productivity tool, not a guaranteed archival or enterprise backup system.

## Current limitations / next improvements
- Cloud sync is optional and must be configured; it is not active out of the box.
- PWA offline mode caches the app shell. Some external resources (Supabase JS and Google Fonts) need internet.
- Cloud sync is manual at sign-in / session initialization in this first release; a later release can add background sync, conflict resolution, scheduled backups, and push reminders.
