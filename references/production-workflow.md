# Production workflow

Use this reference when estimating, sequencing milestones, or deciding what to cut.

## Recommended phases

1. **Playable placeholder** — normal window, visible placeholder pet, short click, long press, stable drag, stop/exit path.
2. **Visual definition** — character positioning, silhouette exploration, turnaround, palette, expressions, props, UI mood board, layer list.
3. **Character performance** — import clean transparent assets; create idle, walk, happy, tired, sleep, petted, breathing, and reward states.
4. **Interaction loop** — menu, feeding, accessory slot, feedback light/audio, interaction thresholds, state interruption rules.
5. **Desktop integration** — borderless transparent window, always-on-top, desktop bounds, diagnostic window toggle, clean exit.
6. **Wellbeing loop** — mood check-in, rule-based response, optional paced breathing, local save.
7. **Low-pressure activity** — no-fail collection, participation reward, accessory unlock, growth summary.
8. **Polish and release** — consistent UI, audio settings, regression, Windows build, documentation, demo video, archive and checksum.

Do not require twelve calendar weeks. Map these phases to the user's time and current maturity. Each milestone should end with a runnable build or a durable asset checkpoint.

## Scope control

Protect these first:

- recognizable character and core animation states;
- reliable click, long press and drag;
- one complete calming loop;
- local persistence and clean startup;
- a build that works outside the editor.

If behind schedule, cut analytics charts, multiple accessories, ambient audio, system tray, mouse pass-through, multi-monitor polish, and decoration depth before cutting the core loop.

## Collaboration split

Codex can own architecture, scripts, data formats, placeholder assets, debug analysis, build automation, documentation structure, release packaging, and video storyboards. The user should retain final aesthetic decisions, visible rig/weight tuning, asset approval, real-device testing, identity/legal facts, and publication choices.

## Weekly evidence

At each checkpoint keep:

- one runnable build or recorded editor run;
- one Git commit with a meaningful message;
- screenshots or a short clip showing the milestone;
- a concise issue list and next acceptance criteria.
