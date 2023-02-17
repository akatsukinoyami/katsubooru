import { readable } from 'svelte/store';
import { GET } from '../functions/request';

export const tags = readable({ artists: [], titles: [], characters: [], tags: [] },
  (set) => {
    GET({ path: '/api/tags', callbackFn: (json) => { set(json) } });
    return () => { set = () => {} }; // see big comment
  })

// We override the `set` function to eliminate race conditions
// This does *not* abort running fetch() requests, it only prevents
// them from overriding the store.
// To learn about canceling fetch requests, search the internet for `AbortController`
