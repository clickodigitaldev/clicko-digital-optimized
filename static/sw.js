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
