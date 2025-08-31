#!/bin/bash

echo "🔧 Fixing JavaScript and CSS file references..."
echo "=============================================="

cd static

# Fix Splide JavaScript references
echo "📝 Fixing Splide JavaScript references..."
find . -name "*.html" -exec sed -i '' 's|splide.min.js?ver=[^"]*|splide.min.js|g' {} \;

# Fix Bricks JavaScript references  
echo "📝 Fixing Bricks JavaScript references..."
find . -name "*.html" -exec sed -i '' 's|bricks.min.js?ver=[^"]*|bricks.min.js|g' {} \;

# Fix Splide CSS references
echo "📝 Fixing Splide CSS references..."
find . -name "*.html" -exec sed -i '' 's|splide-layer.min.css?ver=[^"]*|splide-layer.min.css|g' {} \;

# Fix other common JavaScript references
echo "📝 Fixing other JavaScript references..."
find . -name "*.html" -exec sed -i '' 's|jquery.min.js?ver=[^"]*|jquery.min.js|g' {} \;
find . -name "*.html" -exec sed -i '' 's|jquery-migrate.min.js?ver=[^"]*|jquery-migrate.min.js|g' {} \;

# Fix other CSS references
echo "📝 Fixing other CSS references..."
find . -name "*.html" -exec sed -i '' 's|frontend-layer.min.css?ver=[^"]*|frontend-layer.min.css|g' {} \;
find . -name "*.html" -exec sed -i '' 's|bricks-advanced-themer.css?ver=[^"]*|bricks-advanced-themer.css|g' {} \;

echo "✅ JavaScript and CSS references fixed successfully!"
echo "🎯 Your slider should now work properly!"
echo ""
echo "🔍 Files updated:"
find . -name "*.html" -exec grep -l "splide.min.js\|bricks.min.js" {} \; | wc -l | xargs echo "   - HTML files processed:"
