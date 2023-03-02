import { writable } from "svelte/store";

import { get } from "svelte/store";
import type { AlertInterface } from "../interfaces";

export const alerts = {
  ...writable([]),
  localAlerts: [],

  count(): number {
    return get<AlertInterface[]>(this).length;
  },

  delete(alertText: string): void {
    this.workWithStore(() => {
      const ourAlert = this.localAlerts.find(
        (ourAlert: AlertInterface) => {
          return ourAlert.text === alertText
        });

      const index = this.localAlerts.indexOf(ourAlert);
      if (index !== -1) {
        this.localAlerts.splice(index, 1);
      };
    });
  },

  deleteAfterTimeout(alertText: string){
    setTimeout((): void => { this.delete(alertText) }, 10000);
  },

  empty(): boolean {
    return this.count === 0;
  },

  showError(error: string): void {
    this.workWithStore(() => {
      this.localAlerts.push({ error: true, text: error });
      this.deleteAfterTimeout(error);
    });
  },

  showErrors(errors: string[]): void {
    this.workWithStore(() => {
      errors.forEach((error) => {
        this.localAlerts.push({ error: true, text: error });
        this.deleteAfterTimeout(error);
      });
    });
  },

  showNotice(notice: string): void {
    this.workWithStore(() => {
      this.localAlerts.push({ error: false, text: notice });
      this.deleteAfterTimeout(notice);
    });
  },

  showNotices(notices: string[]): void {
    this.workWithStore(() => {
      notices.forEach((notice) => {
        this.localAlerts.push({ error: false, text: notice });
        this.deleteAfterTimeout(notice);
      })
    });
  },

  workWithStore(callbackFn: () => void): void{
    const unsubscribe = this.subscribe((value: AlertInterface): void => {
      this.localAlerts = value;
    });

    callbackFn();
    this.set(this.localAlerts);
    unsubscribe();
  },
};
