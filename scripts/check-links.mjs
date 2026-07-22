// Dead-link / redirect checker for the personal site's HTML.
// Scans index.html + _layouts/default.html for external hrefs and reports status.
// Usage: node scripts/check-links.mjs

import fs from "fs";

const FILES = ["index.html", "_layouts/default.html"];
const TIMEOUT_MS = 20000;
const UA =
    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 " +
    "(KHTML, like Gecko) Chrome/125.0 Safari/537.36";

const set = new Map(); // url -> [files]
for (const f of FILES) {
    const html = fs.readFileSync(f, "utf8");
    const re = /href="([^"]+)"|src="([^"]+)"/g;
    let m;
    while ((m = re.exec(html))) {
        const u = m[1] || m[2];
        if (/^https?:\/\//i.test(u)) {
            if (!set.has(u)) set.set(u, []);
            set.get(u).push(f);
        }
    }
}
const urls = [...set.keys()];
console.error(`Found ${urls.length} external URLs`);

async function head(url) {
    const ctrl = new AbortController();
    const t = setTimeout(() => ctrl.abort(), TIMEOUT_MS);
    try {
        let res = await fetch(url, {
            method: "GET",
            redirect: "follow",
            signal: ctrl.signal,
            headers: { "User-Agent": UA, Accept: "text/html,*/*" },
        });
        return { status: res.status, finalUrl: res.url };
    } catch (e) {
        return { status: 0, error: e.name === "AbortError" ? "timeout" : String(e) };
    } finally {
        clearTimeout(t);
    }
}

const results = [];
let i = 0;
async function worker() {
    while (i < urls.length) {
        const u = urls[i++];
        const r = await head(u);
        let verdict;
        if (r.status === 0) verdict = "UNREACHABLE";
        else if (r.status === 404 || r.status === 410) verdict = "BROKEN";
        else if (r.status >= 500) verdict = "SERVER_ERR";
        else if (r.status === 403 || r.status === 401 || r.status === 429) verdict = "BLOCKED";
        else verdict = "OK";
        const redirected = r.finalUrl && r.finalUrl.replace(/\/$/, "") !== u.replace(/\/$/, "");
        results.push({ url: u, ...r, verdict, redirected, files: set.get(u) });
        console.error(`[${results.length}/${urls.length}] ${verdict} ${u}`);
    }
}
await Promise.all(Array.from({ length: 5 }, worker));

const order = ["BROKEN", "UNREACHABLE", "SERVER_ERR", "BLOCKED", "OK"];
results.sort((a, b) => order.indexOf(a.verdict) - order.indexOf(b.verdict));
console.log("\n============ LINK REPORT ============\n");
for (const v of order) {
    const rows = results.filter((r) => r.verdict === v);
    if (!rows.length) continue;
    console.log(`\n---- ${v} (${rows.length}) ----`);
    for (const r of rows) {
        console.log(`[${r.status}${r.error ? " " + r.error : ""}] ${r.url}`);
        if (r.redirected) console.log(`      -> ${r.finalUrl}`);
    }
}
