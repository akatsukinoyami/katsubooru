import { get, readable, writable, derived, Readable } from 'svelte/store';
import { GET } from './functions/request';
import type EntityInterface from './interfaces/entity';

const storedCurrentUser = JSON.parse(localStorage.getItem("currentUser"));

export const lang = writable('en');
export const alerts = writable([]);
export const title = writable('Katsubooru');
export const currentUser = writable(storedCurrentUser || {});

export const tags = readable({ artists: [], titles: [], characters: [], tags: [] },
  (set) => {
    GET({ path: '/api/tags', callbackFn: (json) => { set(json) } });
    return () => { set = () => {} }; // see big comment
  })

export const entities = derived(
  currentUser,
  ($currentUser, set) => {
    GET({ path: '/api/entities', callbackFn: (json) => { set([...get(entities), ...json]) } });
    return () => { set = () => {} }; // see big comment
  }, [],
) as Readable<EntityInterface[]>;


// We override the `set` function to eliminate race conditions
// This does *not* abort running fetch() requests, it only prevents
// them from overriding the store.
// To learn about canceling fetch requests, search the internet for `AbortController`

currentUser.subscribe((value) => {
  localStorage.setItem("currentUser", JSON.stringify(value))
});
