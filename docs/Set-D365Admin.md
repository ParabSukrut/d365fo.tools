﻿---
external help file: d365fo.tools-help.xml
Module Name: d365fo.tools
online version:
schema: 2.0.0
---

# Set-D365Admin

## SYNOPSIS
Powershell implementation of the AdminProvisioning tool

## SYNTAX

```
Set-D365Admin [-AdminSignInName] <String> [[-DatabaseServer] <String>] [[-DatabaseName] <String>]
 [[-SqlUser] <String>] [[-SqlPwd] <String>] [-EnableException] [<CommonParameters>]
```

## DESCRIPTION
Cmdlet using the AdminProvisioning tool from D365FO

## EXAMPLES

### EXAMPLE 1
```
Set-D365Admin "claire@contoso.com"
```

This will provision claire@contoso.com as administrator for the environment

## PARAMETERS

### -AdminSignInName
Email for the Admin

```yaml
Type: String
Parameter Sets: (All)
Aliases: Email

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DatabaseServer
The name of the database server

If on-premises or classic SQL Server, use either short name og Fully Qualified Domain Name (FQDN)

If Azure use the full address to the database server, e.g.
server.database.windows.net

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: $Script:DatabaseServer
Accept pipeline input: False
Accept wildcard characters: False
```

### -DatabaseName
The name of the database

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: $Script:DatabaseName
Accept pipeline input: False
Accept wildcard characters: False
```

### -SqlUser
The login name for the SQL Server instance

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: $Script:DatabaseUserName
Accept pipeline input: False
Accept wildcard characters: False
```

### -SqlPwd
The password for the SQL Server user

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: $Script:DatabaseUserPassword
Accept pipeline input: False
Accept wildcard characters: False
```

### -EnableException
This parameters disables user-friendly warnings and enables the throwing of exceptions
This is less user friendly, but allows catching exceptions in calling scripts

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
Author: Rasmus Andersen (@ITRasmus)
Author: Mötz Jensen (@Splaxi)

## RELATED LINKS
