Import-Csv -Path .\new_users.csv |
foreach {
    $name = $_.name.Trim()    
    $Login = $_.Tname.Trim()
    $OU = $_.OU.Trim()
    $Title = $_.Title.Trim()
    $Company = $_.Company.Trim()

    $surname = ($name.Split(" "))[0]
    $givenname = ($name.Split(" "))[1]
    $patronymic = ($name.Split(" "))[2]
    $initial = $patronymic[0]

    $department = ($OU.Split(","))[0].Split("=")[1]    

    Write-Host "$company -> $department -> $name..."
    cd
    New-ADUser -Name "$name" `
    -SamAccountName "$Login" `
    -GivenName "$givenname" `
    -Surname "$surname" `
    -DisplayName "$name" `
    -UserPrincipalName "$login@moesk51.ru" `
    -EmailAddress "$login@moesk51.ru" `
    -Initials "$initial" `
    -Department "$department" `
    -Company "$Company" `
    -AccountPassword (ConvertTo-SecureString -AsPlainText "Abcd1234" -Force) `
    -Path "$OU" `
    -Title "$Title" `
    -Enabled $true `
    -ChangePasswordAtLogon $false `
    -PasswordNeverExpires $true
}