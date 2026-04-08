---
description: Run PageSpeed Insights (Lighthouse) against any URL and report scores.
---

Run Google PageSpeed Insights against a URL and report results.

## Arguments

The user MUST provide a URL. Example: `/lighthouse https://example.com`

If no URL is provided, ask the user for one. Do NOT hardcode any default URL.

## Step 1 — Resolve the API key

Try these sources in order:

1. **Environment variable:** `$PSI_API_KEY`
2. **`.dev.vars` file** in the current working directory: line starting with `PSI_API_KEY=`

```bash
PSI_KEY="${PSI_API_KEY:-$(grep PSI_API_KEY .dev.vars 2>/dev/null | cut -d= -f2 | tr -d ' "'"'"'')}"
echo "PSI_KEY resolved: ${PSI_KEY:+yes}"
```

If **neither** source has a key, stop and tell the user:

> No `PSI_API_KEY` found. To set one up:
>
> 1. Go to https://console.cloud.google.com/apis/credentials
> 2. Create an API key (or reuse an existing one)
> 3. Enable the **PageSpeed Insights API** at https://console.cloud.google.com/apis/library/pagespeedonline.googleapis.com
> 4. Then either:
>    - `export PSI_API_KEY=your_key` in your shell profile, **or**
>    - Add `PSI_API_KEY=your_key` to a `.dev.vars` file in your project root

Then stop. Do not proceed without a key.

## Step 2 — Run the PSI check

Replace `$TARGET_URL` with the user-provided URL:

```bash
curl -s "https://www.googleapis.com/pagespeedonline/v5/runPagespeed?url=${TARGET_URL}&strategy=mobile&category=performance&category=accessibility&category=best-practices&category=seo&key=${PSI_KEY}" -o /tmp/psi-latest.json
```

## Step 3 — Parse results

```bash
node -e "
const r = require('/tmp/psi-latest.json');
if (r.error) { console.error('PSI Error:', r.error.message); process.exit(1); }
const cats = r.lighthouseResult.categories;
const scores = {};
for (const [k,v] of Object.entries(cats)) scores[k] = Math.round(v.score * 100);
console.log(JSON.stringify(scores, null, 2));

const fails = [];
const audits = r.lighthouseResult.audits;
for (const [id, a] of Object.entries(audits)) {
  if (a.score !== null && a.score < 1 && a.scoreDisplayMode === 'numeric') {
    fails.push({ id, score: a.score, display: a.displayValue || '', title: a.title });
  }
}
fails.sort((a,b) => a.score - b.score);
if (fails.length) {
  console.log('\nFailing audits:');
  fails.forEach(f => console.log('  ' + f.id + ': ' + f.display + ' (score: ' + Math.round(f.score*100) + ')'));
}

const any90 = Object.entries(scores).filter(([,s]) => s < 90);
if (any90.length) {
  console.log('\n⚠️  Below 90:', any90.map(([k,s]) => k + '=' + s).join(', '));
  process.exit(1);
} else {
  console.log('\n✅ All scores ≥ 90');
}
"
```

## Step 4 — Report

1. Present scores in a table. Flag any category below 90 with ⚠️.
2. List the top 3 failing audits with their scores and what to fix.
