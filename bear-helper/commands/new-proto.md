---
description: Create a new prototype page for PromptFit.
---

Create a new prototype page for PromptFit.

## Proto page conventions

**Storage:** All proto files live in `client/src/pages/` and are named `[Name]Proto.tsx`.
Example: `HeroProto.tsx`, `PlayerProto.tsx`, `OnboardingProto.tsx`

**Routes:** Protos are registered at `/proto/demo{x}` where x is the next available number.
Check `client/src/App.tsx` to find the current highest demo number, then use the next one.

**Registry:** After creating the file and registering the route, add a row to the proto table
in `CLAUDE.md` (project root). Never remove existing rows — proto pages are permanent artifacts.

**Never delete** any proto page or its route. They are long-lived design references.

---

## Steps to create a new proto

1. **Read** `client/src/App.tsx` to find the next available `/proto/demo{x}` number
2. **Read** `CLAUDE.md` to see existing protos and understand naming conventions
3. **Ask** the user what this proto should demonstrate if not already clear
4. **Create** `client/src/pages/[Name]Proto.tsx` using the Morning Linen design system:
   - Background: `#F9F5EE`, Surface: `#FDFAF5`, Border: `#DDD0BA`
   - Primary text: `#2C2018`, Accent: `#8B6F47`, Muted: `#B09878`
   - Fonts: `Cormorant Garamond` (headings) + `Outfit` (UI/body)
   - Include a page title and short description at the top
5. **Register** the route in `client/src/App.tsx`:
   ```tsx
   import [Name]Proto from './pages/[Name]Proto';
   // ...
   <Route path="/proto/demo{x}" component={[Name]Proto} />
   ```
6. **Update** the proto table in `CLAUDE.md`:
   ```
   | `/proto/demo{x}` | `client/src/pages/[Name]Proto.tsx` | Description |
   ```
7. **Build and deploy** using `npm run deploy`
8. **Report** the live URL: `https://promptfit.bear2029.workers.dev/proto/demo{x}`

---

## Current proto index

| Route | File | Description |
|-------|------|-------------|
| `/proto` | `PlayerProto.tsx` | Player card variants — B: square timer, C: liquid fill |
| `/proto/hero` | `HeroProto.tsx` | Hero image candidates (6 AI-generated options) |

> Always check `CLAUDE.md` for the up-to-date list before creating a new proto.
