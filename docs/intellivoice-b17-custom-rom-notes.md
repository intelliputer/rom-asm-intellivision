# B-17 Bomber / Intellivoice notes for custom ROM development

## Purpose

This note records what the B-17 Bomber ROM image in this repository tells us
about Intellivoice use, and how to apply those observations when making a new
Intellivision ROM.  It is deliberately conservative: the checked-in `.asm`
file is a disassembly, not the original commented source.

## What is confirmed in this repository

The B-17 Bomber image has two populated cartridge regions:

| Region | Source location | Practical role |
| --- | --- | --- |
| `$5000-$6FFF` | Start of the file through the first `ORG` change | Main cartridge program, normal game assets, and PSG sound-effect code/data. |
| `$D000-$DFFF` | `ORG $D000` | A distinct 4 Kiword cartridge region associated with this Intellivoice title. |

The main program begins with `ORG $5000`; see
[`B-17 Bomber ...asm`](../src/B-17%20Bomber%20%281981%29%20%28Mattel%29%20%5B%21%5D.asm).
The extra region starts at `ORG $D000` later in the same file.

The `$D000` region does **not** look like ordinary, consistently reachable
CPU program code.  A generic disassembler nevertheless renders portions of
it as instructions, because arbitrary encoded data can resemble Intellivision
opcodes.  For custom-ROM planning, treat this region as opaque speech/phrase
data unless an analysis of the Intellivoice format proves otherwise.

The cartridge-header word at `$500C` is `$0080`.  This is an EXEC startup
flag (run code after the title), **not** an Intellivoice-present flag.  Do not
copy or test that value as a way to enable speech.

## What the player sees and hears

In B-17 Bomber, speech is gameplay feedback rather than narration.  The game
uses it for events such as:

- threat and damage warnings: “Watch flak,” “Look out,” and “Mayday”;
- enemy reports: “Bandits” and “Fighters”;
- directional reports: “Three/Six/Nine/Twelve o’clock”;
- mission progress: “Target in sight,” “Bombs away,” and “Good shot.”

The program visibly prints `O'Clock` as part of the directional display in
the main `$5000` program.  That is a useful design cue: pair a voice line
with an on-screen state change, but keep the screen/UI usable without sound.

Ordinary beeps and effects are separate.  B-17 calls the EXEC PSG routines
`X_PLAY_SFX1` and `X_PLAY_SFX2`; their inline effect data is not speech data.
For a new title, design PSG effects and speech as independent audio channels
with separate priorities and fallback behavior.

## Hardware model

At a high level the arrangement is:

```text
game event
    -> game selects a phrase or sequence
    -> Intellivoice control interface at $0080-$0081
    -> module reads/resolves phrase data from its speech path
    -> SP0256-based hardware produces speech
```

`$0080-$0081` is the Intellivoice I/O range used by the console-side CPU.
The exact command bytes, timing, busy-status handling, and the format of a
custom phrase bank must be verified against the Intellivoice BIOS/hardware
documentation or a known working open-source driver.  They cannot be safely
reconstructed just from the unlabeled B-17 disassembly.

## Recommended architecture for a custom ROM

1. Define a small, symbolic speech API in game code, for example
   `VOICE_THREAT`, `VOICE_TARGET`, and `VOICE_CONFIRM`.  Do not spread raw
   `$0080`/`$0081` accesses through gameplay code.
2. Give each request a priority and define interruption rules.  A damage or
   urgent-threat call should be allowed to pre-empt a low-priority status
   message.
3. Poll the module’s ready/busy state before sending a command; either queue
   or discard a request when the module is busy.  Never make the frame loop
   wait indefinitely for speech hardware.
4. Provide a no-Intellivoice path.  Preserve gameplay with text, visual
   feedback, and PSG effects; speech should enrich the game rather than hide
   required information.
5. Keep speech assets isolated in a dedicated cartridge segment and document
   its intended mapping in the build system.  Do not assume B-17’s `$D000`
   placement is universally correct until the target cartridge mapper and
   Intellivoice interface have been validated.
6. Test on both an emulator with Intellivoice emulation and real hardware.
   Verify boot, phrase start, busy handling, interruption, and behavior when
   the module is absent.

## Validation checklist

- The image still boots on a base Intellivision with no Intellivoice attached.
- Every voice-triggering event also has a visible or PSG-only feedback path.
- The code writes only after the voice interface reports ready, according to
  the verified protocol.
- Speech does not corrupt cartridge-bank selection or normal audio playback.
- The speech-data bank and its ROM mapping are documented alongside the
  build command.
- Phrase IDs and their gameplay meanings are maintained in a table, rather
  than inferred from raw data later.

## Important limitation

This repository’s B-17 source establishes the layout and the gameplay role of
speech, but it does not annotate the phrase encoder or name each speech
command.  Before copying a byte sequence or bank layout into a new ROM,
perform a protocol-level review of the Intellivoice BIOS and a known working
implementation.  That additional step prevents a custom game from confusing
ordinary cartridge data with the module’s phrase stream.
