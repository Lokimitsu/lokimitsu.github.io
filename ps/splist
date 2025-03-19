<#
.SYNOPSIS
    Retrieves detailed system information including RAM type, form factor, and other hardware details.

.DESCRIPTION
    This script gathers and displays various system information such as hostname, owner, serial number, 
    MAC addresses, operating system, CPU type, SSD size, RAM size, RAM type, screen resolution, and refresh rate.
    It uses CIM (Common Information Model) instances to query system hardware and software details.

.FUNCTIONS
    Get-RAM
        Determines the RAM type and form factor based on SMBIOSMemoryType and FormFactor properties.

.PARAMETERS
    None

.OUTPUTS
    [ordered] Hashtable
        Returns an ordered hashtable containing the following keys:
        - Hostname: The name of the computer.
        - Owner: The username of the current owner.
        - SerialNumber: The serial number of the system's BIOS.
        - LANMAC: The MAC address of the Ethernet adapter.
        - WLANMAC: The MAC address of the WLAN adapter.
        - OS: The name of the operating system.
        - CPUType: The name of the processor.
        - SSDSize: The total size of the SSD in GB, rounded to the nearest power of 2.
        - RAMSize: The total size of the RAM in GB.
        - RAMType: The type and form factor of the RAM.
        - Resolution: The screen resolution in the format "WidthxHeight".
        - RefreshRate: The maximum refresh rate of the video controller.

.NOTES
    - Requires administrative privileges to run.
    - Uses the `Get-CimInstance` cmdlet to query system information.
    - Assumes the presence of Ethernet and WLAN adapters for MAC address retrieval.

.EXAMPLE
    PS> .\Get-SPListDetails.ps1
    Returns a hashtable with detailed system information.

#>
function Get-RAM {
    $RAMType = switch ($PhysicalMemory.SMBIOSMemoryType) {
        0 { 'Typ: Unbekannt' }
        1 { 'Typ: Anderer' }
        2 { 'DRAM' }
        3 { 'Synchronous DRAM' }
        4 { 'Cache DRAM' }
        5 { 'EDO' }
        6 { 'EDRAM' }
        7 { 'VRAM' }
        8 { 'SRAM' }
        9 { 'RAM' }
        10 { 'ROM' }
        11 { 'Flash' }
        12 { 'EEPROM' }
        13 { 'FEPROM' }
        14 { 'EPROM' }
        15 { 'CDRAM' }
        16 { '3DRAM' }
        17 { 'SDRAM' }
        18 { 'SGRAM' }
        19 { 'RDRAM' }
        20 { 'DDR' }
        21 { 'DDR2' }
        22 { 'DDR2 FB-DIMM' }
        24 { 'DDR3' }
        25 { 'FBD2' }
        26 { 'DDR4' }
        34 { 'DDR5' }
        35 { 'DDR5' }
        36 { 'LPDDR' }
        37 { 'LPDDR2' }
        38 { 'LPDDR3' }
        39 { 'LPDDR4' }
        40 { 'LPDDR5' }
        41 { 'LPDDR5X' }
        42 { 'LPDDR6' }
        43 { 'LPDDR6X' }
        44 { 'LPDDR7' }
        45 { 'LPDDR7X' }
        default { 'RAM-Typ: Unbekannt' }
    }

    $RAMFormFactor = switch ($PhysicalMemory.FormFactor) {
        0 { 'Formfaktor: Unbekannt' }
        1 { 'Formfaktor: Anderer Typ' }
        2 { 'SIP' }
        3 { 'DIP' }
        4 { 'ZIP' }
        5 { 'SOJ' }
        6 { 'Proprietär' }
        7 { 'SIMM' }
        8 { 'DIMM' }
        9 { 'TSOP' }
        10 { 'PGA' }
        11 { 'RIMM' }
        12 { 'SODIMM' }
        13 { 'SRIMM' }
        14 { 'SMD' }
        15 { 'SSMP' }
        16 { 'QFP' }
        17 { 'TQFP' }
        18 { 'SOIC' }
        19 { 'LCC' }
        20 { 'PLCC' }
        21 { 'BGA' }
        22 { 'FPBGA' }
        23 { 'LGA' }
        24 { 'FB-DIMM' }
        25 { 'LAP' }
        26 { 'LGA 1156' }
        27 { 'LGA 1366' }
        28 { 'LGA 1567' }
        29 { 'PGA 988' }
        30 { 'BGA 1288' }
        31 { 'rPGA' }
        32 { 'BGA 1023' }
        33 { 'BGA 1224' }
        34 { 'BGA 1155' }
        35 { 'LGA 2011' }
        36 { 'FSBGA' }
        37 { 'LGA 1356' }
        38 { 'LGA 1150' }
        39 { 'BGA 1168' }
        40 { 'BGA 1364' }
        41 { 'dual in-line memory module (DIMM)' }
        42 { 'SO-DIMM' }
        43 { 'LGA 2011-3' }
        44 { 'DIMM 288-polig' }
        45 { 'SO-DIMM 260-polig' }
        46 { 'SO-DIMM 200-polig' }
        47 { 'SO-DIMM 204-polig' }
        48 { 'SO-DIMM 144-polig' }
        49 { 'SO-DIMM 72-polig' }
        50 { 'SO-DIMM 100-polig' }
        51 { 'SIMM 72-polig' }
        52 { 'SIMM 30-polig' }
        53 { 'SIMM 68-polig' }
        54 { 'SIMM 64-polig' }
        55 { 'SIMM 50-polig' }
        56 { 'SIMM 52-polig' }
        57 { 'SIMM 36-polig' }
        58 { 'SIMM 40-polig' }
        59 { 'SIMM 80-polig' }
        60 { 'SIMM 144-polig' }
        61 { 'SIMM 168-polig' }
        62 { 'SIMM 200-polig' }
        63 { 'SIMM 214-polig' }
        64 { 'SIMM 232-polig' }
        65 { 'SIMM 240-polig' }
        66 { 'SIMM 242-polig' }
        67 { 'SIMM 244-polig' }
        68 { 'SIMM 246-polig' }
        69 { 'SIMM 248-polig' }
        70 { 'SIMM 250-polig' }
        71 { 'SIMM 252-polig' }
        72 { 'SIMM 254-polig' }
        73 { 'SIMM 256-polig' }
        74 { 'SIMM 258-polig' }
        75 { 'SIMM 260-polig' }
        76 { 'SIMM 262-polig' }
        77 { 'SIMM 264-polig' }
        78 { 'SIMM 266-polig' }
        79 { 'SIMM 268-polig' }
        80 { 'SIMM 270-polig' }
        81 { 'SIMM 272-polig' }
        82 { 'SIMM 274-polig' }
        83 { 'SIMM 276-polig' }
        84 { 'SIMM 278-polig' }
        85 { 'SIMM 280-polig' }
        86 { 'SIMM 282-polig' }
        87 { 'SIMM 284-polig' }
        88 { 'SIMM 286-polig' }
        89 { 'SIMM 288-polig' }
        90 { 'SIMM 290-polig' }
        91 { 'SIMM 292-polig' }
        92 { 'SIMM 294-polig' }
        93 { 'SIMM 296-polig' }
        94 { 'SIMM 298-polig' }
        95 { 'SIMM 300-polig' }
        default { 'Formfaktor: Nicht definiert' }
    }

    return "$RAMType, $RAMFormFactor"
}

