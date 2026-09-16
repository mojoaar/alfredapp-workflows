# Nyheder

Shows the latest Danish news from **DR** and **TV 2**, newest first.

- **Keyword:** `nyheder`
- **Hotkey:** none

## What it does

Type `nyheder` in Alfred to get a merged list of the latest headlines from:

- [DR Nyheder — seneste](https://www.dr.dk/nyheder/seneste) (via the official RSS feed
  `https://www.dr.dk/nyheder/service/feeds/senestenyt`)
- [TV 2 Nyheder — seneste](https://nyheder.tv2.dk/seneste)

Every headline shows its source and how recent it is (for example `DR · 8 min` or
`TV2 · i går 22.08`), and each row carries the source's own icon. Items are sorted by
publication time, newest first, and capped at 50.

- Press `↩` to open the article in your default browser.
- Keep typing after `nyheder` to filter the list (`nyheder trump`).
- `⌘L` shows the full headline, `⌘C` copies the article URL.
- While the list loads, Alfred shows **Henter nyheder…**.

## How it works

A single **Script Filter** runs an inline JXA (JavaScript for Automation) script that:

1. fetches both sources in parallel with `/usr/bin/curl`;
2. parses DR's RSS (`<item>` → title, link, `pubDate`) and scrapes TV 2's HTML
   (`<article class="tc_teaser">` → headline, link, relative time);
3. normalises TV 2's Danish time labels ("I dag kl. 08.26", "I går kl. 22.08",
   "13 min siden", "2 timer siden") into timestamps;
4. merges, sorts by time and emits Alfred JSON.

Selecting a result feeds the article URL to an **Open URL** action.

## Notes

- **DR** is read from an official, stable RSS feed.
- **TV 2** does not publish an RSS or JSON feed, so its page is scraped. This part depends
  on TV 2's markup and may need updating if they redesign the page. Articles whose time
  TV 2 renders as a date in the URL fall back to that date.
- Requires an internet connection.
- The list re-runs every 60 seconds while open, so it also updates when you keep the
  Alfred window open.

## Requirements

- [Alfred 5](https://www.alfredapp.com/) with the
  [Powerpack](https://www.alfredapp.com/powerpack/)
