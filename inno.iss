#define MyAppName "Databaser"
#define MyAppVersion "1.0"
#define MyAppPublisher "None"
#define MyAppURL "None"
#define MyAppExeName "databaser.exe"

[Setup]
AppId={{7C88D423-62A5-4DEF-B34E-2358D5CAB91D}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={autopf}\{#MyAppName}
UninstallDisplayIcon={app}\{#MyAppExeName}
ArchitecturesAllowed=x64compatible
ArchitecturesInstallIn64BitMode=x64compatible
DisableProgramGroupPage=yes
PrivilegesRequired=lowest
PrivilegesRequiredOverridesAllowed=dialog
OutputDir=dist
OutputBaseFilename=databaser
SetupIconFile=".\src\logo.ico"
SolidCompression=yes
WizardStyle=modern

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"
Name: "russian"; MessagesFile: "compiler:Languages\Russian.isl"

[Files]
Source: "dist\databaser\{#MyAppExeName}"; DestDir: "{app}"; Flags: ignoreversion
Source: "dist\databaser\logo.ico"; DestDir: "{app}"; Flags: ignoreversion
Source: "dist\databaser\_internal\*"; DestDir: "{app}\_internal\"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
Name: "{autoprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent
