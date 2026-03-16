# Deploy to Cloudflare Pages

This guide covers deploying the FazPeloZap landing page to **Cloudflare Pages** and pointing a custom domain to it.

No build step is required — Cloudflare Pages serves the static HTML files directly.

---

## Prerequisites

- A [Cloudflare account](https://dash.cloudflare.com/sign-up) (free tier is enough)
- The repository pushed to GitHub (`arpesam/fpz-landing-page`)

---

## 1. Create a Cloudflare Pages project

1. Log in to the [Cloudflare Dashboard](https://dash.cloudflare.com/)
2. Go to **Workers & Pages** → **Pages** → **Create a project**
3. Click **Connect to Git**
4. Authorize Cloudflare to access your GitHub account
5. Select the repository **`arpesam/fpz-landing-page`**
6. Click **Begin setup**

---

## 2. Configure the build settings

Since this is a plain HTML project with no build tool, use the following settings:

| Setting | Value |
|---|---|
| Production branch | `main` |
| Framework preset | `None` |
| Build command | *(leave empty)* |
| Build output directory | `/` (root) |

Click **Save and Deploy**.

Cloudflare will deploy the site and give you a URL like:
`https://fpz-landing-page.pages.dev`

---

## 3. Custom domain

### Option A — Domain already on Cloudflare (recommended)

If `fazpelozap.com.br` is already managed by Cloudflare DNS:

1. In the Pages project, go to **Custom domains** → **Set up a custom domain**
2. Enter `www.fazpelozap.com.br` and click **Continue**
3. Cloudflare adds the DNS record automatically
4. Click **Activate domain**

HTTPS is provisioned automatically — no extra steps needed.

---

### Option B — Domain managed by an external registrar

#### Step 1 — Add a CNAME record at your registrar

Log in to your domain registrar (e.g. Registro.br, GoDaddy, Namecheap) and add:

| Type  | Name  | Value |
|-------|-------|-------|
| CNAME | `www` | `fpz-landing-page.pages.dev` |

> **Apex domain (`fazpelozap.com.br` without www):** Most registrars don't support CNAME on the apex. Use your registrar's ALIAS/ANAME record if available, or transfer DNS management to Cloudflare (free) and use Option A.

#### Step 2 — Add the domain in Cloudflare Pages

1. In the Pages project, go to **Custom domains** → **Set up a custom domain**
2. Enter `www.fazpelozap.com.br` and click **Continue**
3. Cloudflare will verify the DNS record (can take up to 48 hours to propagate)
4. Once verified, HTTPS is provisioned automatically

---

## 4. Automatic deploys

Every `git push` to the `main` branch triggers a new deployment automatically. No manual action needed.

To preview changes before merging, push to any other branch — Cloudflare Pages creates a unique preview URL for each branch and pull request.

---

## 5. Rollback

To roll back to a previous deployment:

1. Go to **Workers & Pages** → your project → **Deployments**
2. Find the deployment you want to restore
3. Click the **⋯** menu → **Rollback to this deployment**

---

## Useful links

- [Cloudflare Pages docs](https://developers.cloudflare.com/pages/)
- [Custom domains on Cloudflare Pages](https://developers.cloudflare.com/pages/configuration/custom-domains/)
- [DNS checker](https://dnschecker.org) — verify DNS propagation
