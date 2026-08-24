# QA, release, portfolio, and copyright preparation

Use this reference when preparing final evidence and deliverables. It is operational guidance, not legal advice.

## Self-test evidence

Do not invent user testing. If no external study occurred, label the report as developer self-testing and include:

- engine, OS, architecture, graphics API and target resolutions;
- milestone regression history;
- automated test counts with date and mode;
- final build smoke tests;
- known limitations and deliberately excluded platforms;
- reproducible steps for any unresolved issue.

Test a standalone Windows build for at least startup, menu exit, diagnostic toggle, every state, click/long press/drag, screen edges, mood flow, breathing pause/exit, minigame completion, save/restart, corrupted save recovery, settings, and accessory persistence.

## Portfolio video

Aim for 45–60 seconds:

1. hook and product positioning;
2. character turnaround and action range;
3. desktop movement and interaction;
4. mood check-in and response;
5. paced breathing;
6. no-fail minigame and reward;
7. growth/save evidence;
8. technology and final title.

Prefer real build capture. A slide-led reel may combine real screenshots, short live clips, character sheets, restrained captions, and quiet audio. Never imply footage is live interaction when it is a static presentation.

## Release layout

Organize the final archive into program, character design, test report, source code, user guide, video, and optional registration materials. Preserve all Unity build dependencies. Package Unity source with `Assets`, `Packages`, `ProjectSettings`, project documentation, and the root readme; exclude `Library`, `Temp`, `Logs`, `obj`, generated builds, IDE caches, credentials, and personal save data. Generate SHA-256 checksums and test-read the final archive.

## Software-copyright preparation in China

Check the current official application system and rules before every submission. Common preparation includes the application form, identification materials, ownership proofs where applicable, software documentation, and source-code identification material. Do not fabricate applicant identity, completion/publication dates, development method, ownership, or AI/third-party declarations.

Keep the software name and version identical across the form, source headers, manual, and executable metadata. For projects using engines, open-source packages, AI assistance, fonts, audio, or reference-based character art, distinguish applicant-created code and documentation from third-party rights. Software registration does not automatically clear character-art or trademark risk.

Official starting points:

- National Copyright Administration: <https://www.ncac.gov.cn/>
- Copyright Protection Center of China: <https://www.ccopyright.com.cn/>

Because requirements change, browse official sources rather than relying on this reference for page-count or form-field rules.
