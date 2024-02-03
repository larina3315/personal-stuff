Name:           usb-storage-sync
Version:        1.0.0
Release:        1%{?dist}
Summary:        Mounts USB Storage devices as "sync" by default.

License:        MIT
#URL:            

Source0:        %{name}-%{version}.tar.gz

#BuildRequires:  
#Requires:       cp

%description
Adds an udev rule so USB Storage devices like external HDDs and pendrives are mounted with the "sync" option by default. This fixes the issue of most linux utilities showing that copying/writing to the drive has finished, while infact, it has not.

%prep
%autosetup

%install
rm -rf $RPM_BUILD_ROOT
mkdir -p $RPM_BUILD_ROOT%{_prefix}/lib/udev/rules.d/
cp 10-usb-storage-sync.rules $RPM_BUILD_ROOT%{_prefix}/lib/udev/rules.d/

%clean
rm -rf $RPM_BUILD_ROOT

%files
%{_prefix}/lib/udev/rules.d/10-usb-storage-sync.rules

%changelog
* Sat Feb 03 2024 Larina Loriasel
- Initial Release
