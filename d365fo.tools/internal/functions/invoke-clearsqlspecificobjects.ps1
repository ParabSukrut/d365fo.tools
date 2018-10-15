﻿<#
.SYNOPSIS
Clear SQL Server (on-premises) specific objects

.DESCRIPTION
Clears all the objects that can only exists inside a SQL Server (on-premises) instance or disable things that will require rebuilding on the receiving system

.PARAMETER DatabaseServer
The name of the database server

If on-premises or classic SQL Server, use either short name og Fully Qualified Domain Name (FQDN)

If Azure use the full address to the database server, e.g. server.database.windows.net

.PARAMETER DatabaseName
The name of the database

.PARAMETER SqlUser
The login name for the SQL Server instance

.PARAMETER SqlPwd
The password for the SQL Server user

.PARAMETER TrustedConnection
Should the connection use a Trusted Connection or not

.EXAMPLE
PS C:\> Invoke-ClearSqlSpecificObjects -DatabaseServer localhost -DatabaseName ExportClone -SqlUser User123 -SqlPwd "Password123"

This will execute all necessary scripts against the "ExportClone" database that exists in the localhost SQL Server instance.
It uses the SQL credential "User123" to preform the needed actions.

.NOTES
Author: Rasmus Andersen (@ITRasmus)
Author: Mötz Jensen (@Splaxi)

#>
Function Invoke-ClearSqlSpecificObjects {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseSingularNouns", "")]
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param (
        [Parameter(Mandatory = $true)]
        [string] $DatabaseServer,

        [Parameter(Mandatory = $true)]
        [string] $DatabaseName,

        [Parameter(Mandatory = $false)]
        [string] $SqlUser,

        [Parameter(Mandatory = $false)]
        [string] $SqlPwd,
        
        [Parameter(Mandatory = $false)]
        [boolean] $TrustedConnection
    )
    
    $sqlCommand = Get-SQLCommand @PsBoundParameters

    $commandText = (Get-Content "$script:ModuleRoot\internal\sql\clear-sqlbacpacdatabase.sql") -join [Environment]::NewLine

    $sqlCommand.CommandText = $commandText

    try {
        $sqlCommand.Connection.Open()

        $null = $sqlCommand.ExecuteNonQuery()

        $true
    }
    catch {
        Write-PSFMessage -Level Host -Message "Something went wrong while working against the database" -Exception $PSItem.Exception
        Stop-PSFFunction -Message "Stopping because of errors" -StepsUpward 1
        return
    }
    finally {
        if ($sqlCommand.Connection.State -ne [System.Data.ConnectionState]::Closed) {
            $sqlCommand.Connection.Close()
        }

        $sqlCommand.Dispose()
    }
}