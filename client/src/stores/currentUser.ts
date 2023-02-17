import { writable } from "svelte/store";

const storedCurrentUser = JSON.parse(localStorage.getItem("currentUser"));

export const currentUser = writable(storedCurrentUser || {});

currentUser.subscribe((value) => {
  localStorage.setItem("currentUser", JSON.stringify(value))
});
