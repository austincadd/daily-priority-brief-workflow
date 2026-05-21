# Customization guide

## Change the topic
Replace the search queries in `scheduled-workflow.json` or use the renderer:

```bash
SEARCH_QUERY_1="startup funding news today" \
SEARCH_QUERY_2="enterprise AI product launches today" \
node scripts/render-template.js ./output/scheduled-workflow.json
```

## Change delivery mode
In `scheduled-workflow.json`, edit:

- `delivery.mode` to `announce` or `webhook`
- add destination details expected by your Agent Harness environment

## Change timing
Edit:

- `schedule.expr`
- `schedule.tz`
