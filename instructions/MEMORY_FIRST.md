## Claude Code Assistant Instructions

### ALWAYS Use Efficient Tools First
When working with this codebase, use these MCP tools instead of default alternatives:

#### Project Analysis and Context
```bash
# Get project overview and structure
mcp__st__quick_tree /path/to/project
mcp__st__project_overview /path/to/project

# Analyze entire codebase efficiently
mcp__st__analyze_directory /path/to/project --mode=ai
```

#### File Operations  
```bash
# Use Desktop Commander instead of basic Read/Write
mcp__desktop-commander__read_file /path/to/file
mcp__desktop-commander__write_file /path/to/file "content"
mcp__desktop-commander__search_code /path/to/project "search_term"
```

#### Web Research
```bash
# Fast web content extraction
mcp__read-website-fast__read_website https://url.com

# Use WebSearch for current information
WebSearch "topic 2025"
```

#### Memory Management
```bash
# CRITICAL: Always check memory for project context
mcp__memory__read_graph
mcp__memory__search_nodes "deployment"
mcp__memory__open_nodes ["entity_name"]

# Update memory with new discoveries
mcp__memory__create_entities [entities]
mcp__memory__add_observations [observations]
```

### Context Recovery Process
If you need to catch up on project state:

1. **Check Memory First**: `mcp__memory__read_graph` - Contains complete context and decision history
2. **Analyze Codebase**: `mcp__st__project_overview` - Get current file state
3. **Review Deployment**: Check `helm/` directory and `Makefile` for current configuration
4. **Check Recent Changes**: `mcp__st__find_recent_changes` to see what's been modified

**NEVER start fresh analysis without first checking memory graph - it contains months of debugging and decisions.**

