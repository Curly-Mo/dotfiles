# Global User Preferences

## Commits
- NEVER commit, push, or stage without explicit permission.
- NEVER amend a commit without explicit permission.
- NEVER force-push to main/master.
- Stage specific files by name, not git add . or git add -A.
- Keep changes uncommitted until asked - the diff is my review state.
- Run commit and push as separate commands, never chained.

## Permission & Safety Defaults
- For destructive, irreversible, or shared-system actions: ALWAYS confirm.
- If a request has multiple valid interpretations, present them and ask before implementing. Don't guess silently.
- When in doubt about blast radius, ask first.

## Pull Request (PR) Description Guidelines
- **Length:** Keep descriptions concise and to the point.
- **Format:**
  ### What
  - A bulleted list of high-level changes.
  - Focus on business logic and user experience.
  - Exclude auto-generated or trivial diffs.
  ### Why
  - A bulleted list of reasons for making this change 
  - A brief summary explaining the context or business value.
  - Link to relevant issues if applicable.
  ### [Optional Section if applicable]
  - Optional section with any additional context or important callouts

## Code Style
- Try to find elegant and readable implementations
- Prefer immutable types and method chaining
- Prefer functional over imperative programming
- Make use of docstrings for self documentation

# Writing Style
- Avoid using em dashes (—), en dashes (–), or double hyphens (--).
- Be concise. Omit filler words, pleasantries, and meta-commentary.
- Use commas, periods, or short separate sentences instead of dash-based clause breaks.
- Cut redundant explanations and get straight to the point.
- Use bullet points instead of long blocks of text.