$ComputerSystem = Get-CimInstance -ClassName Win32_ComputerSystem
$PhysicalMemory = Get-CimInstance -ClassName Win32_PhysicalMemory | Select-Object -First 1
$VideoController = Get-CimInstance -ClassName Win32_VideoController
$NetAdapter = Get-NetAdapter

$allInfo = [ordered] @{
    Hostname     = $ComputerSystem | Select-Object -ExpandProperty Name
    Owner        = $ComputerSystem | Select-Object -ExpandProperty UserName
    SerialNumber = Get-CimInstance -ClassName Win32_BIOS | Select-Object -ExpandProperty SerialNumber
    LANMAC       = $NetAdapter | Where-Object { $_.Name -eq 'Ethernet' } | Select-Object -ExpandProperty MacAddress
    WLANMAC      = $NetAdapter | Where-Object { $_.Name -eq 'WLAN' } | Select-Object -ExpandProperty MacAddress
    OS           = Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object -ExpandProperty Caption
    CPUType      = Get-CimInstance -ClassName Win32_Processor | Select-Object -ExpandProperty Name
    SSDSize      = [System.Math]::Pow(2, [System.Math]::Ceiling([System.Math]::Log(((Get-Volume | Measure-Object -Property Size -Sum | Select-Object -ExpandProperty Sum) / 1GB), 2)))
    RAMSize      = [math]::Round(($PhysicalMemory | Measure-Object -Property Capacity -Sum | Select-Object -ExpandProperty Sum) / 1GB, 2)
    RAMType      = Get-RAM
    Resolution   = "$(($VideoController | Select-Object -First 1).CurrentHorizontalResolution)x$(($VideoController | Select-Object -First 1).CurrentVerticalResolution)"
    RefreshRate  = $VideoController | Select-Object -ExpandProperty MaxRefreshRate
}

$allInfo