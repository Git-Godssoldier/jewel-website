# GPT-Image-1 MCP Server Installation Guide

## Overview
The gpt-image-1 MCP server has been successfully installed and configured in your Claude Desktop environment. This server provides access to OpenAI's advanced image generation capabilities through the Model Context Protocol.

## Installation Summary

### What Was Added
- **Package**: `@cloudwerxlab/gpt-image-1-mcp`
- **Server Name**: `gpt-image-1`
- **Output Directory**: `~/Pictures/ai-generated-images`

### Configurations Updated
1. **~/.claude.json** - Main Claude configuration
2. **~/opulent-tasteofgod/claude-mcp-servers-to-add.json** - Already had the configuration

## Features

### 1. Image Generation (`create_image`)
Generate high-quality images from text prompts using OpenAI's gpt-image-1 model.

**Parameters:**
- `prompt` (required): Text description of the image
- `size` (optional): "1024x1024", "1536x1024", or "1024x1536"
- `quality` (optional): "standard" or "hd"
- `n` (optional): Number of images (1-10)
- `style` (optional): "vivid" or "natural"
- `response_format` (optional): "url" or "b64_json"
- `background` (optional): "transparent" for transparent backgrounds

### 2. Image Editing (`create_image_edit`)
Edit existing images by providing a prompt and optionally a mask.

**Parameters:**
- `image`: Object with `filePath` to the original image
- `prompt`: Description of the changes
- `mask` (optional): Object with `filePath` to the mask image
- `size` (optional): Output size
- `n` (optional): Number of variations

## Usage Examples

### Generate a New Image
```javascript
<use_mcp_tool>
  <server_name>gpt-image-1</server_name>
  <tool_name>create_image</tool_name>
  <arguments>
    {
      "prompt": "A serene Japanese garden with cherry blossoms and a koi pond",
      "size": "1024x1024",
      "quality": "hd",
      "style": "vivid"
    }
  </arguments>
</use_mcp_tool>
```

### Edit an Existing Image
```javascript
<use_mcp_tool>
  <server_name>gpt-image-1</server_name>
  <tool_name>create_image_edit</tool_name>
  <arguments>
    {
      "image": {
        "filePath": "/path/to/original.png"
      },
      "prompt": "Add a rainbow in the sky",
      "size": "1024x1024"
    }
  </arguments>
</use_mcp_tool>
```

## Environment Variables
- `OPENAI_API_KEY`: Your OpenAI API key (configured)
- `GPT_IMAGE_OUTPUT_DIR`: Where generated images are saved

## Next Steps
1. Restart Claude Desktop to activate the MCP server
2. Test the image generation capabilities
3. Generated images will be saved to `~/Pictures/ai-generated-images`

## Troubleshooting
If the server doesn't work after restart:
1. Check the Claude logs for any errors
2. Verify your OpenAI API key has access to gpt-image-1
3. Ensure the output directory exists and is writable
4. Try running manually: `npx -y @cloudwerxlab/gpt-image-1-mcp`

## Security Note
The OpenAI API key is stored in your local Claude configuration. Ensure your system is secure and don't share your configuration files.