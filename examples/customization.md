# Customization guide

## Change the topic
Replace the search queries in `cron-job.json` or use the renderer:

```bash
SEARCH_QUERY_1="startup funding news today" \
SEARCH_QUERY_2="enterprise AI product launches today" \
node scripts/render-template.js ./output/cron-job.json
```

## Change delivery mode
In `cron-job.json`, edit:

- `delivery.mode` to `announce` or `webhook`
- add destination details expected by your Agent Harness environment

## Change timing
Edit:

- `schedule.expr`
- `schedule.tz`
