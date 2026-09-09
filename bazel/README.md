# bazel config

- Configures aggressive disk cache garbage collection (50GB max, 30-day expiry)
- Enables async remote caching with compression and chunking
- Minimizes remote artifact downloads

## Files

- **`.bazelrc`**
  - `--experimental_disk_cache_gc_max_size=50G` - Caps local disk cache at 50GB
  - `--experimental_disk_cache_gc_max_age=30d` - Evicts cache entries older than 30 days
  - `--experimental_disk_cache_gc_idle_delay=5m` - Waits 5 minutes idle before running GC
  - `--remote_cache_async` - Uploads to remote cache asynchronously
  - `--remote_cache_compression` - Compresses remote cache blobs
  - `--experimental_remote_cache_chunking` - Enables chunked remote cache transfers
  - `--remote_download_minimal` - Only downloads needed outputs from remote builds

## Docs

- [.bazelrc Reference](https://bazel.build/run/bazelrc)
