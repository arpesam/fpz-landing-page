# FazPeloZap — Landing Page

Static landing page for [FazPeloZap](https://www.fazpelozap.com.br), hosted on GitHub Pages.

## Files

```
index.html      — Main landing page
privacy.html    — Privacy policy (Política de Privacidade)
terms.html      — Terms of service (Termos de Uso)
CNAME           — Custom domain configuration for GitHub Pages
```

---

## Deploy to GitHub Pages

### 1. Push to GitHub

```bash
git add .
git commit -m "chore: initial landing page"
git push origin main
```

### 2. Enable GitHub Pages

1. Go to your repository on GitHub
2. Click **Settings** → **Pages**
3. Under **Source**, select **Deploy from a branch**
4. Choose branch **`main`** and folder **`/ (root)`**
5. Click **Save**

GitHub will publish the site at:
`https://<your-username>.github.io/<repository-name>/`

---

## Custom Domain

### 1. CNAME file

The `CNAME` file in the root of this repo already contains the custom domain:

```
www.fazpelozap.com.br
```

Update it to match your actual domain if needed.

### 2. DNS configuration

Log in to your domain registrar and add the following DNS records:

#### Option A — `www` subdomain (recommended)

| Type  | Name  | Value                    |
|-------|-------|--------------------------|
| CNAME | `www` | `<your-username>.github.io` |

#### Option B — Apex domain (`fazpelozap.com.br`)

Add all four GitHub Pages A records pointing to the apex domain:

| Type | Name | Value          |
|------|------|----------------|
| A    | `@`  | `185.199.108.153` |
| A    | `@`  | `185.199.109.153` |
| A    | `@`  | `185.199.110.153` |
| A    | `@`  | `185.199.111.153` |

> For both apex + www, add the A records above **and** a CNAME for `www`.

### 3. Configure in GitHub Pages settings

1. Go to **Settings** → **Pages**
2. Under **Custom domain**, type your domain (e.g. `www.fazpelozap.com.br`)
3. Click **Save**
4. Check **Enforce HTTPS** once the certificate is issued (can take up to 24 hours)

### DNS propagation

DNS changes can take up to **48 hours** to propagate globally. You can check the status at [dnschecker.org](https://dnschecker.org).
