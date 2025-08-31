#!/bin/bash

echo "🔧 Starting website optimization..."

# Install required tools
if ! command -v imagemagick &> /dev/null; then
    echo "Installing ImageMagick..."
    brew install imagemagick
fi

if ! command -v jpegoptim &> /dev/null; then
    echo "Installing jpegoptim..."
    brew install jpegoptim
fi

if ! command -v optipng &> /dev/null; then
    echo "Installing optipng..."
    brew install optipng
fi

# Optimize images
echo "🖼️  Optimizing images..."
find downloads -type f \( -iname "*.jpg" -o -iname "*.jpeg" \) -exec jpegoptim --strip-all --max=85 {} \;
find downloads -type f -iname "*.png" -exec optipng -o5 {} \;

# Convert images to WebP
echo "🔄 Converting images to WebP..."
find downloads -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) | while read file; do
    if [[ "$file" == *.jpg ]] || [[ "$file" == *.jpeg ]]; then
        convert "$file" "${file%.*}.webp"
    elif [[ "$file" == *.png ]]; then
        convert "$file" "${file%.*}.webp"
    fi
done

# Minify CSS
echo "🎨 Minifying CSS..."
find downloads -name "*.css" -exec sh -c '
    for file do
        echo "Minifying $file"
        # Remove comments and extra whitespace
        sed "s|/\*.*\*/||g" "$file" | tr -s " " | sed "s/^[[:space:]]*//g" > "${file}.min"
        mv "${file}.min" "$file"
    done
' sh {} +

# Minify JavaScript
echo "⚡ Minifying JavaScript..."
find downloads -name "*.js" -exec sh -c '
    for file do
        echo "Minifying $file"
        # Basic JS minification
        sed "s|//.*||g" "$file" | tr -s " " | sed "s/^[[:space:]]*//g" > "${file}.min"
        mv "${file}.min" "$file"
    done
' sh {} +

# Create optimized static version
echo "📦 Creating optimized static version..."
cp -r downloads/* static/

# Add performance optimizations
cat > static/performance.js << 'PERFJS'
// Performance optimizations
document.addEventListener('DOMContentLoaded', function() {
    // Lazy load images
    const images = document.querySelectorAll('img[data-src]');
    const imageObserver = new IntersectionObserver((entries, observer) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                const img = entry.target;
                img.src = img.dataset.src;
                img.classList.remove('lazy');
                imageObserver.unobserve(img);
            }
        });
    });
    
    images.forEach(img => imageObserver.observe(img));
    
    // Preload critical resources
    const criticalResources = [
        '/wp-content/uploads/2025/02/logo-02-1024x618.jpg',
        '/wp-content/uploads/2025/05/logo-02-1024x618.jpg'
    ];
    
    criticalResources.forEach(resource => {
        const link = document.createElement('link');
        link.rel = 'preload';
        link.href = resource;
        link.as = 'image';
        document.head.appendChild(link);
    });
});
PERFJS

# Create service worker for caching
cat > static/sw.js << 'SWJS'
const CACHE_NAME = 'clicko-v1';
const urlsToCache = [
    '/',
    '/about-us/',
    '/wp-content/uploads/2025/02/logo-02-1024x618.jpg'
];

self.addEventListener('install', event => {
    event.waitUntil(
        caches.open(CACHE_NAME)
            .then(cache => cache.addAll(urlsToCache))
    );
});

self.addEventListener('fetch', event => {
    event.respondWith(
        caches.match(event.request)
            .then(response => response || fetch(event.request))
    );
});
SWJS

# Create optimized HTML template
cat > static/optimize-html.html << 'HTMLTEMPLATE'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Clicko Digital - Optimized</title>
    
    <!-- Preload critical resources -->
    <link rel="preload" href="/wp-content/uploads/2025/02/logo-02-1024x618.jpg" as="image">
    
    <!-- Inline critical CSS -->
    <style>
        /* Critical CSS here */
        body { margin: 0; font-family: Arial, sans-serif; }
        .header { background: #24223E; color: white; padding: 1rem; }
        .hero { text-align: center; padding: 3rem 1rem; }
        .hero img { max-width: 100%; height: auto; }
    </style>
    
    <!-- Defer non-critical CSS -->
    <link rel="preload" href="/wp-content/themes/bricks/assets/css/bricks-advanced-themer.css" as="style" onload="this.onload=null;this.rel='stylesheet'">
    <noscript><link rel="stylesheet" href="/wp-content/themes/bricks/assets/css/bricks-advanced-themer.css"></noscript>
</head>
<body>
    <div class="header">
        <h1>Clicko Digital</h1>
    </div>
    
    <div class="hero">
        <img src="/wp-content/uploads/2025/02/logo-02-1024x618.jpg" alt="Clicko Digital Logo">
        <h2>Digital Excellence</h2>
    </div>
    
    <!-- Defer JavaScript -->
    <script src="/performance.js" defer></script>
    
    <!-- Service Worker Registration -->
    <script>
        if ('serviceWorker' in navigator) {
            navigator.serviceWorker.register('/sw.js');
        }
    </script>
</body>
</html>
HTMLTEMPLATE

echo "✅ Optimization completed!"
echo "📊 Results saved in 'static' directory"
echo "🚀 Your optimized website is ready!"
