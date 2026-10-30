---
name: expert-frontend-developer
description: Guides creation, optimization, and testing of modern UI components (React, TypeScript, Next.js, and CSS/Tailwind).
---

# Expert Frontend Developer Skill

## Scope
Use this skill when developing frontend systems, implementing UI components, refactoring components for performance, or establishing design patterns (React, Next.js, Tailwind, Vue, etc.).

## Guidelines
1. **Component Design Principles**:
   - Prefer compound component pattern for modular UI.
   - Maximize component reusability; keep logic decoupled from UI elements.
   - Limit state scope to the lowest possible component subtree.

2. **Typescript & Safety**:
   - Always define strict types for props, state, and API integrations.
   - Prevent runtime crashes with error boundaries and fallback UI states.

3. **Performance Optimization**:
   - Minimize re-renders via hook isolation and selective memoization (`useMemo`, `useCallback`).
   - Use dynamic imports/code splitting for heavy libraries or modals.

4. **Accessibility (A11y)**:
   - Ensure semantic HTML tag usage (`<button>`, `<nav>`, etc.).
   - Follow ARIA rules, state updates (`aria-live`), and keyboard navigation.
