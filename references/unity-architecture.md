# Unity architecture and Windows integration

Use this reference when implementing systems or diagnosing conflicts.

## Suggested modules

- `PetStateMachine`: Idle, Walk, Happy, Tired, Sleep, Petted, Drag, Breathing, Reward.
- `PetInteractionController`: pointer timing, movement threshold, short click, long press, drag capture.
- `MoodCheckInService`: mood labels, intensity, context, timestamp, rule-based response.
- `BreathingController`: inhale/hold/exhale phases, countdown, pause, resume, early exit.
- `StarCollectionMiniGame`: session time, collection count, spawn state, no-fail end.
- `RewardSystem`: currency, unlock conditions, current accessory.
- `SaveService`: versioned schema, atomic write, corrupt-file backup and default recovery.
- `DesktopWindowController`: transparent/borderless/topmost mode, window position, work-area limits, diagnostic toggle.
- `UiNavigator`: modal ownership and navigation without gameplay scripts calling panel internals.

Use events or a small application context for collaboration. State transitions must have a single owner. When a modal or drag interrupts an animation, define whether the previous state resumes or returns to Idle.

## Save invariants

- Store UTC or local timestamps as ISO 8601 strings with a documented convention.
- Include a schema version.
- Serialize to a temporary file and flush it before replacing the main file.
- If parsing fails, rename or copy the damaged file to a timestamped backup and start with defaults.
- Do not store secrets; state clearly that data remains on the local machine.
- Test missing, empty, truncated, invalid, and older-version saves.

## Transparent desktop mode

Implement Win32 behavior only in Windows builds and keep editor behavior ordinary. Set transparency and topmost flags after the native window handle exists. Reapply when display configuration or window state changes if necessary.

Coordinate rules:

- Use one coordinate space from pointer capture through final window position.
- Query the monitor work area for the current window; do not hard-code 1920×1080.
- Convert for DPI awareness consistently.
- Derive clamp margins from visible character bounds and desired edge spacing.
- Account for transparent image padding; a 0 px window margin can still leave a large visible gap.
- Avoid updating both a Unity transform and the native window from the same drag delta.

Always preserve a diagnostic normal-window shortcut and a menu exit path. Transparent-window bugs are much easier to recover from when the user can restore a visible frame.

## Common failure patterns

- **Click also pets:** the click fires before the long-press decision. Delay dispatch until release and cancel after threshold/drag.
- **Character shakes while dragging:** pose-local animation and window movement both alter perceived position. Freeze/localize the pose and apply a single native movement path.
- **Cannot reach screen edge:** clamp uses window center/size instead of visible sprite bounds, or art has transparent padding.
- **Popup hides reaction:** modal anchors to screen center. Anchor relative to the pet and reserve a visible reaction zone.
- **Exit works in editor but not build:** editor stop behavior was mistaken for application quit. Test `Application.Quit()` in a standalone build.
