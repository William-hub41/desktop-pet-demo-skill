# Art, animation, and interaction acceptance

Use this reference when defining asset specifications, importing art, or reviewing character motion.

## Character package

A compact first character should include:

- short written positioning and personality;
- front/side/back turnaround;
- primary and supporting palette with hex values;
- five to seven expressions or a combined action sheet;
- one food prop and one accessory;
- transparent neutral pose and named layered source files;
- process evidence showing sketches, revisions, or author decisions.

Keep visual inspiration separate from direct copying. Record references, then change silhouette, palette relationships, costume construction, facial features, symbols, and narrative premise until the character has its own identity.

## Import and framing

- Use transparent PNG layers or a compatible layered document.
- Keep a shared canvas, pixel density, ground line, pivot convention, and visible scale across poses.
- Trim unnecessary transparent padding only after confirming it will not break animation or accessories.
- Verify filtering, compression, max texture size, alpha, and sprite pixels-per-unit at target desktop size.
- Judge sharpness in the standalone build at 100% Windows scaling and at the user's actual scaling.

## Motion acceptance

- Idle: subtle breathing/blink without constant whole-body bobbing.
- Happy/reward: clear silhouette change, fast anticipation, soft settle.
- Tired/sleep: slower rhythm and lower visual energy.
- Petted: readable head/ear response without firing on an ordinary click.
- Breathing: smooth, low-amplitude expansion aligned to the displayed phase.
- Drag: stable gaze and pose; no oscillation or state retriggering.

Transitions should not change apparent pet size or ground contact unless intentional. Inspect rapid interruption sequences, not only each animation in isolation.

## UI relationship

Use a unified palette, corner radius, border weight, typography hierarchy, and sound intensity. Desktop mode needs compact panels because the user's desktop remains the background. Prefer panels that reveal rather than cover the character.

Make accessory silhouettes readable at the final pet scale. A one-pixel dot may technically exist but fails as a reward; use a distinct shape, contrast, placement, and optional soft glow while preserving the face.
