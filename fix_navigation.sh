#!/bin/bash

echo "🔧 Fixing navigation links to use proper static URLs..."

cd static

# Fix navigation links to point to correct static URLs
echo "📝 Updating navigation links..."

# Fix main navigation links
find . -name "*.html" -exec sed -i '' 's|href="index.html?p=63.html"|href="about-us/"|g' {} \;
find . -name "*.html" -exec sed -i '' 's|href="index.html?p=2152.html"|href="contact-us/"|g' {} \;
find . -name "*.html" -exec sed -i '' 's|href="index.html?p=1107.html"|href="careers/"|g' {} \;
find . -name "*.html" -exec sed -i '' 's|href="index.html?p=1348.html"|href="partners/"|g' {} \;
find . -name "*.html" -exec sed -i '' 's|href="index.html?p=2644.html"|href="business-websites/"|g' {} \;
find . -name "*.html" -exec sed -i '' 's|href="index.html?p=2645.html"|href="e-commerce-development/"|g' {} \;
find . -name "*.html" -exec sed -i '' 's|href="index.html?p=2646.html"|href="web-applications/"|g' {} \;
find . -name "*.html" -exec sed -i '' 's|href="index.html?p=2648.html"|href="ai-applications/"|g' {} \;

# Fix Shopify links
find . -name "*.html" -exec sed -i '' 's|href="index.html?p=2518.html"|href="shopify-web-development/"|g' {} \;
find . -name "*.html" -exec sed -i '' 's|href="index.html?p=2560.html"|href="shopify-store-migration/"|g' {} \;
find . -name "*.html" -exec sed -i '' 's|href="index.html?p=2562.html"|href="shopify-app-development/"|g' {} \;
find . -name "*.html" -exec sed -i '' 's|href="index.html?p=2563.html"|href="shopify-ongoing-support/"|g' {} \;
find . -name "*.html" -exec sed -i '' 's|href="index.html?p=2564.html"|href="shopify-pos/"|g' {} \;

# Fix Salla links
find . -name "*.html" -exec sed -i '' 's|href="index.html?p=2570.html"|href="salla-web-development/"|g' {} \;
find . -name "*.html" -exec sed -i '' 's|href="index.html?p=2571.html"|href="salla-store-migration/"|g' {} \;
find . -name "*.html" -exec sed -i '' 's|href="index.html?p=2572.html"|href="salla-app-development/"|g' {} \;
find . -name "*.html" -exec sed -i '' 's|href="index.html?p=2573.html"|href="salla-ongoing-support/"|g' {} \;
find . -name "*.html" -exec sed -i '' 's|href="index.html?p=2574.html"|href="salla-pos/"|g' {} \;

# Fix Zid links
find . -name "*.html" -exec sed -i '' 's|href="index.html?p=2582.html"|href="zid-web-development/"|g' {} \;
find . -name "*.html" -exec sed -i '' 's|href="index.html?p=2583.html"|href="zid-store-migration/"|g' {} \;
find . -name "*.html" -exec sed -i '' 's|href="index.html?p=2584.html"|href="zid-app-development/"|g' {} \;
find . -name "*.html" -exec sed -i '' 's|href="index.html?p=2585.html"|href="zid-ongoing-support/"|g' {} \;
find . -name "*.html" -exec sed -i '' 's|href="index.html?p=2586.html"|href="zid-pos/"|g' {} \;

# Fix WooCommerce links
find . -name "*.html" -exec sed -i '' 's|href="index.html?p=2594.html"|href="woocommerce-web-development/"|g' {} \;
find . -name "*.html" -exec sed -i '' 's|href="index.html?p=2595.html"|href="woocommerce-store-migration/"|g' {} \;
find . -name "*.html" -exec sed -i '' 's|href="index.html?p=2596.html"|href="woocommerce-app-development/"|g' {} \;
find . -name "*.html" -exec sed -i '' 's|href="index.html?p=2597.html"|href="woocommerce-ongoing-support/"|g' {} \;
find . -name "*.html" -exec sed -i '' 's|href="index.html?p=2598.html"|href="woocommerce-pos/"|g' {} \;

# Fix Mobile Apps links
find . -name "*.html" -exec sed -i '' 's|href="index.html?p=2606.html"|href="shopify-mobile-apps/"|g' {} \;
find . -name "*.html" -exec sed -i '' 's|href="index.html?p=2607.html"|href="salla-mobile-apps/"|g' {} \;
find . -name "*.html" -exec sed -i '' 's|href="index.html?p=2608.html"|href="zid-mobile-apps/"|g' {} \;
find . -name "*.html" -exec sed -i '' 's|href="index.html?p=2609.html"|href="woocommerce-mobile-apps/"|g' {} \;
find . -name "*.html" -exec sed -i '' 's|href="index.html?p=2610.html"|href="mobile-apps-maintenance/"|g' {} \;

# Fix Design links
find . -name "*.html" -exec sed -i '' 's|href="index.html?p=2618.html"|href="logo-brand-identity/"|g' {} \;
find . -name "*.html" -exec sed -i '' 's|href="index.html?p=2619.html"|href="web-app-design/"|g' {} \;
find . -name "*.html" -exec sed -i '' 's|href="index.html?p=2620.html"|href="print-design/"|g' {} \;
find . -name "*.html" -exec sed -i '' 's|href="index.html?p=2621.html"|href="packaging-covers/"|g' {} \;
find . -name "*.html" -exec sed -i '' 's|href="index.html?p=2622.html"|href="marketing-design/"|g' {} \;

# Fix Marketing links
find . -name "*.html" -exec sed -i '' 's|href="index.html?p=2630.html"|href="search-engine-optimization-seo/"|g' {} \;
find . -name "*.html" -exec sed -i '' 's|href="index.html?p=2631.html"|href="google-advertising/"|g' {} \;
find . -name "*.html" -exec sed -i '' 's|href="index.html?p=2632.html"|href="social-media-advertising/"|g' {} \;
find . -name "*.html" -exec sed -i '' 's|href="index.html?p=2633.html"|href="influencer-marketing/"|g' {} \;
find . -name "*.html" -exec sed -i '' 's|href="index.html?p=2634.html"|href="e-commerce-marketing/"|g' {} \;

# Fix Portfolio links
find . -name "*.html" -exec sed -i '' 's|href="index.html?p=6835.html"|href="case-study-web-app-ethos-custom-dashboard/"|g' {} \;

# Fix Blog links
find . -name "*.html" -exec sed -i '' 's|href="index.html?p=8097.html"|href="the-future-of-e-commerce-how-emerging-technologies-are-redefining-digital-retail/"|g' {} \;
find . -name "*.html" -exec sed -i '' 's|href="index.html?p=7259.html"|href="salla-revolutionizing-e-commerce-with-a-modern-developer-friendly-platform/"|g' {} \;
find . -name "*.html" -exec sed -i '' 's|href="index.html?p=7265.html"|href="woocommerce-shipping-streamlining-your-e-commerce-logistics-for-success/"|g' {} \;

echo "✅ Navigation links updated successfully!"
echo "🌐 Your website now has proper static URLs that match WordPress structure!"
