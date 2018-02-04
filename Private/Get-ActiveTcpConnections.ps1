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
function Get-ActiveTcpConnections
{
    [CmdletBinding()]
    [Alias()]
    [OutputType([string])]
    Param
    ()

    $networkObject = [System.Net.NetworkInformation.IPGlobalProperties]::GetIPGlobalProperties()

    $networkObject.GetActiveTcpConnections() | ForEach-Object {
        $props = [PSCustomObject]@{
            Protocol          = 'TCP'
            'Local Address'   = $_.LocalEndPoint 
            'Foreign Address' = Convert-NetStatRemoteEndpoint -Address $_.RemoteEndPoint.get_address().IPAddressToString -Port $_.RemoteEndPoint.get_Port()
            State             = $_.State
        }
        Write-Output $props
    }
}