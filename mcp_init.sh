#!/usr/bin/env bash
set -euo pipefail

# Expand leading ~ if present (without eval)
input_dir=${1:-.}
project_dir="${input_dir/#\~/$HOME}"

# Create project directory (and parents), then resolve absolute path
mkdir -p "$project_dir"
project_dir_abs="$(cd "$project_dir" && pwd -P)"

# Create db folder and memory file
mkdir -p "$project_dir_abs/.aim"
: >"$project_dir_abs/.aim/memory.jsonl"

# Ensure claude-desktop config directory exists
config_dir="$HOME/.config/claude-desktop"
mkdir -p "$config_dir"

# Write .mcp.json with correct pathing to project directory
cat >"$project_dir_abs/.mcp.json" <<JSON
{
  "permissions": {
      "auto_approved_tools": [
        "memory",
        "read-website-fast",
        "duckduckgo", 
        "arxiv",
        "hacker-news",
        "sequential-thinking",
        "llm-context",
        "file-merger",
        "everything-search",
        "server-everything",
        "markitdown",
        "mcpmcp",
        "1mcp-agent",
        "magg",
        "open-library",
        "manim-server",
        "blender-mcp",
        "bazi-mcp",
        "quran-mcp",
        "metmuseum-mcp",
        "playwright-executeautomation",
        "apple-reminders",
        "youtube-transcript",
        "playwright-microsoft",
        "mcp-browser-kit",
        "apple-shortcuts",
        "aws-pricing-mcp",
        "books-mcp-server", 
        "node-code-sandbox-mcp",
        "mcp-server-leetcode",
        "codemcp",
        "leetcode-mcp-server",
        "code-to-tree",
        "serena",
        "code-assistant",
        "maxmsp-mcp-server",
        "vertex-developer",
        "mcp-server-notify",
        "opendata-mcp",
        "dicom-mcp",
        "mongodb-lens",
        "mcp-sqlite",
        "mcp-server-duckdb",
        "mongo-mcp",
        "prisma-mcp",
        "mcp-server-qdrant",
        "quarkus-jdbc",
        "redis-mcp-server",
        "mcp-alchemy",
        "aseprite-mcp",
        "oorlogsbronnen-server",
        "anilist-mcp",
        "biomcp",
        "biothings-mcp",
        "gget-mcp",
        "opengenes-mcp",
        "server-puppeteer",
        "filesystem",
        "fetch",
        "git",
        "time",
        "docker-mcp",
        "archbee",
        "openapi-mcp-server",
        "pandoc",
        "12306-mcp",
        "a11y-mcp", 
        "actual-mcp",
        "simple-calculator",
        "mcp-installer",
        "npm-search-mcp-server",
        "mcp-server-sqlite-npx",
        "formula1-mcp",
        "ptcg-mcp",
        "ntfy-me-mcp",
        "mcp-obsidian",
        "weather-mcp-server"
      ],
      "require_permission": [
        "desktop-commander",
        "docker",
        "docker-mcp",
        "taskwarrior",
        "playwright",
        "playwright-executeautomation",
        "apple-reminders",
        "youtube-transcript",
        "playwright-microsoft",
        "mcp-browser-kit",
        "apple-shortcuts"
      ],
      "claude_tools": {
        "auto_approved": {
          "read_operations": [
            "Read",
            "Glob", 
            "Grep",
            "WebFetch",
            "WebSearch"
          ],
          "bash_read_only": [
            "ls",
            "cat",
            "grep",
            "find",
            "head",
            "tail",
            "wc",
            "file",
            "stat",
            "pwd",
            "whoami",
            "date",
            "ps",
            "top",
            "df",
            "du",
            "which",
            "whereis"
          ]
        },
        "require_permission": {
          "write_operations": [
            "Write",
            "Edit",
            "MultiEdit",
            "NotebookEdit"
          ],
          "bash_write_operations": [
            "mkdir",
            "touch",
            "cp", 
            "mv",
            "rm",
            "chmod",
            "chown",
            "git",
            "npm",
            "pip",
            "cargo",
            "make",
            "docker",
            "systemctl",
            "service"
          ]
        }
      }
    },
  "mcpServers": {
    "memory": {
      "type": "stdio",
      "command": "npx",
      "args": [
        "-y",
        "@modelcontextprotocol/server-memory"
      ]
    },
    "read-website-fast": {
      "type": "stdio", 
      "command": "npx",
      "args": [
        "-y",
        "@just-every/mcp-read-website-fast"
      ]
    },
    "desktop-commander": {
      "type": "stdio",
      "command": "npx", 
      "args": [
        "-y",
        "@wonderwhy-er/desktop-commander"
      ]
    },
    "sequential-thinking": {
      "type": "stdio",
      "command": "npx",
      "args": [
        "-y",
        "@modelcontextprotocol/server-sequential-thinking"
      ]
    },
    "taskwarrior": {
      "type": "stdio",
      "command": "npx",
      "args": [
        "-y", 
        "mcp-server-taskwarrior"
      ]
    },
    "playwright": {
      "type": "stdio",
      "command": "npx",
      "args": [
        "-y",
        "@automatalabs/mcp-server-playwright"
      ]
    },
    "duckduckgo": {
      "type": "stdio",
      "command": "npx",
      "args": [
        "-y",
        "duckduckgo-mcp-server"
      ]
    },
    "arxiv": {
      "type": "stdio", 
      "command": "npx",
      "args": [
        "-y",
        "arxiv-mcp-server"
      ]
    },
    "hacker-news": {
      "type": "stdio",
      "command": "npx",
      "args": [
        "-y",
        "mcp-hn"
      ]
    },
    "docker": {
      "type": "stdio",
      "command": "npx", 
      "args": [
        "-y",
        "mcp-server-docker"
      ]
    },
    "mcpmcp": {
      "type": "stdio",
      "command": "npx",
      "args": ["-y", "mcp-remote@latest", "https://mcpmcp.io/mcp"]
    },
    "llm-context": {
      "type": "stdio",
      "command": "uvx",
      "args": [
        "--from",
        "llm-context",
        "lc-mcp"
      ]
    },
    "file-merger": {
      "type": "stdio",
      "command": "npx",
      "args": [
        "-y",
        "@exoticknight/mcp-file-merger",
        "${project_dir_abs}"
      ]
    },
    "everything-search": {
      "type": "stdio",
      "command": "uvx",
      "args": [
        "mcp-server-everything-search"
      ]
    },
    "server-everything": {
      "type": "stdio",
      "command": "npx",
      "args": [
        "-y",
        "@modelcontextprotocol/server-everything"
      ]
    },
    "markitdown": {
      "type": "stdio",
      "command": "uvx",
      "args": [
        "markitdown-mcp"
      ]
    },
    "1mcp-agent": {
      "type": "stdio",
      "command": "npx",
      "args": [
        "-y",
        "@1mcp/agent"
      ]
    },
    "magg": {
      "type": "stdio",
      "command": "uvx",
      "args": [
        "magg"
      ]
    },
    "open-library": {
      "type": "stdio",
      "command": "npx",
      "args": [
        "-y",
        "@8enSmith/mcp-open-library"
      ]
    },
    "manim-server": {
      "type": "stdio",
      "command": "uvx",
      "args": [
        "manim-mcp-server"
      ]
    },
    "blender-mcp": {
      "type": "stdio",
      "command": "uvx",
      "args": [
        "blender-mcp"
      ]
    },
    "bazi-mcp": {
      "type": "stdio",
      "command": "npx",
      "args": [
        "-y",
        "@cantian-ai/bazi-mcp"
      ]
    },
    "quran-mcp": {
      "type": "stdio",
      "command": "npx",
      "args": [
        "-y",
        "quran-mcp-server"
      ]
    },
    "metmuseum-mcp": {
      "type": "stdio",
      "command": "npx",
      "args": [
        "-y",
        "metmuseum-mcp"
      ]
    },
    "playwright-executeautomation": {
      "type": "stdio",
      "command": "npx",
      "args": [
        "-y",
        "@executeautomation/playwright-mcp-server"
      ]
    },
    "apple-reminders": {
      "type": "stdio",
      "command": "mcp-server-apple-reminders",
      "args": []
    },
    "youtube-transcript": {
      "type": "stdio",
      "command": "npx",
      "args": [
        "-y",
        "@kimtaeyoon83/mcp-server-youtube-transcript"
      ]
    },
    "playwright-microsoft": {
      "type": "stdio",
      "command": "npx",
      "args": [
        "@playwright/mcp@latest"
      ]
    },
    "mcp-browser-kit": {
      "type": "stdio",
      "command": "npx",
      "args": [
        "@mcp-browser-kit/server"
      ]
    },
    "apple-shortcuts": {
      "type": "stdio",
      "command": "npx",
      "args": [
        "-y",
        "mcp-server-apple-shortcuts"
      ]
    },
    "aws-pricing-mcp": {
      "type": "stdio",
      "command": "uvx",
      "args": [
        "--from",
        "git+https://github.com/trilogy-group/aws-pricing-mcp",
        "aws-pricing-mcp"
      ]
    },
    "books-mcp-server": {
      "type": "stdio",
      "command": "uvx",
      "args": [
        "--from", 
        "git+https://github.com/VmLia/books-mcp-server",
        "books-mcp-server"
      ]
    },
    "node-code-sandbox-mcp": {
      "type": "stdio",
      "command": "npx",
      "args": [
        "-y",
        "node-code-sandbox-mcp"
      ]
    },
    "mcp-server-leetcode": {
      "type": "stdio",
      "command": "npx",
      "args": [
        "-y",
        "@mcpfun/mcp-server-leetcode"
      ]
    },
    "codemcp": {
      "type": "stdio",
      "command": "uvx",
      "args": [
        "--from",
        "git+https://github.com/ezyang/codemcp@prod",
        "codemcp"
      ]
    },
    "leetcode-mcp-server": {
      "type": "stdio",
      "command": "npx",
      "args": [
        "-y",
        "@jinzcdev/leetcode-mcp-server"
      ]
    },
    "code-to-tree": {
      "type": "stdio",
      "command": "code-to-tree",
      "args": []
    },
    "serena": {
      "type": "stdio",
      "command": "uvx",
      "args": [
        "serena"
      ]
    },
    "code-assistant": {
      "type": "stdio",
      "command": "code-assistant",
      "args": []
    },
    "maxmsp-mcp-server": {
      "type": "stdio",
      "command": "uvx",
      "args": [
        "--from",
        "git+https://github.com/tiianhk/MaxMSP-MCP-Server",
        "maxmsp-mcp-server"
      ]
    },
    "vertex-developer": {
      "type": "stdio",
      "command": "developer",
      "args": []
    },
    "mcp-server-notify": {
      "type": "stdio",
      "command": "uvx",
      "args": [
        "mcp-server-notify"
      ]
    },
    "opendata-mcp": {
      "type": "stdio",
      "command": "uvx",
      "args": [
        "--from",
        "git+https://github.com/OpenDataMCP/OpenDataMCP",
        "odmcp"
      ]
    },
    "dicom-mcp": {
      "type": "stdio",
      "command": "uvx",
      "args": [
        "dicom-mcp"
      ]
    },
    "mongodb-lens": {
      "type": "stdio",
      "command": "npx",
      "args": [
        "-y",
        "mongodb-lens"
      ]
    },
    "mcp-sqlite": {
      "type": "stdio",
      "command": "npx",
      "args": [
        "-y",
        "mcp-sqlite",
        "/tmp/example.db"
      ]
    },
    "mcp-server-duckdb": {
      "type": "stdio",
      "command": "uvx",
      "args": [
        "mcp-server-duckdb",
        "--db-path",
        "/tmp/example.duckdb"
      ]
    },
    "mongo-mcp": {
      "type": "stdio",
      "command": "npx",
      "args": [
        "-y",
        "mongo-mcp",
        "mongodb://localhost:27017/test"
      ]
    },
    "prisma-mcp": {
      "type": "stdio",
      "command": "npx",
      "args": [
        "-y",
        "prisma",
        "mcp"
      ]
    },
    "mcp-server-qdrant": {
      "type": "stdio",
      "command": "uvx",
      "args": [
        "mcp-server-qdrant"
      ],
      "env": {
        "QDRANT_URL": "http://localhost:6333",
        "COLLECTION_NAME": "default"
      }
    },
    "quarkus-jdbc": {
      "type": "stdio",
      "command": "jbang",
      "args": [
        "jdbc@quarkiverse/quarkus-mcp-servers",
        "jdbc:sqlite::memory:"
      ]
    },
    "redis-mcp-server": {
      "type": "stdio",
      "command": "uvx",
      "args": [
        "redis-mcp-server",
        "--url",
        "redis://localhost:6379/0"
      ]
    },
    "mcp-alchemy": {
      "type": "stdio",
      "command": "uvx",
      "args": [
        "--from",
        "mcp-alchemy",
        "--with",
        "sqlite",
        "mcp-alchemy"
      ],
      "env": {
        "DB_URL": "sqlite:///tmp/example.db"
      }
    },
    "aseprite-mcp": {
      "type": "stdio",
      "command": "uvx",
      "args": [
        "--from",
        "git+https://github.com/diivi/aseprite-mcp",
        "aseprite-mcp"
      ]
    },
    "oorlogsbronnen-server": {
      "type": "stdio",
      "command": "npx",
      "args": [
        "-y",
        "oorlogsbronnen-mcp"
      ]
    },
    "anilist-mcp": {
      "type": "stdio",
      "command": "npx",
      "args": [
        "-y",
        "anilist-mcp"
      ]
    },
    "biomcp": {
      "type": "stdio",
      "command": "uv",
      "args": [
        "run",
        "--with",
        "biomcp-python",
        "biomcp",
        "run"
      ]
    },
    "biothings-mcp": {
      "type": "stdio",
      "command": "uvx",
      "args": [
        "biothings-mcp"
      ]
    },
    "gget-mcp": {
      "type": "stdio",
      "command": "uvx",
      "args": [
        "--from",
        "gget-mcp@latest",
        "stdio"
      ]
    },
    "opengenes-mcp": {
      "type": "stdio",
      "command": "uvx",
      "args": [
        "opengenes-mcp"
      ]
    },
    "server-puppeteer": {
      "type": "stdio",
      "command": "npx",
      "args": [
        "-y",
        "@modelcontextprotocol/server-puppeteer"
      ]
    },
    "filesystem": {
      "type": "stdio",
      "command": "npx",
      "args": [
        "-y",
        "@modelcontextprotocol/server-filesystem",
        "${project_dir_abs}"
      ]
    },
    "archbee": {
      "type": "stdio",
      "command": "npx",
      "args": [
        "-y",
        "@archbee/mcp"
      ],
      "env": {
        "API_BASE": "https://docs.example.com/"
      }
    },
    "fetch": {
      "type": "stdio",
      "command": "uvx",
      "args": [
        "mcp-server-fetch"
      ]
    },
    "git": {
      "type": "stdio",
      "command": "uvx",
      "args": [
        "mcp-server-git"
      ]
    },
    "time": {
      "type": "stdio",
      "command": "uvx",
      "args": [
        "mcp-server-time"
      ]
    },
    "docker-mcp": {
      "type": "stdio",
      "command": "uvx",
      "args": [
        "docker-mcp"
      ]
    },
    "openapi-mcp-server": {
      "type": "stdio",
      "command": "npx",
      "args": [
        "-y",
        "@janwilmake/openapi-mcp-server"
      ]
    },
    "pandoc": {
      "type": "stdio",
      "command": "uvx",
      "args": [
        "mcp-pandoc"
      ]
    },
    "12306-mcp": {
      "type": "stdio",
      "command": "npx",
      "args": [
        "-y",
        "12306-mcp"
      ]
    },
    "a11y-mcp": {
      "type": "stdio",
      "command": "npx",
      "args": [
        "a11y-mcp"
      ]
    },
    "actual-mcp": {
      "type": "stdio",
      "command": "npx",
      "args": [
        "-y",
        "actual-mcp"
      ]
    },
    "simple-calculator": {
      "type": "stdio",
      "command": "npx",
      "args": [
        "calculator"
      ]
    },
    "mcp-installer": {
      "type": "stdio",
      "command": "npx",
      "args": [
        "-y",
        "@anaisbetts/mcp-installer"
      ]
    },
    "npm-search-mcp-server": {
      "type": "stdio",
      "command": "uvx",
      "args": [
        "npm-search-mcp-server"
      ]
    },
    "mcp-server-sqlite-npx": {
      "type": "stdio",
      "command": "npx",
      "args": [
        "-y",
        "mcp-server-sqlite-npx",
        "/tmp/example.db"
      ]
    },
    "formula1-mcp": {
      "type": "stdio",
      "command": "npx",
      "args": [
        "-y",
        "@Panth1823/formula1-mcp"
      ]
    },
    "ptcg-mcp": {
      "type": "stdio",
      "command": "npx",
      "args": [
        "-y",
        "ptcg-mcp"
      ]
    },
    "ntfy-me-mcp": {
      "type": "stdio",
      "command": "npx",
      "args": [
        "-y",
        "ntfy-me-mcp"
      ],
      "env": {
        "NTFY_TOPIC": "mcp-notifications"
      }
    },
    "mcp-obsidian": {
      "type": "stdio",
      "command": "npx",
      "args": [
        "-y",
        "mcp-obsidian",
        "${HOME}/Documents/Notes"
      ]
    },
    "weather-mcp-server": {
      "type": "stdio",
      "command": "npx",
      "args": [
        "-y",
        "@rehmatalisayany/weather-mcp-server"
      ]
    }
  }
}
JSON

echo "Initialized MCP project at: $project_dir_abs"
echo " - Created: $project_dir_abs/.aim/memory.jsonl"
echo " - Created: $project_dir_abs/.mcp.json"
