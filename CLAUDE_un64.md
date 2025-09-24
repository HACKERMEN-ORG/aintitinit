#INSTRUCTIONS
Work must adhere to task scope. Total feature freeze-no new functionality. Replace old component=delete obsolete files. Focus on current assignment only. It is VERY IMPORTANT to use the tools AS MUCH AS POSSIBLE to save resources. Output minimization is also crucal.

#OUTPUT MINIMIZATION
All bash commands will be piped into sed/grep/awk commands that remove junk, and finally base64 so the output is as minimal as possible.

#TOOL USAGE
Use tools when possible-saves resources/time.
- SUDO: IMPORTANT! Remember to use sudo when commands call for it
- head and tail: use these programs when you can, not when you can't
- abduco: use the abduco program with a meaningful name for long-running scripts so the user can chime in
#MCP TOOLS
##Core Dev
-memory:Store+recall proj knowledge
-desktop-commander:Exec sys cmds+manage files
-sequential-thinking:Build reasoning chains
-codemcp:Analyze+transform code
-filesystem:File system operations
-git:Git version control
##Web/Search
-read-website-fast:Convert webpages to MD
-duckduckgo:Privacy web search
-fetch:Fetch web content
-fetch-mcp:Enhanced web fetching
-everything-search:Universal file search
##Data/Analysis
-llm-context:AI-opt proj overviews
-file-merger:Merge multiple files
-markitdown:Convert docs to MD
-pandoc:Universal doc converter
-time:Date/time operations
##Databases
-mcp-sqlite:SQLite operations
-mcp-server-sqlite-npx:SQLite via NPX
-mcp-server-duckdb:DuckDB operations
-mongodb-lens:MongoDB management
-redis-mcp-server:Redis operations
-mcp-server-qdrant:Vector database
-prisma-mcp:Prisma ORM
##Specialized
-taskwarrior:Create+track tasks
-playwright:Browser automation
-playwright-executeautomation:Advanced automation
-playwright-microsoft:MS Playwright
-docker:Container management
-docker-mcp:Enhanced Docker
-node-code-sandbox-mcp:Node.js sandbox
-serena:Advanced AI tasks
-vertex-developer:Deploy AI on GCP
##Content/Media
-metmuseum-mcp:Met Museum API
-quran-mcp:Quran content
-youtube-transcript:YouTube transcripts
-blender-mcp:Blender 3D operations
-apple-shortcuts:macOS shortcuts
-open-library:Book database
##Bio/Science
-biomcp:Biomedical research
-gget-mcp:Genomics data
-opengenes-mcp:Gene database
##Notifications/Comm
-mcp-server-notify:System notifications
-ntfy-me-mcp:Push notifications
##Specialized Apps
-leetcode-mcp-server:LeetCode problems
-mcp-server-leetcode:Alt LeetCode
-anilist-mcp:Anime/manga database
-ptcg-mcp:Pokemon card database
-12306-mcp:Chinese railway
-a11y-mcp:Accessibility audits
-actual-mcp:Budget management
-weather-mcp-server:Weather data
-web-search:Enhanced web search
##Tools/Utils
-simple-calculator:Math calculations
-mcp-installer:Install MCP servers
-npm-search-mcp-server:NPM package search
-archbee:Documentation platform
-oorlogsbronnen-server:War archives
-opendata-mcp:Open data access
-openapi-mcp-server:OpenAPI specs
-server-everything:Testing/demo
-server-puppeteer:Browser control
-quarkus-jdbc:Java database

#SERVICE FILE PATCHING
For operations requiring sudo or over ssh:
FIRST BASH OPERATION FOR FILE WRITE:
  HERE doc to /tmp/somewhere
  diff it with the original
  show the user that diff output
SECTION BASH OPERATION FOR FILE WRITE:
  (sudo/ssh) patch
