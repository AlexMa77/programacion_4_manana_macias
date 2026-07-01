$commits = @"
8bdb9dea3d764aed590bf100347b35b6e8a7cd94|2026-07-01T11:02:11-05:00|Clase 2026-07-01
7d861a758c73dc86914ba3025c338e9ec2275bc0|2026-07-01T11:05:20-05:00|Clase 2026-07-01
c0f67683ae13c660a74fceff26b97fd518df1c5c|2026-07-02T11:09:06-05:00|clase 2026-07-02
5d435f871c8df8b8c7215224219413c7189bc76d|2026-07-02T11:09:50-05:00|Clase 2026-07-02
a883f9809a289cf78787e94d205d5d62e39d922d|2026-07-06T09:46:35-05:00|flutter_shop_app checkpoint 01-06-07-2026
5c0ef2b3f6ca828f077e1275a05328bdb3a624cb|2026-07-06T10:03:36-05:00|flutter_shop_app checkpoint 02-06-07-2026
694284a52250a0e63f0b6a8914d78907073e8117|2026-07-06T10:16:10-05:00|flutter_shop_app checkpoint 03-06-07-2026
b860fe8ca2fb24e594f7e06b4e60042b99e9c728|2026-07-06T10:23:03-05:00|flutter_shop_app checkpoint 04-06-07-2026
93d9b97e161873c6b0d8deb196a82a92925cce1e|2026-07-06T10:37:41-05:00|flutter_shop_app checkpoint 05-06-07-2026
f212a46c48e281cdb6ca4f08798715cf7a591346|2026-07-06T10:46:56-05:00|flutter_shop_app checkpoint 06-06-07-2026
1170b7749e8c6d36896260379c7aace48cfad05d|2026-07-06T10:59:14-05:00|flutter_shop_app checkpoint 07-DASHBOARD-ACCESS-06-07-2026
79c2d89a26770aed73c7c0d341b05fc2d25e45d6|2026-07-08T09:28:09-05:00|SHOAPP CHECKPOINT 08-ADMIN-CATEGORIES 08-07-2026
4764cbfd7128931ff4d68efd28f80aba4e625e2a|2026-07-08T09:37:13-05:00|SHOAPP CHECKPOINT 09-ADMIN-PRODUCTS 08-07-2026
b7fe6f5a7843655cb6e56dccd8777d05de1d0152|2026-07-08T09:50:13-05:00|SHOAPP CHECKPOINT 10-ADMIN-ORDERS 08-07-2026
646cccebb84c6c09d5e6835fefaff2eb3d6a2592|2026-07-08T10:07:11-05:00|SHOAPP CHECKPOINT 11-ADMIN-USERS 08-07-2026
33ceaa40431a27081ebf36e51687d8ae78bff9f1|2026-07-08T11:21:10-05:00|SHOAPP CHECKPOINT 11-12-ADMIN-PROFLE-NOTIFICATIONS 08-07-2026
1833b07f02b767c721c598095aff75f77d685907|2026-07-09T11:03:27-05:00|Clase 2026-07-09
0f96db2068c1fb3544139f5893001c2b28aebacf|2026-07-09T11:05:53-05:00|Clase 2026-07-09
0a7e69dc14ed1e1dd8847381ca4fc68f254066a1|2026-07-09T11:11:58-05:00|Ignorar mi-app temporalmente
fd9efff6b5e4bbdc113373b563e248d66978e1b3|2026-07-09T11:15:20-05:00|Agregar proyecto mi-app completo
a0610ea85685b44c40595d1b44e21843c8a233f3|2026-07-09T11:17:25-05:00|Forzar agregar proyecto mi-app completo
50f1ea414294c68260b766a2d46c686351dcc797|2026-07-20T10:43:30-05:00|01-COMPONENTS FINISHED - 20-07-2026
"@

$lines = $commits -split "`n"
$repoName = "programacion_4_manana_gonzalez"

foreach ($line in $lines) {
    if ([string]::IsNullOrWhiteSpace($line)) { continue }
    $parts = $line.Trim().Split('|')
    $hash = $parts[0]
    $date = $parts[1]
    $msg = $parts[2]

    Write-Host "Processing $hash ($msg)..."

    # Get files changed
    $diff = git -C temp_repo diff-tree --no-commit-id --name-status -r $hash
    $diffLines = $diff -split "`n" | Where-Object { -not [string]::IsNullOrWhiteSpace($_) }

    $madeChanges = $false

    foreach ($dl in $diffLines) {
        $status = $dl.Substring(0,1)
        $file = $dl.Substring(1).Trim()

        # Skip unwanted files
        if ($file -match "node_modules" -or $file -match "\.dart_tool" -or $file -match "build/" -or $file -match "\.git/") {
            continue
        }

        # Create directory if needed
        $dir = Split-Path $file -Parent
        if (-not [string]::IsNullOrEmpty($dir) -and -not (Test-Path $dir)) {
            New-Item -ItemType Directory -Force -Path $dir | Out-Null
        }

        if ($status -eq 'D') {
            if (Test-Path $file) {
                Remove-Item -Force -Recurse $file
                $madeChanges = $true
            }
        } elseif ($status -eq 'A' -or $status -eq 'M') {
            try {
                cmd.exe /c "git -C temp_repo archive $hash ""$file"" | tar -x -C ."
                $madeChanges = $true
            } catch {
                Write-Host "Failed to extract $file"
            }
        }
    }

    git add .
    git reset temp_repo

    # Commit
    $env:GIT_AUTHOR_DATE = $date
    $env:GIT_COMMITTER_DATE = $date
    $env:GIT_AUTHOR_NAME = $repoName
    $env:GIT_AUTHOR_EMAIL = "$repoName@example.com"
    $env:GIT_COMMITTER_NAME = $repoName
    $env:GIT_COMMITTER_EMAIL = "$repoName@example.com"
    
    # Check if there are staged changes
    $statusCheck = git status --porcelain
    if ([string]::IsNullOrWhiteSpace($statusCheck)) {
        git commit --allow-empty -m "$msg"
    } else {
        git commit -m "$msg"
    }
}
Write-Host "Done!"
