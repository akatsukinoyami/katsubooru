import { Writable, writable } from "svelte/store";

export const lang = writable('en');
export const alerts = writable([]);
export const title = writable('Katsubooru');
export const debug: Writable<any> = writable('');
