import type HeadersInterface from "../interfaces/headers";
import type RequestParameters from "../interfaces/request.parameters";
import { currentUser } from "../stores/currentUser";
import alertsHandler from "./alerts";

function headers(): HeadersInterface {
  const headers = { 'Content-Type': 'application/json' };
  currentUser.subscribe((user) => {
    if (user?.token) {
      headers['Authorization'] = user.token
    }
  })()

  return headers;
}

export async function GET({
  path, callbackFn = () => {},
}: RequestParameters): Promise<any> {
  try {
    const response = await fetch(location.origin + path, {
      method: 'GET',
      headers: headers(),
    });
    const json = await response.json();

    if (json?.errors) {
      alertsHandler.showErrors(json.errors);
    } else {
      callbackFn(json);
    };

    return json;
  } catch (error) {
    alertsHandler.showError(error);
  }
}

export async function POST({
  path, body, callbackFn = () => {}
}: RequestParameters): Promise<any> {
  try {
    const response = await fetch(location.origin + path, {
      method: 'POST',
      headers: headers(),
      body: JSON.stringify(body),
    });
    const json = await response.json();

    if (json?.errors) {
      alertsHandler.showErrors(json.errors);
    } else {
      callbackFn(json);
    };

    return json;
  } catch (error) {
    alertsHandler.showError(error);
  }
}
