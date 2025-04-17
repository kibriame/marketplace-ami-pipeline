#!/bin/bash
set -euxo pipefail

echo "🔧 Fixing CentOS 7 repository with vault.centos.org..."

# Backup original repo if it exists
if [ -f /etc/yum.repos.d/CentOS-Base.repo ]; then
  sudo cp -v /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.bak
fi

# Replace the base repo with CentOS 7.9 vault
sudo tee /etc/yum.repos.d/CentOS-Base.repo > /dev/null <<EOF
[base]
name=CentOS-7.9.2009 - Base
baseurl=http://vault.centos.org/7.9.2009/os/\$basearch/
gpgcheck=1
enabled=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7

[updates]
name=CentOS-7.9.2009 - Updates
baseurl=http://vault.centos.org/7.9.2009/updates/\$basearch/
gpgcheck=1
enabled=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7

[extras]
name=CentOS-7.9.2009 - Extras
baseurl=http://vault.centos.org/7.9.2009/extras/\$basearch/
gpgcheck=1
enabled=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
EOF

# Clean and regenerate YUM cache
sudo yum clean all
sudo yum makecache fast

echo "✅ Vault repo fix applied successfully!"
