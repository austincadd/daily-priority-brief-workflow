# daily-priority-brief-workflow

A reusable **scheduled workflow package** for generating a daily priority/news-style briefing through an OpenClaw cron job.

This is a **workflow repo**, not a skill repo. It packages:

- a reusable cron job template
- configurable prompt text
- install/setup helpers
- documentation for scheduling and adaptation

## What this is for

Use this when you want OpenClaw to automatically run a scheduled morning briefing that:

- performs web research
- filters results by importance
- formats a concise summary
- optionally posts the result to a chat destination or keeps delivery internal

The default packaged workflow is based on a daily AI briefing pattern, but the repo is structured so you can adapt it into a broader “daily priority brief” flow.

## Repository layout

```text
daily-priority-brief-workflow/
├── README.md
├── LICENSE
├── CHANGELOG.md
├── CONTRIBUTING.md
├── .gitignore
├── templates/
│   ├── cron-job.json
│   └── briefing-prompt.txt
├── scripts/
│   ├── install-workflow.sh
│   ├── validate-workflow.sh
│   └── render-template.js
├── examples/
│   ├── install.md
│   └── customization.md
└── .github/
    ├── ISSUE_TEMPLATE/
    │   ├── bug_report.md
    │   └── feature_request.md
    └── pull_request_template.md
```

## What the packaged workflow does

The default version runs once per day at **9:00 AM America/New_York** and asks OpenClaw to:

1. run web research
2. select the highest-signal items
3. filter out hype/noise
4. produce a short bullet briefing
5. optionally deliver it to a target channel

## Fastest setup

1. Edit the variables in `templates/cron-job.json`
2. Customize `templates/briefing-prompt.txt` if needed
3. Install using the helper script

```bash
./scripts/install-workflow.sh /path/to/output
```

That writes a ready-to-use workflow payload into the target folder.

## Cron job model

The packaged template uses:

- `sessionTarget: "isolated"`
- `payload.kind: "agentTurn"`
- `schedule.kind: "cron"`
- `delivery.mode: "none"` by default

You can change delivery to `announce` or `webhook` depending on how you want the briefing sent.

## Customization points

### Schedule
Change:
- cron expression
- timezone
- run frequency

### Prompt logic
Change:
- search queries
- filtering criteria
- output format
- topic domain

### Delivery
Change:
- internal only (`none`)
- chat announcement (`announce`)
- webhook callback (`webhook`)

## Validate the package

```bash
./scripts/validate-workflow.sh
```

## Notes

This repo does **not** create the cron job directly through GitHub. It packages the workflow so it can be installed into OpenClaw or adapted by another operator.

## License

MIT
