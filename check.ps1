Write-Output "Checking your project..."
if (Test-Path index.html) { "PASS: index.html exists" } else { "FAIL: index.html missing" }

# locate stylesheet in either root or ai-generated-landing-page
$cssCandidates = @("style.css", "ai-generated-landing-page\style.css")
$cssPath = $cssCandidates | Where-Object { Test-Path $_ } | Select-Object -First 1
if ($cssPath) { "PASS: $cssPath exists" } else { "FAIL: style.css missing" }

if (Select-String -Path index.html -Pattern 'style.css' -Quiet) { "PASS: style.css is linked in index.html" } else { "FAIL: style.css not linked in index.html" }
if (Select-String -Path index.html -Pattern 'hero' -Quiet) { "PASS: a hero section is present" } else { "FAIL: no 'hero' found in index.html" }
if (Select-String -Path index.html -Pattern 'feature' -Quiet) { "PASS: a features section is present" } else { "FAIL: no 'features' found in index.html" }
if (Select-String -Path index.html -Pattern 'cta|call-to-action|call to action' -Quiet) { "PASS: a CTA section is present" } else { "FAIL: no CTA section found in index.html" }
if (Select-String -Path index.html -Pattern '<footer' -Quiet) { "PASS: a footer is present" } else { "FAIL: no <footer> found in index.html" }
if (Select-String -Path index.html -Pattern '<section|<header|<nav|<main|<article' -Quiet) { "PASS: semantic HTML5 tags used" } else { "FAIL: no semantic tags (section/header/nav/main) found" }

if ($cssPath) {
	if (Select-String -Path $cssPath -Pattern 'display:\s*(flex|grid)' -Quiet) { "PASS: Flexbox and/or Grid used" } else { "FAIL: no flex/grid layout found in $cssPath" }
	if (Select-String -Path $cssPath -Pattern '@media' -Quiet) { "PASS: a media query (responsive) is present" } else { "FAIL: no @media query found in $cssPath" }
} else {
	"SKIP: CSS layout/responsive checks (no stylesheet found)"
}

"Check complete."
