# 📝 Day 3 Linux User & Permissions Assignment

## 🌟 Overview
This README summarizes Day 3 Linux assignments covering:

- 👥 User & Group Management  
- 📂 Directory Structure  
- 🔒 Permissions & ACLs  
- 🛠️ Testing

> Switched to **root** to avoid entering the password repeatedly.

```bash
sudo su -

👥 TASK 1: User and Group Management
1️⃣ Create Users
useradd ram
useradd hari
useradd gita

2️⃣ Create Groups
groupadd devteam
groupadd deployers

3️⃣ Add Users to Groups
usermod -aG devteam ram
usermod -aG devteam hari
usermod -aG devteam gita
usermod -aG deployers deploy


✅ Users are now assigned to their respective groups.

📂 TASK 2: Directory Structure
Create Project Directories
mkdir -p /var/www/project/source
mkdir -p /var/www/project/logs
mkdir -p /var/www/project/scripts
mkdir -p /var/www/project/shared


Directory tree:

/var/www/project/
├── source
├── logs
├── scripts
└── shared

🔒 TASK 3: Permissions Setup
1️⃣ Source Directory (source/)

👨‍💻 Only devteam members can enter & modify

📂 SGID ensures new files inherit devteam group ownership

📝 Umask for devteam: 002

chgrp devteam /var/www/project/source
chmod 770 /var/www/project/source
chmod g+s /var/www/project/source

# Auto-umask for devteam members
cd /etc/profile.d
vi devteam-umask.sh

if id -nG "$USER" | grep -qw "devteam"; then
    umask 002
fi

2️⃣ Logs Directory (logs/)

🖊️ devteam members can append logs

🛡️ Sticky bit prevents deletion/modification by others

chgrp devteam /var/www/project/logs
chmod 775 /var/www/project/logs
chmod o+t /var/www/project/logs

3️⃣ Scripts Directory (scripts/)

⚙️ deploy.sh created by root

👤 Only deploy user can execute it

🔑 ACLs used because SUID is ineffective for shell scripts

setfacl -m u:deploy:rw /var/www/project/scripts/deploy.sh

4️⃣ Shared Directory (shared/)

📖 All devteam members can read & write

📂 SGID ensures files inherit devteam group ownership

chgrp devteam /var/www/project/shared
chmod 775 /var/www/project/shared
chmod g+s /var/www/project/shared

🛠️ TASK 4: Automatic umask

Already configured in Task 3.1

devteam members automatically get umask 002 on login

✅ TASK 5: Testing
1️⃣ Shared Folder Permissions

User ram can create files/folders

Ownership: group devteam

Permissions: 664 for files, 775 for directories

Result: ✅ TRUE

2️⃣ Logs Directory Restrictions

User gita cannot delete files created by ram

Result: ✅ TRUE

3️⃣ Script Execution

User deploy can execute deploy.sh even without ownership

ACLs used; Linux prevents posing as root for execution

Result: ✅ TRUE