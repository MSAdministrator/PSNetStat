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
function Convert-NetStatRemoteEndpoint
{
    [CmdletBinding()]
    [Alias()]
    [OutputType([string])]
    Param
    (
        # Param1 help description
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$true,
                   Position=0)]
        $Address,

        # Param2 help description
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$true,
                   Position=1)]
        [int]$Port
    )

    Write-Verbose -Message 'Formatting RemoteEndPoint Address'

    if ($Address -eq '127.0.0.1' -or $Address -eq '0.0.0.0')
    {
        $endpointName = "$($env:COMPUTERNAME)"
    }
    else
    {
        $endpointName = $Address
    }

    Write-Verbose -Message 'Formatting RemoteEndPoint Port'

    if ($Port -eq '80')
    {
        $endpointPort = 'http'
    }
    elseif ($Port -eq '443')
    {
        $endpointPort = 'https'
    }
    else
    {
        $endpointPort = $Port
    }
    
    Write-Output "$($endpointName):$($endpointPort)"

}