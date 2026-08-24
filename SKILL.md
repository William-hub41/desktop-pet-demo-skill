---
name: desktop-pet-demo
description: Plan, build, debug, test, and package a portfolio-ready Windows desktop pet demo in Unity. Use for projects involving a transparent always-on-top pet window, character state animation, click/long-press/drag interactions, calming exercises, local saves, lightweight minigames, release packaging, or software-copyright preparation. Do not use for ordinary full-screen Unity games or medical treatment products.
---

# Desktop Pet Demo

Build a small, coherent desktop companion whose character performance and core loop work before adding desktop-window effects. Preserve the user's visual direction and product scope; use placeholders to unblock code, then replace them without rewriting game logic.

## Start by fixing the product boundary

Confirm the target OS, Unity version, art pipeline, required interactions, core calming loop, final deliverables, and explicit exclusions. Treat wellbeing features as general comfort experiences, not diagnosis or treatment. Prefer one polished character and one complete loop over multiple shallow systems.

For planning milestones and cut order, read [references/production-workflow.md](references/production-workflow.md).

## Architecture

- Keep desktop-window code separate from gameplay and UI.
- Use an event-driven finite state machine for character states; animation scripts must not call one another directly.
- Put user interaction, mood check-in, breathing, minigame, reward, save, and window behavior in separate modules.
- Use versioned JSON under `Application.persistentDataPath`. Save through a temporary file, then replace the main file; back up corrupt data and recover defaults.
- Develop and verify the complete loop in a normal window before enabling transparency, borderless mode, always-on-top behavior, and desktop bounds.
- Keep a keyboard escape hatch such as F10 that returns the build to a normal diagnostic window.

Read [references/unity-architecture.md](references/unity-architecture.md) when implementing or debugging code and Windows integration.

## Character and interaction quality

- Define the character in a turnaround, palette, expression/action sheet, prop sheet, and layer list before final rigging.
- Keep sprite pivots, visible bounds, and pose framing consistent so state changes do not appear to jump.
- Distinguish a short click from petting with duration and movement thresholds. Cancel the click when a drag begins.
- During drag, use one stable drag pose or freeze pose-local motion; move the window or root exactly once per pointer update to prevent visual shaking.
- Clamp the visible character bounds, not merely the window center. Account for taskbar work area, window shadow, DPI scaling, sprite transparent padding, and the desired edge margin.
- Put modal feedback beside or above the pet when the pet's reaction is part of the experience; do not cover the reaction with the panel.

Read [references/art-animation-interaction.md](references/art-animation-interaction.md) for asset and motion acceptance checks.

## Calming loop

Implement a short, optional loop such as:

`mood check-in -> rule-based response -> optional paced breathing -> gentle reward -> growth record`

Breathing must support pause and early exit and display a clear stop-if-uncomfortable notice. A collection minigame should have no failure state, leaderboard, punishment, or sudden sound. Avoid guilt, streak pressure, forced completion, and medical claims.

## Verification and delivery

Test normal-window behavior first, then desktop mode. Verify at least startup/exit, every state transition, click versus long press, drag at all screen edges, save recovery, breathing pause/exit, minigame completion, settings persistence, and the final Windows build at target resolutions.

When a project path is available, run `scripts/inspect_unity_project.ps1` to produce a non-mutating readiness report. Use `scripts/package_unity_source.ps1` only after the user authorizes creation of a source archive.

For test evidence, portfolio video, release layout, and software-copyright preparation, read [references/qa-release-copyright.md](references/qa-release-copyright.md). Legal forms and identity facts must remain placeholders until the user confirms them.

## Completion standard

Do not call the project finished because editor play mode works. A portfolio-ready handoff includes a verified Windows build, Unity source without caches, character documentation, self-test report, user guide, concise demonstration video, source control checkpoint, and an organized release archive with checksums.
