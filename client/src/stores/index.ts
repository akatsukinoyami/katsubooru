import { Writable, writable } from "svelte/store";

export { alerts } from "./alerts";
export { currentUser } from "./currentUser";
export { entities } from "./entities";
export { tags } from "./tags";

export const lang = writable('en');
export const title = writable('Katsubooru');
export const debug: Writable<any> = writable('');
