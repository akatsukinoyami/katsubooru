import { get } from "svelte/store";
import { lang } from "../stores";
import en from "./en";

const langs = { en }

export default function i18n(){
  const currentLang = get(lang)
  if (Object.keys(langs).includes(currentLang)){
    return langs[currentLang]
  } else {
    return langs.en
  }
}
