#!/usr/bin/env bash
echo "Checking your project..."
test -f index.html && echo "PASS: index.html exists" || echo "FAIL: index.html missing"

# locate stylesheet in either root or ai-generated-landing-page
CSS_PATH=""
if [ -f style.css ]; then
	CSS_PATH="style.css"
elif [ -f ai-generated-landing-page/style.css ]; then
	CSS_PATH="ai-generated-landing-page/style.css"
fi

if [ -n "$CSS_PATH" ]; then
	echo "PASS: $CSS_PATH exists"
else
	echo "FAIL: style.css missing"
fi

grep -q 'style.css' index.html && echo "PASS: style.css is linked in index.html" || echo "FAIL: style.css not linked in index.html"
grep -Eiq 'hero' index.html && echo "PASS: a hero section is present" || echo "FAIL: no 'hero' found in index.html"
grep -Eiq 'feature' index.html && echo "PASS: a features section is present" || echo "FAIL: no 'features' found in index.html"
grep -Eiq 'cta|call-to-action|call to action' index.html && echo "PASS: a CTA section is present" || echo "FAIL: no CTA section found in index.html"
grep -Eiq '<footer' index.html && echo "PASS: a footer is present" || echo "FAIL: no <footer> found in index.html"
grep -Eiq '<section|<header|<nav|<main|<article' index.html && echo "PASS: semantic HTML5 tags used" || echo "FAIL: no semantic tags (section/header/nav/main) found"

if [ -n "$CSS_PATH" ]; then
	grep -Eiq 'display:[[:space:]]*flex|display:[[:space:]]*grid' "$CSS_PATH" && echo "PASS: Flexbox and/or Grid used" || echo "FAIL: no flex/grid layout found in $CSS_PATH"
	grep -Eiq '@media' "$CSS_PATH" && echo "PASS: a media query (responsive) is present" || echo "FAIL: no @media query found in $CSS_PATH"
else
	echo "SKIP: CSS layout/responsive checks (no stylesheet found)"
fi

echo "Check complete."
