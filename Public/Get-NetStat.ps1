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
function Get-NetStat
{
    [CmdletBinding()]
    [Alias()]
    [OutputType([int])]
    Param
    (
        # Param1 help description
        [Parameter(Mandatory=$false,
                   ValueFromPipelineByPropertyName=$true,
                   Position=0)]
        [switch]$AllConnections,

        # Param2 help description
        [ValidateSet('TCP', 'UDP')]
        $ListeningProtocol


    )

    if ($ListeningProtocol)
    {
        switch($ListeningProtocol)
        {
            'TCP'   { Get-ActiveTcpListeners | Write-Output }
            'UDP'   { Get-ActiveUdpListeners | Write-Output }
            default { Get-ActiveTcpListeners | Write-Output
                      Get-ActiveUdpListeners | Write-Output }
        }
    }
    elseif ($AllConnections.IsPresent)
    {
        Get-ActiveTcpListeners | Write-Output
        Get-ActiveUdpListeners | Write-Output
        Get-ActiveTcpConnections | Write-Output
    }
    else
    {
        Get-ActiveTcpConnections | Write-Output
    }
}