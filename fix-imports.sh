#!/bin/bash

echo "🔧 Fixing chat-store import paths in sparka-main..."

# Files and their relative depths to lib/stores/chat-store
declare -A files_and_paths=(
    ["/Users/jeremyalston/opulent-tasteofgod/sparka-main/providers/message-tree-provider.tsx"]="../lib/stores/chat-store"
    ["/Users/jeremyalston/opulent-tasteofgod/sparka-main/hooks/use-auto-resume.ts"]="../lib/stores/chat-store"
    ["/Users/jeremyalston/opulent-tasteofgod/sparka-main/components/toolbar.tsx"]="../lib/stores/chat-store"
    ["/Users/jeremyalston/opulent-tasteofgod/sparka-main/components/retry-button.tsx"]="../lib/stores/chat-store"
    ["/Users/jeremyalston/opulent-tasteofgod/sparka-main/components/response-error-message.tsx"]="../lib/stores/chat-store"
    ["/Users/jeremyalston/opulent-tasteofgod/sparka-main/components/multimodal-input.tsx"]="../lib/stores/chat-store"
    ["/Users/jeremyalston/opulent-tasteofgod/sparka-main/components/messages.tsx"]="../lib/stores/chat-store"
    ["/Users/jeremyalston/opulent-tasteofgod/sparka-main/components/message.tsx"]="../lib/stores/chat-store"
    ["/Users/jeremyalston/opulent-tasteofgod/sparka-main/components/message-actions.tsx"]="../lib/stores/chat-store"
    ["/Users/jeremyalston/opulent-tasteofgod/sparka-main/components/chat.tsx"]="../lib/stores/chat-store"
    ["/Users/jeremyalston/opulent-tasteofgod/sparka-main/components/artifact.tsx"]="../lib/stores/chat-store"
    ["/Users/jeremyalston/opulent-tasteofgod/sparka-main/artifacts/text/client.tsx"]="../../lib/stores/chat-store"
    ["/Users/jeremyalston/opulent-tasteofgod/sparka-main/artifacts/code/client.tsx"]="../../lib/stores/chat-store"
)

# Fix each file
for file in "${!files_and_paths[@]}"; do
    relative_path="${files_and_paths[$file]}"
    echo "Fixing: $file"
    
    # Use sed to replace the import
    sed -i.bak "s|from '@/lib/stores/chat-store'|from '$relative_path'|g" "$file"
    
    # Remove backup file
    rm "$file.bak" 2>/dev/null || true
    
    echo "✅ Fixed: $(basename "$file")"
done

echo "🎉 All import paths fixed!"