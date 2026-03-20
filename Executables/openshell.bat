del "%systemdrive%\Program Files\Open-Shell\Skins\Immersive.skin" 
del "%systemdrive%\Program Files\Open-Shell\Skins\Immersive.skin7" 
del "%systemdrive%\Program Files\Open-Shell\Skins\Classic Skin.skin" 
del "%systemdrive%\Program Files\Open-Shell\Skins\Classic Skin.skin7" 
del "%systemdrive%\Program Files\Open-Shell\Skins\Full Glass.skin" 
del "%systemdrive%\Program Files\Open-Shell\Skins\Metallic.skin7" 
del "%systemdrive%\Program Files\Open-Shell\Skins\Metro.skin" 
del "%systemdrive%\Program Files\Open-Shell\Skins\Metro.skin7" 
del "%systemdrive%\Program Files\Open-Shell\Skins\Midnight.skin7" 
del "%systemdrive%\Program Files\Open-Shell\Skins\Smoked Glass.skin" 
del "%systemdrive%\Program Files\Open-Shell\Skins\Windows 8.skin" 
del "%systemdrive%\Program Files\Open-Shell\Skins\Windows 8.skin7" 
del "%systemdrive%\Program Files\Open-Shell\Skins\Windows Aero.skin" 
del "%systemdrive%\Program Files\Open-Shell\Skins\Windows Aero.skin7" 
del "%systemdrive%\Program Files\Open-Shell\Skins\Windows Basic.skin" 
del "%systemdrive%\Program Files\Open-Shell\Skins\Windows XP Luna.skin" 
copy /y "skin.skin" "%systemdrive%\Program Files\Open-Shell\Skins" 
copy /y "skin.skin7" "%systemdrive%\Program Files\Open-Shell\Skins" 
del "%systemdrive%\Program Files\Open-Shell\start screen.lnk" 
del "%systemdrive%\Program Files\Open-Shell\OpenShell.chm" 
del "%systemdrive%\Program Files\Open-Shell\OpenShellReadme.rtf" 
del "%systemdrive%\Program Files\Open-Shell\PolicyDefinitions.zip" 
del "%systemdrive%\Program Files\Open-Shell\Start Menu Settings.lnk" 
Reg.exe add "HKCU\Software\OpenShell\ClassicExplorer" /v "ShowedToolbar" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\OpenShell\ClassicExplorer" /v "NewLine" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\OpenShell\OpenShell" /v "LastUpdateTime" /t REG_DWORD /d "371152301" /f
Reg.exe add "HKCU\Software\OpenShell\StartMenu" /v "ShowedStyle2" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\OpenShell\StartMenu" /v "CSettingsDlg" /t REG_BINARY /d "36010000b50000000000000003000000aa0f00000000000000000000" /f
Reg.exe add "HKCU\Software\OpenShell\StartMenu" /v "OldItems" /t REG_BINARY /d "" /f
Reg.exe add "HKCU\Software\OpenShell\StartMenu" /v "ItemRanks" /t REG_BINARY /d "48534c430100000000000000ca72d704030000005078da013914000801000000d43fda014698a10b03000000bb43da01239e440d030000005b4dda0120f1440d0500000005b2da0142a9d20f010000006088da01af0a0d12160000006883da0112ae8a14010000006088da01d400a21401000000694dda0104c7ea1901000000a873da01a67ffb24010000004e6eda0190a363268000000008b2da018479722f020000005f4dda017f4fef2f7000000029b2da01aa307130010000000c88da01b0f1c83001000000c53cda0144cbd031140000005988da01b9f88134010000003846da012fb04239010000002243da010dd8bb3902000000b943da01278e673e020000001240da018c8ceb41040000007f82da012fec3c4501000000ca3fda01deeea04f080000003784da0115026a5003000000c47ada0144bc4657040000007288da019495135a02000000ff47da012fd3e15c0100000005b2da014e80c85e0700000003b2da01a8e9ed6105000000254dda01870dd463010000006088da0107fc1e64010000009548da01742e256507000000b486da01b6f3536601000000df85da018649d66b0b0000000fb2da01ae1b3a6d05000000474dda014cb9666d01000000963dda01fbe16c7601000000b843da012ca5637e270000000888da01fcbcd58114000000dc84da0120781785010000008e46da013304d18cc20000001b88da014896368f09000000ec7ada0166c9c89801000000207ada018467939ba2000000634dda01cd86fda101000000c14cda01e66883a20a0000004088da01f91b8ea76b00000006b2da01e7280fab0200000003b2da01615513b201000000b147da0141c467b5010000002e4dda016b9b76ba01000000bd7ada016e3439bb110000000088da011d87e5c1200000005488da011de6efc5010000001a72da01c9a4aecc080000003f47da01ab1c7dd101000000b943da010d3e7edd01000000604dda019bab6ee00d0000007188da01772cbae5040000000888da01a51b64ea010000008f44da01b262d1ec030000001b88da01e56985ee02000000ff47da01be2d91f10f0000004c7dda01060aacf1020000003747da01d0a7a8f301000000e285da011f76d4f9010000000c88da01" /f
Reg.exe add "HKCU\Software\OpenShell\StartMenu" /v "CEditMenuDlg7" /t REG_BINARY /d "fc010000f50100000000000000000000" /f
Reg.exe add "HKCU\Software\OpenShell\StartMenu\Settings" /v "Version" /t REG_DWORD /d "67371198" /f
Reg.exe add "HKCU\Software\OpenShell\StartMenu\Settings" /v "SkipMetro" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\OpenShell\StartMenu\Settings" /v "StartScreenShortcut" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\OpenShell\StartMenu\Settings" /v "SkinW7" /t REG_SZ /d "skin" /f
Reg.exe add "HKCU\Software\OpenShell\StartMenu\Settings" /v "SkinVariationW7" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\OpenShell\StartMenu\Settings" /v "SkinOptionsW7" /t REG_MULTI_SZ /d "DARK_MAIN=0\0METRO_MAIN=0\0LIGHT_MAIN=0\0AUTOMODE_MAIN=1\0DARK_SUBMENU=0\0METRO_SUBMENU=0\0LIGHT_SUBMENU=0\0AUTOMODE_SUBMENU=1\0SUBMENU_SEPARATORS=1\0DARK_SEARCH=0\0METRO_SEARCH=0\0LIGHT_SEARCH=0\0AUTOMODE_SEARCH=1\0SEARCH_FRAME=1\0SEARCH_COLOR=1\0SMALL_SEARCH=1\0MODERN_SEARCH=1\0SEARCH_HINT=1\0SEARCH_ITALICS=0\0NONE=1\0SEPARATOR=0\0TWO_TONE=0\0CLASSIC_SELECTOR=1\0HALF_SELECTOR=0\0CURVED_MENUSEL=1\0CURVED_SUBMENU=0\0SELECTOR_REVEAL=0\0TRANSPARENT=0\0OPAQUE_SUBMENU=0\0OPAQUE_MENU=0\0OPAQUE=1\0STANDARD=0\0SMALL_MAIN2=1\0SMALL_ICONS=0\0COMPACT_SUBMENU=1\0PRESERVE_MAIN2=0\0LESS_PADDING=1\0EXTRA_PADDING=0\024_PADDING=1\0LARGE_PROGRAMS=0\0TRANSPARENT_SHUTDOWN=0\0OUTLINE_SHUTDOWN=1\0BUTTON_SHUTDOWN=0\0EXPERIMENTAL_SHUTDOWN=0\0LARGE_FONT=0\0CONNECTED_BORDER=0\0FLOATING_BORDER=1\0LARGE_SUBMENU=0\0LARGE_LISTS=0\0THIN_MAIN2=1\0EXPERIMENTAL_MAIN2=1\0USER_IMAGE=1\0USER_OUTSIDE=0\0SCALING_USER=0\056=0\064=1\0TRANSPARENT_USER=0\0UWP_SCROLLBAR=0\0MODERN_SCROLLBAR=1\0OLD_ICONS=0\0NEW_ICONS=1\0SMALL_ARROWS=1\0ICON_FRAME=0\0SEARCH_SEPARATOR=0\0NO_PROGRAMS_BUTTON=0" /f
Reg.exe add "HKCU\Software\OpenShell\StartMenu\Settings" /v "MenuStyle" /t REG_SZ /d "Win7" /f
Reg.exe add "HKCU\Software\OpenShell\StartMenu\Settings" /v "PinnedPrograms" /t REG_SZ /d "PinnedItems" /f
Reg.exe add "HKCU\Software\OpenShell\StartMenu\Settings" /v "ShiftClick" /t REG_SZ /d "ClassicMenu" /f
Reg.exe add "HKCU\Software\OpenShell\StartMenu\Settings" /v "ShiftWin" /t REG_SZ /d "ClassicMenu" /f
Reg.exe add "HKCU\Software\OpenShell\StartMenu\Settings" /v "ShiftRight" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\OpenShell\StartMenu\Settings" /v "ControlPanelCategories" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\OpenShell\StartMenu\Settings" /v "OpenPrograms" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\OpenShell\StartMenu\Settings" /v "RecentPrograms" /t REG_SZ /d "None" /f
Reg.exe add "HKCU\Software\OpenShell\StartMenu\Settings" /v "EnableJumplists" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\OpenShell\StartMenu\Settings" /v "HighlightNew" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\OpenShell\StartMenu\Settings" /v "EnableAccessibility" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\OpenShell\StartMenu\Settings" /v "EnableContextMenu" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\OpenShell\StartMenu\Settings" /v "EnableExit" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\OpenShell\StartMenu\Settings" /v "FontSmoothing" /t REG_SZ /d "Default" /f
Reg.exe add "HKCU\Software\OpenShell\StartMenu\Settings" /v "MenuItems7" /t REG_MULTI_SZ /d "Item1.Command=user_files\0Item1.Settings=NOEXPAND\0Item2.Command=separator\0Item3.Command=user_documents\0Item3.Settings=NOEXPAND\0Item4.Command=user_pictures\0Item4.Settings=ITEM_DISABLED\0Item5.Command=user_music\0Item5.Settings=ITEM_DISABLED\0Item6.Command=user_videos\0Item6.Settings=NOEXPAND\0Item7.Command=downloads\0Item7.Settings=NOEXPAND\0Item8.Command=homegroup\0Item8.Settings=ITEM_DISABLED\0Item9.Command=games\0Item9.Settings=TRACK_RECENT|NOEXPAND|ITEM_DISABLED\0Item10.Command=favorites\0Item10.Settings=ITEM_DISABLED\0Item11.Command=recent_documents\0Item11.Settings=ITEM_DISABLED\0Item12.Command=computer\0Item12.Settings=NOEXPAND\0Item13.Command=network\0Item13.Settings=ITEM_DISABLED\0Item14.Command=network_connections\0Item14.Settings=ITEM_DISABLED\0Item15.Command=separator\0Item16.Command=pc_settings\0Item16.Settings=TRACK_RECENT\0Item17.Command=control_panel\0Item17.Settings=TRACK_RECENT|NOEXPAND\0Item18.Command=admin\0Item18.Settings=TRACK_RECENT|NOEXPAND\0Item19.Command=devices\0Item19.Settings=ITEM_DISABLED\0Item20.Command=defaults\0Item20.Settings=ITEM_DISABLED\0Item21.Command=help\0Item21.Settings=ITEM_DISABLED\0Item22.Command=run\0Item23.Command=apps\0Item23.Settings=ITEM_DISABLED\0Item24.Command=windows_security\0Item24.Settings=ITEM_DISABLED" /f
Reg.exe add "HKCU\Software\OpenShell\StartMenu\Settings" /v "MinMainHeight" /t REG_DWORD /d "24" /f
taskkill /f /im StartMenuExperienceHost.exe 
cd %systemdrive%\Windows\SystemApps\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy 
takeown /f "StartMenuExperienceHost.exe" 
icacls "%systemdrive%\Windows\SystemApps\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy\StartMenuExperienceHost.exe" /grant Administrators:F 
ren StartMenuExperienceHost.exe StartMenuExperienceHost.old 
sc stop wsearch 
taskkill /f /im searchapp.exe 
taskkill /f /im SearchHost.exe 
cd %systemdrive%\Windows\SystemApps\MicrosoftWindows.Client.CBS_cw5n1h2txyewy 
takeown /f "SearchHost.exe" 
icacls "%systemdrive%\Windows\SystemApps\MicrosoftWindows.Client.CBS_cw5n1h2txyewy\SearchHost.exe" /grant Administrators:F 
ren SearchHost.exe SearchHost.old 