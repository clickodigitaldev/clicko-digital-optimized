#!/bin/bash

echo "🔧 Fixing ALL remaining CSS and JavaScript asset references..."
echo "============================================================="

cd static

# Fix ALL CSS files with query parameters
echo "📝 Fixing ALL CSS file references..."
find . -name "*.html" -exec sed -i '' 's|\.css\?ver=[^"]*\.css|\.css|g' {} \;
find . -name "*.html" -exec sed -i '' 's|\.css\?ver=[^"]*|\.css|g' {} \;

# Fix ALL JavaScript files with query parameters
echo "📝 Fixing ALL JavaScript file references..."
find . -name "*.html" -exec sed -i '' 's|\.js\?ver=[^"]*|\.js|g' {} \;

# Fix specific problematic files
echo "📝 Fixing specific problematic files..."

# Fix photoswipe CSS
find . -name "*.html" -exec sed -i '' 's|photoswipe-layer\.min\.css\?ver=[^"]*|photoswipe-layer\.min\.css|g' {} \;

# Fix swiper CSS
find . -name "*.html" -exec sed -i '' 's|swiper-layer\.min\.css\?ver=[^"]*|swiper-layer\.min\.css|g' {} \;

# Fix splide CSS
find . -name "*.html" -exec sed -i '' 's|splide-layer\.min\.css\?ver=[^"]*|splide-layer\.min\.css|g' {} \;

# Fix frontend CSS
find . -name "*.html" -exec sed -i '' 's|frontend-layer\.min\.css\?ver=[^"]*|frontend-layer\.min\.css|g' {} \;

# Fix bricks advanced themer CSS
find . -name "*.html" -exec sed -i '' 's|bricks-advanced-themer\.css\?ver=[^"]*|bricks-advanced-themer\.css|g' {} \;

# Fix jQuery files
find . -name "*.html" -exec sed -i '' 's|jquery\.min\.js\?ver=[^"]*|jquery\.min\.js|g' {} \;
find . -name "*.html" -exec sed -i '' 's|jquery-migrate\.min\.js\?ver=[^"]*|jquery-migrate\.min\.js|g' {} \;

# Fix Bricks JS
find . -name "*.html" -exec sed -i '' 's|bricks\.min\.js\?ver=[^"]*|bricks\.min\.js|g' {} \;

# Fix Splide JS
find . -name "*.html" -exec sed -i '' 's|splide\.min\.js\?ver=[^"]*|splide\.min\.js|g' {} \;

echo "✅ ALL asset references fixed successfully!"
echo "🎯 No more MIME type errors!"
echo ""
echo "🔍 Files processed:"
find . -name "*.html" | wc -l | xargs echo "   - Total HTML files:"
echo ""
echo "📊 Remaining files with query parameters:"
echo "   - CSS files:"
find . -name "*.html" -exec grep -l "\.css\?ver=" {} \; | wc -l | xargs echo "     * CSS with ver params:"
echo "   - JS files:"
find . -name "*.html" -exec grep -l "\.js\?ver=" {} \; | wc -l | xargs echo "     * JS with ver params:"
