🏢 Unisafe - University Incident Reporting System

Unisafe is a Flutter-based mobile and web application that allows students to anonymously report incidents like ragging, smoking, or harassment within university campuses. It provides a secure and streamlined platform for both students and administrators to manage campus safety effectively.

🚀 Features

👨‍🎓 Student Side

Anonymous incident reporting

Upload photo, description, location, and timestamp

User-friendly interface

👨‍💼 Admin Side (Web and App)

Admin authentication via email/password (Supabase Auth)

Dashboard view of all reported incidents

View reports with photo, description, time, and location

Delete handled reports

Update profile name via bottom sheet

Real-time updates using Supabase Realtime

🧰 Tech Stack

Flutter: Cross-platform app development

Supabase:

Auth: Admin login

Database: Report storage

Storage: Image upload

Google Fonts: Beautiful custom fonts

Shared Preferences: Auto-login persistence for admins

📋 How to Run

Clone the repository:

git clone https://github.com/your-username/unisafe.git
cd unisafe

Create .env file in assets/.env:

SUPABASE_URL=your_supabase_url
SUPABASE_API=your_supabase_anon_key

Run Flutter packages:

flutter pub get

Run the app:

flutter run

🎥 Demo Video

Uploading soon... (Will include screen recording of app workflow, student report creation, and admin panel management)

Or record it using:

OBS Studio (desktop screen)

Scrcpy or Android emulator for Android app view

Combine clips in CapCut, VN Editor, or Kinemaster

🙏 Credits

Built by Rathod Kuldeep as part of MSc IT Semester 1 Final Project.

✨ Future Enhancements

Notification to admins on new reports

Allow students to view report status (resolved/pending)

Map integration to display exact report location

🎉 License

This project is licensed under the MIT License.

For any feedback, contribution or collaboration, feel free to open issues or pull requests.

some add details

