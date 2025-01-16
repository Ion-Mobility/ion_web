'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"icons/Icon-maskable-192.png": "a20c04bb6e0c1f05f2d25a7126d6e041",
"icons/Icon-maskable-512.png": "f00901934fab4c44dd5aa9f112d02654",
"icons/Icon-512.png": "f00901934fab4c44dd5aa9f112d02654",
"icons/Icon-192.png": "a20c04bb6e0c1f05f2d25a7126d6e041",
"assets/assets/videos/ion_mobius_one_reveal.mp4": "33dcada8100a7247051d5bdd141b621f",
"assets/assets/videos/bike_dimension_specs_desktop.mp4": "3087d99ab239cf8b6a9e79616eeacaa1",
"assets/assets/videos/mobile-teaser.mp4": "ac6d203af43bfc38fb560d810b78ed65",
"assets/assets/videos/bike-product-frame-2.mp4": "eaf78c52b054cb9c4f0485273d04501d",
"assets/assets/videos/productPageVideo.mp4": "3e77b5eb23c227b5d27a126c8985e845",
"assets/assets/videos/Web_Hompage_12s_Video_030223.mp4": "3b35b913143dd02c3cb9f84d749da72c",
"assets/assets/videos/m1s.mp4": "62838ee0b7a208d81cdb65a8c4c18365",
"assets/assets/images/icons/apple-splash-1284-2778.jpg": "15cbbf1c62464a78eb09476f0b3e3331",
"assets/assets/images/icons/apple-splash-640-1136.jpg": "4fea035ed43768dd92199c097de3b1d6",
"assets/assets/images/icons/apple-splash-828-1792.jpg": "6c52640f4b806942663a77b88ae6b93f",
"assets/assets/images/icons/apple-splash-1170-2532.jpg": "2593aef02fa43f5e011c4e08708bd4f3",
"assets/assets/images/icons/ion_logo_white.svg": "e2073e9f862a073b2c909852971308b3",
"assets/assets/images/icons/apple-splash-2224-1668.jpg": "322b53105e164d51c5c5e3bc316b4349",
"assets/assets/images/icons/apple-splash-1242-2688.jpg": "d99dd309afab8b6b2e63d02ebb825c0d",
"assets/assets/images/icons/apple-splash-1792-828.jpg": "5b2cfc01d97c63c3bbe75c1fcdc447ff",
"assets/assets/images/icons/apple-splash-2388-1668.jpg": "1e27b1efc783183bec840a00b13cb79e",
"assets/assets/images/icons/apple-splash-2160-1620.jpg": "767bed7313ee8495fc61877576de2e9c",
"assets/assets/images/icons/apple-icon-180.png": "ce69342f740471e5e0b3b8532456b997",
"assets/assets/images/icons/apple-splash-750-1334.jpg": "b26f21f495adecffae4855cf0715047a",
"assets/assets/images/icons/apple-splash-2048-2732.jpg": "e0daaed702072b5ac3d30525247189cb",
"assets/assets/images/icons/apple-splash-1668-2388.jpg": "2183d9710995ec26206f453af73de98f",
"assets/assets/images/icons/favicon-196.png": "c2ead2756b8be815292ab2d4a43f3a13",
"assets/assets/images/icons/apple-splash-1334-750.jpg": "bc50a5be2963783bc0076936611f11cf",
"assets/assets/images/icons/logo.svg": "905187f7cfd99811aa790dd29440e9e9",
"assets/assets/images/icons/apple-splash-1242-2208.jpg": "7080beb8ab9953567d8a8fbd5ef591ed",
"assets/assets/images/icons/apple-splash-2778-1284.jpg": "a2a4bd461a8366312ccdfcb00392d40a",
"assets/assets/images/icons/apple-splash-2208-1242.jpg": "6206fdf91c05f3fe1c285f0ce2463a21",
"assets/assets/images/icons/apple-splash-2048-1536.jpg": "1ac5fbbd0c1483092aeae64d84206bfe",
"assets/assets/images/icons/apple-splash-1536-2048.jpg": "9854e8d57fa73d6e108f7ff8595ab335",
"assets/assets/images/icons/manifest-icon-192.png": "a20c04bb6e0c1f05f2d25a7126d6e041",
"assets/assets/images/icons/apple-splash-1125-2436.jpg": "eb23845d10c75d1235667726550e074f",
"assets/assets/images/icons/apple-splash-1136-640.jpg": "84a8f41fd8e870ea6a45b72d62376d70",
"assets/assets/images/icons/ion_logo_white.png": "46a032e679f6307f33768bc094144238",
"assets/assets/images/icons/apple-splash-2436-1125.jpg": "ab77af1311bfbacf5e05975e3fc7c6ec",
"assets/assets/images/icons/manifest-icon-512.png": "f00901934fab4c44dd5aa9f112d02654",
"assets/assets/images/icons/icon.png": "999676d993718e5452c5d265b9583d76",
"assets/assets/images/icons/apple-splash-1620-2160.jpg": "21717a785a7585bea54e41f41c3ee651",
"assets/assets/images/icons/apple-splash-1668-2224.jpg": "874396677f02208bff39e917709c7aa3",
"assets/assets/images/icons/apple-splash-2532-1170.jpg": "c4e0e5a3d3e373fcac3ad4fec6a12db0",
"assets/assets/images/icons/mobius.svg": "6c376423eed60a6319304877a71a057c",
"assets/assets/images/icons/apple-splash-2688-1242.jpg": "ae3b97783b9729fb3c3cad731a15e1bd",
"assets/assets/images/icons/apple-splash-2732-2048.jpg": "009f79a139da29fb42b6366cc9b00faa",
"assets/assets/images/backgrounds/m1s-4.png": "d4aa9abeda6d7ea0edc3899cc38195fe",
"assets/assets/images/backgrounds/m1s-6.png": "abe68b51e1ab04bb51e592741117d88b",
"assets/assets/images/backgrounds/m1s-near-bg.webp": "0dbc39b0ea19f6c473c7548a158cc0e7",
"assets/assets/images/backgrounds/m1s-1.png": "593c1b2747f04f627c4a2c26099da1b3",
"assets/assets/images/backgrounds/m1s-far-bg.png": "09b66f63b88b2d1bbd32e34f5b22f783",
"assets/assets/images/backgrounds/ion_Mobius.png": "146fd3ab9f5ca179e4887ffd62de6c0f",
"assets/assets/images/backgrounds/m1s-2_1200x800.jpeg": "25253ec06d090504594fbb68abc3cc5a",
"assets/assets/images/backgrounds/m1s-near-bg.png": "7d0ae0d7fea36b9fc1f6f4f8a106a5a5",
"assets/assets/images/backgrounds/m1s-5.png": "0a651c0bd5cf27550974232053a1727b",
"assets/assets/images/backgrounds/m1s-2.png": "9da345b2b17ec44525c6eaf38105e175",
"assets/assets/images/backgrounds/m1s-3.png": "308064d554affdf5f36c70cf3dbca706",
"assets/AssetManifest.bin": "921145897e80a55547fa11443fb4a48b",
"assets/NOTICES": "6772934f7ec566aeae8c35ea0b111b8d",
"assets/AssetManifest.json": "9adcc21f8ede9df287d08a3b8c17d032",
"assets/fonts/MaterialIcons-Regular.otf": "9a2ff7dad426191f652449ce47756254",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin.json": "642148262bba26a865e7dfd8002253c5",
"version.json": "4085416c45b90165387cf27038d1e36c",
"manifest.json": "dcd12ecc067005b1b7c89667b31c2271",
"canvaskit/chromium/canvaskit.js.symbols": "e115ddcfad5f5b98a90e389433606502",
"canvaskit/chromium/canvaskit.wasm": "ea5ab288728f7200f398f60089048b48",
"canvaskit/chromium/canvaskit.js": "b7ba6d908089f706772b2007c37e6da4",
"canvaskit/skwasm.js": "ac0f73826b925320a1e9b0d3fd7da61c",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"canvaskit/skwasm.js.symbols": "96263e00e3c9bd9cd878ead867c04f3c",
"canvaskit/canvaskit.js.symbols": "efc2cd87d1ff6c586b7d4c7083063a40",
"canvaskit/skwasm.wasm": "828c26a0b1cc8eb1adacbdd0c5e8bcfa",
"canvaskit/canvaskit.wasm": "e7602c687313cfac5f495c5eac2fb324",
"canvaskit/canvaskit.js": "26eef3024dbc64886b7f48e1b6fb05cf",
"index.html": "1fa5adfb1ebc84ab9e059c7c1010c99f",
"/": "1fa5adfb1ebc84ab9e059c7c1010c99f",
"flutter.js": "4b2350e14c6650ba82871f60906437ea",
"favicon.png": "c2ead2756b8be815292ab2d4a43f3a13",
"flutter_bootstrap.js": "9244673f8defbbc134506bde2acdccc7",
"main.dart.js": "7bc6ebef3ec5545c9ea4623b7816d03e"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
