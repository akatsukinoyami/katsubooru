import { get, Writable, writable } from "svelte/store";

const storedCurrentUser = JSON.parse(localStorage.getItem("currentUser"));

interface currentUserInterface extends Writable<any> {
  exists: () => boolean;
}

export const currentUser: currentUserInterface = {
  ...writable(storedCurrentUser || {}),
  exists: function(){
    return Object.keys(get(this)).length > 0;
  }
}

currentUser.subscribe((value) => {
  localStorage.setItem("currentUser", JSON.stringify(value))
});
