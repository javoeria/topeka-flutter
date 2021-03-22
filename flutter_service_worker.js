'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "39a895e3a7a21abd0145f9d76cd225db",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/fonts/MaterialIcons-Regular.otf": "1288c9e28052e028aba623321f7826ac",
"assets/images/avatars/avatar_10_raster.png": "090187baee980f71a77d1b35a0f0c3ad",
"assets/images/avatars/avatar_11_raster.png": "d171a88b54b725d83fdbc16bcf0ab886",
"assets/images/avatars/avatar_12_raster.png": "a50bf43b1489ddfb4ec656d9f8a8cd7d",
"assets/images/avatars/avatar_13_raster.png": "01f2a416073c6d305c390f71610a5381",
"assets/images/avatars/avatar_14_raster.png": "59695ee01867e886e106c123bf92005b",
"assets/images/avatars/avatar_15_raster.png": "13a141b9a5c627ae7e0e2cc59ac5e60c",
"assets/images/avatars/avatar_16_raster.png": "e2b54b1121a8fa0e862ce621b93a0875",
"assets/images/avatars/avatar_1_raster.png": "d1e34ce7d576d7893453216fde39e227",
"assets/images/avatars/avatar_2_raster.png": "ca91ea6e2f355d09554aace89b14525f",
"assets/images/avatars/avatar_3_raster.png": "2310eb3357fd6df19f0ca23a9d60312d",
"assets/images/avatars/avatar_4_raster.png": "7fe83c5632f6c3f46be328121a574bdf",
"assets/images/avatars/avatar_5_raster.png": "044f33017e96726ff27932f1319b38ca",
"assets/images/avatars/avatar_6_raster.png": "ce76faef8a8fcf3c384e897dc34e133a",
"assets/images/avatars/avatar_7_raster.png": "23560a5bf7dbea464daaf7f0efbe3f17",
"assets/images/avatars/avatar_8_raster.png": "d0b821e7c985ac6d72637864fe0d893c",
"assets/images/avatars/avatar_9_raster.png": "db7f4f2ecd8bdf73df338fb5c264356a",
"assets/images/categories/icon_category_entertainment_raster.png": "31a5b77cdc749521b077542d5c7152e7",
"assets/images/categories/icon_category_food_raster.png": "318a69e8a10d0a3126b281be2fda722a",
"assets/images/categories/icon_category_geography_raster.png": "c3e370c29d1adb6b9807ed44bd8044f3",
"assets/images/categories/icon_category_history_raster.png": "686060312d2f2093a691e92a367e6fad",
"assets/images/categories/icon_category_knowledge_raster.png": "fb6b60600e4920fce97fe61bd72b0b32",
"assets/images/categories/icon_category_leaderboard_raster.png": "ea6fc246d7b12580c991fbb2ab91bc94",
"assets/images/categories/icon_category_music_raster.png": "4ac8d8ce9f889089d4891bd2e44dca80",
"assets/images/categories/icon_category_science_raster.png": "3689aa5d3c29f4f8c089c249afb2af01",
"assets/images/categories/icon_category_sports_raster.png": "562c5b2d6e07c9ed8e29e2778f8c986f",
"assets/images/categories/icon_category_tvmovies_raster.png": "ee1548e488729341d151e7863165919d",
"assets/images/quizzes/image_category_entertainment_raster.png": "bbe3b7bd057883d2562782e63cbb7312",
"assets/images/quizzes/image_category_food_raster.png": "f3bd2585097572cb2ea051664bcac433",
"assets/images/quizzes/image_category_geography_raster.png": "100d722dce358bc7cab50788057b10f4",
"assets/images/quizzes/image_category_history_raster.png": "bea0d8f16e2d3e8f7ba1294788f28a79",
"assets/images/quizzes/image_category_knowledge_raster.png": "dede4e71cda2c004fad474b10a679826",
"assets/images/quizzes/image_category_music_raster.png": "545994ebe67a6921e2c8476df3337b4f",
"assets/images/quizzes/image_category_science_raster.png": "afc8c5bd029bc75efa058fd51d0c8890",
"assets/images/quizzes/image_category_sports_raster.png": "b9c53bfc853070f5c33184d7b2de63b7",
"assets/images/quizzes/image_category_tvmovies_raster.png": "38fabf8d47fe8b46beb10f7a3308183e",
"assets/NOTICES": "0753f952aa8b86d4529ed751b568c649",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"index.html": "7584ef31b6ab8e443b81ef23faf18512",
"/": "7584ef31b6ab8e443b81ef23faf18512",
"main.dart.js": "86edfbabe16ced733ed373a06c4a4334",
"manifest.json": "acfb6571e26348bf94bc740a0bed3a00",
"version.json": "4fcaedbd3ef359a43c43f62aa6c514f7"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value + '?revision=' + RESOURCES[value], {'cache': 'reload'})));
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
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
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
