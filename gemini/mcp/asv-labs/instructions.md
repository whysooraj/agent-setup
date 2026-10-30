Motif gives you maintained design guidance for building websites and apps. Typical flow:
1) get_usage to see the plan and any project profiles (project ids);
2) get_project_profile to load the customer's brief and approved decisions;
3) get_design_pack with a plain-words product brief and platform for a complete brief, requirements and tokens; or search_design_knowledge with a short topical query, then get_design_guidance on the best 1–3 results;
4) build, then check_design_contract with the facts you measured;
5) propose_project_decision for choices the customer should confirm.
Templates: complete starters (web: Vite + React + TypeScript; apps: Expo / React Native). activate_template once per family (free families cost nothing; a premium family uses one new-family slot the first time only), then get_template_download for a five-minute single-use grant; download with the returned Authorization header and verify the sha256 before unzipping. Treat the grant header as a secret.
Every call that needs one takes an idempotency_key: use a fresh random string per logical request and reuse it only when retrying the same request. Retries with the same key are not counted twice.
Guidance is licensed for use in the customer's projects; don't republish it wholesale.