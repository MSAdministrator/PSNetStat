<#
.Synopsis
   Short description
.DESCRIPTION
   Long description
.EXAMPLE
   Example of how to use this cmdlet
.EXAMPLE
   Another example of how to use this cmdlet
#>
function Get-ActiveTcpListeners
{
    [CmdletBinding()]
    [Alias()]
    [OutputType([string])]
    Param
    ()

    $networkObject = [System.Net.NetworkInformation.IPGlobalProperties]::GetIPGlobalProperties()

    $networkObject.GetActiveTcpListeners() | ForEach-Object {
        $props = [PSCustomObject]@{
            Protocol          = 'TCP'
            'Local Address'   = "$($_.get_Address().IPAddressToString):$($_.get_Port())"
            'Foreign Address' = Convert-NetStatRemoteEndpoint -Address $_.get_address().IPAddressToString -Port $_.get_Port()
            State             = 'LISTENING'
        }
        Write-Output $props
    }
}