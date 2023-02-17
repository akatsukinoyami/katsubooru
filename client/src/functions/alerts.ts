import { get } from "svelte/store";
import type { AlertInterface } from "../interfaces";
import { alerts } from "../stores";

const alertsHandler = {

  localAlerts: [],

  workWithStore: function(callbackFn: () => void): void{
    const unsubscribe = alerts.subscribe(value => {
      this.localAlerts = value;
    });

    callbackFn();
    alerts.set(this.localAlerts);
    unsubscribe();
  },

  showError: function(error: string): void {
    this.workWithStore(() => {
      this.localAlerts.push({ error: true, text: error });
      this.deleteAfterTimeout(error);
    });
  },

  showErrors: function(errors: string[]): void {
    this.workWithStore(() => {
      errors.forEach((error) => {
        this.localAlerts.push({ error: true, text: error });
        this.deleteAfterTimeout(error);
      });
    });
  },

  showNotice: function(notice: string): void {
    this.workWithStore(() => {
      this.localAlerts.push({ error: false, text: notice });
      this.deleteAfterTimeout(notice);
    });
  },

  showNotices: function(notices: string[]): void {
    this.workWithStore(() => {
      notices.forEach((notice) => {
        this.localAlerts.push({ error: false, text: notice });
        this.deleteAfterTimeout(notice);
      })
    });
  },

  deleteAfterTimeout: function(alertText: string){
    setTimeout(() => { this.delete(alertText) }, 10000);
  },

  delete: function(alertText: string): void {
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
  }
}
export default alertsHandler;
