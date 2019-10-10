param
(
    [string]$fileName = ".\benner.env"
)

foreach($line in Get-Content $fileName) 
{
    if ($line[0] -eq '#') { continue; }
    Set-Item -Path "Env:$($line.Split('=')[0])" -Value $line.Split('=')[1];
    Get-Item "Env:$($line.Split('=')[0])";
}