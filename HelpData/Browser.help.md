# Browser

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Description

Launch web browsers or open websites directly from PowerShell.

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Available Commands

• B         Open a URL in your default browser.

• S         Search Google using one or more keywords.

• Gmail    Open Gmail.

• AI        Open ChatGPT.

• GH        Open GitHub.

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Examples

```powershell
# Open Google
B

# Open a website
B github.com

# Open a secure website
B https://openai.com

# Google Search
S powershell modules

S "python argparse"

# Quick shortcuts
Gmail

AI

GH
```

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Tips

✔ If no URL is provided, `B` opens Google.

✔ URLs without a protocol automatically use `http://`.

✔ `S` accepts multiple words and joins them into a Google search query.

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Related

Search

Apps

System
