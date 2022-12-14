# Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
# SPDX-License-Identifier: MIT-0

$src_code=$args[0]
$build_path=$args[1]
$output_name=$args[2]

if ( ($src_code -eq '')      -or ($src_code -eq $null) )      { Write-Host "src_code is undefined.";      exit 1 }
if ( ($build_path -eq '')    -or ($build_path -eq $null) )    { Write-Host "build_path is undefined.";    exit 1 }
if ( ($output_name -eq '')   -or ($output_name -eq $null) )   { Write-Host "output_name is undefined.";   exit 1 }

Write-Host "Building $src_code into $build_path"

if (Test-Path $build_path) {
    Write-Host "$build_path exists. Skip create."
}
else {
    Write-Host "Creating $build_path"
    mkdir $build_path
}

Remove-Item -Recurse -Force $build_path\*

mkdir $build_path\tmp_building -ErrorAction 0 | Out-Null

Copy-Item -Recurse $src_code\* $build_path\tmp_building

pip install -r $build_path\tmp_building\requirements.txt -t $build_path\tmp_building\. | Out-Null

Add-Type -assembly "system.io.compression.filesystem"
[io.compression.zipfile]::CreateFromDirectory("$build_path\tmp_building", "$build_path\$output_name")

Remove-Item -Recurse -Force $build_path\tmp_building

Write-Host "Build done!"