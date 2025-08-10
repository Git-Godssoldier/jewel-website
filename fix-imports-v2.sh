#!/bin/bash

echo "🔧 Fixing chat-store import paths in sparka-main..."

# Define files that need ../lib/stores/chat-store (1 level deep)
FILES_ONE_LEVEL=(
    "/Users/jeremyalston/opulent-tasteofgod/sparka-main/providers/message-tree-provider.tsx"
    "/Users/jeremyalston/opulent-tasteofgod/sparka-main/hooks/use-auto-resume.ts"
    "/Users/jeremyalston/opulent-tasteofgod/sparka-main/components/toolbar.tsx"
    "/Users/jeremyalston/opulent-tasteofgod/sparka-main/components/retry-button.tsx"
    "/Users/jeremyalston/opulent-tasteofgod/sparka-main/components/response-error-message.tsx"
    "/Users/jeremyalston/opulent-tasteofgod/sparka-main/components/multimodal-input.tsx"
    "/Users/jeremyalston/opulent-tasteofgod/sparka-main/components/messages.tsx"
    "/Users/jeremyalston/opulent-tasteofgod/sparka-main/components/message.tsx"
    "/Users/jeremyalston/opulent-tasteofgod/sparka-main/components/message-actions.tsx"
    "/Users/jeremyalston/opulent-tasteofgod/sparka-main/components/chat.tsx"
    "/Users/jeremyalston/opulent-tasteofgod/sparka-main/components/artifact.tsx"
)

# Define files that need ../../lib/stores/chat-store (2 levels deep)
FILES_TWO_LEVEL=(
    "/Users/jeremyalston/opulent-tasteofgod/sparka-main/artifacts/text/client.tsx"
    "/Users/jeremyalston/opulent-tasteofgod/sparka-main/artifacts/code/client.tsx"
    "/Users/jeremyalston/opulent-tasteofgod/sparka-main/artifacts/sheet/client.tsx"
)

# Fix files that are 1 level deep
for file in "${FILES_ONE_LEVEL[@]}"; do
    if [ -f "$file" ]; then
        echo "Fixing (1 level): $(basename "$file")"
        sed -i.bak "s|from '@/lib/stores/chat-store'|from '../lib/stores/chat-store'|g" "$file"
        rm "$file.bak" 2>/dev/null || true
        echo "✅ Fixed: $(basename "$file")"
    else
        echo "⚠️  File not found: $(basename "$file")"
    fi
done

# Fix files that are 2 levels deep  
for file in "${FILES_TWO_LEVEL[@]}"; do
    if [ -f "$file" ]; then
        echo "Fixing (2 levels): $(basename "$file")"
        sed -i.bak "s|from '@/lib/stores/chat-store'|from '../../lib/stores/chat-store'|g" "$file"
        rm "$file.bak" 2>/dev/null || true
        echo "✅ Fixed: $(basename "$file")"
    else
        echo "⚠️  File not found: $(basename "$file")"
    fi
done

echo "🎉 All import paths fixed!"