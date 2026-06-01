# HTML Project

This repository contains a small HTML site with pages: `index.html`, `about.html`, `new.html`, and the `ai-generated-landing-page` folder.

Getting started

1. Install Git if you haven't already. On Windows you can use `winget install --id Git.Git -e --source winget`.
2. Initialize the repo (if needed):

```bash
cd "C:\Users\user\OneDrive\Desktop\HTML"
git init
```

3. Configure Git user (optional):

```bash
git config user.name "Your Name"
git config user.email "you@example.com"
```

4. Commit as you finish each section with meaningful messages. Example:

```bash
git add ai-generated-landing-page/index.html ai-generated-landing-page/style.css
git commit -m "feat(hero): add hero layout and styles"
```

Show git log with author emails:

```bash
git log --pretty=format:"%h %an <%ae> %ad %s" --date=short -n 100
```

Push to GitHub:

```bash
# create repo on GitHub, then
git remote add origin https://github.com/your-username/your-repo-name.git
git branch -M main
git push -u origin main
```
