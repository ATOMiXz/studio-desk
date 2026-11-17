# Product

<!-- impeccable:product-schema 1 -->

## Platform

web

## Stack

Current: a single-file static prototype (`index.html`, vanilla HTML/CSS/JS, data in browser localStorage). Mascot images in `assets/mascot/` (originals) and `assets/mascot/web/` (web-sized); a looping green-screen mascot video in `assets/mascot/video/`, keyed out in the browser with WebGL. Because of that, the page must be served over http (double-click `Open Studio Desk.bat`, or the `.claude/launch.json` preview at `http://localhost:8452`); opened as a file, only the still pose shows.

Production target: integrate with the company's existing **Google Workspace** (sign-in with company Google accounts; team data, calendar and files should live in or connect to Workspace). The concrete architecture (e.g. Google Sheets/Apps Script vs. Firebase vs. a hosted app with Google sign-in) is **not decided yet**.

## Users

A Thai in-house graphic design team of 18+ people: Art Director, senior/junior graphic designers, motion designers, illustrators, photo retoucher, packaging, UI, copy & layout, and a production artist. They work mainly **on office desktop computers** and keep Studio Desk open through the day; phones are for occasional checks.

Each person uses it as their own desk: what's on today, what to work on next, what the team announced. The Art Director / lead also uses it to see the whole team's workload.

## Product Purpose

Studio Desk is a personal "secretary" for each designer, plus a shared space for the team:

- greets the user, gives today's date, weather, and a written brief of the day;
- shows the person's own performance (tasks closed this week, on-time rate);
- shows their calendar appointments;
- reports their work via a Kanban board;
- a shared area for team announcements;
- an idea corner: reference images, techniques, and daily creative prompts.

Success: designers start their day from Studio Desk instead of chasing chat messages, and nothing due slips past unnoticed.

## Positioning

Not a generic task tracker: a secretary with a character. An orange tabby cat mascot greets each person and reacts to their real situation (time of day, overdue work, rain, lunch break, all done). Work cards show the draft artwork itself, because designers recognise jobs by the image, not the title.

## Operating Context

- Kanban stages: รอเริ่ม → กำลังทำ → รอตรวจ / แก้ไข → เสร็จแล้ว. Cards carry client, job type (social, banner, key visual, packaging, motion, print), due date, urgent flag, brief, and a link to the latest draft image.
- Calendar is part of Studio Desk itself (team stand-ups, weekly planning, Friday design critique, personal meetings, deliverable deadlines). With Google Workspace, Google Calendar is the likely source.
- Announcements need explicit acknowledgement ("รับทราบ") so posters can see who has read them.
- The team is based in Phitsanulok; weather is shown for Phitsanulok (Open-Meteo, refreshed every 15 minutes).
- Lunch break is 11:30–13:00.

## Capabilities and Constraints

- UI language: Thai.
- The team overview **intentionally** shows every member's workload, overdue count, and on-time % to the whole team (owner's decision; do not hide or soften by default).
- The mascot switches poses by state; priority: lunch (11:30–13:00) → overdue work → rain ≥ 50% → nothing open → morning / afternoon / evening.
- On the desk hero, a mascot video plays over the pose image (one clip per time of day: morning before 11:30, midday until 17:00, evening after; only `morning.mp4` exists, so it stands in for the others). While it plays, the state poses (lunch, urgent, rain, done) are hidden; how those states should show in video is not decided yet. Reduced motion, a failed load or no WebGL fall back to the still pose.
- Undecided: production architecture on Google Workspace; roles/permissions (who may post announcements, edit others' tasks); whether performance data is calculated from real task history.

## Brand Commitments

- Product name: **Studio Desk**.
- Mascot: a cute 3D designer-toy (Pop Mart–style) orange tabby cat secretary with round glasses, a black turtleneck/hoodie and silver headphones. Seven poses exist: default, morning (ready to go), lunch (noodles), evening (waving goodbye), urgent (laptop, sweat drop), done (celebrating), rain (clear umbrella).
- The mascot **has a name and speaks to the team in its own voice** (greetings and reminders in the cat's voice). **The name is not chosen yet.** Do not invent one in shipped copy without the owner's approval.

## Evidence on Hand

- Mascot artwork: `assets/mascot/*.png` (4K originals), `assets/mascot/web/*.png` (1400px), and the green-screen video `assets/mascot/video/morning.mp4`.
- Everything else in the prototype (members, clients, tasks, announcements, reference images, performance numbers) is **sample data**. Do not present it as real, and do not fabricate real clients, metrics, or testimonials.

## Product Principles

1. **A secretary, not a dashboard.** Lead with what matters to this person today, written in plain Thai sentences.
2. **Work is recognised by its image.** Show the draft wherever a job is shown.
3. **Nothing due slips.** Overdue and due-soon work is always the first thing the desk says.
4. **Character with restraint.** The cat makes the day warmer; it never blocks or slows real work.
5. **Built for the office desktop first,** comfortable on a phone for quick checks.
