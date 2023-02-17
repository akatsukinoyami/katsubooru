import { currentUser } from "../stores/currentUser";
import { POST } from "../functions/request";
import { getValueById } from "../functions/helper";
import alertsHandler from "../functions/alerts";
import i18n from "../i18n/i18n";

const t = i18n()

export async function signIn(): Promise<void> {
  await POST({
    path: '/api/auth/sign_in',
    body: {
      email:    getValueById('email'),
      password: getValueById('password'),
    },
    callbackFn: (data: Record<any, any>) => {
      if (data.name){
        currentUser.set(data);
        alertsHandler.showNotice(t.succesful.sign_in)
      }
    },
  })
}

export async function signUp(): Promise<void> {
  await POST({
    path: '/api/auth/sign_up',
    body: {
      name:     getValueById('name'),
      email:    getValueById('email'),
      password: getValueById('password'),
    },
    callbackFn: (data: Record<any, any>) => {
      if (data.name) {
        currentUser.set(data);
        alertsHandler.showNotice(t.succesful.sign_up)
      }
    },
  })
}

export function signOut(): void {
  currentUser.set({})
  alertsHandler.showNotice(t.succesful.sign_out)
}
