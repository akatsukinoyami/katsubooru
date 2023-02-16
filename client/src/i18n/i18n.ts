import { lang } from "../stores";
import en from "./en.json";

const langs = {en}

export default function i18n(){
  let langValue: string;
  const unsubscribe = lang.subscribe((value) => langValue = value)

  if (Object.keys(langs).includes(langValue)){
    return langs[langValue]
  } else {
    return langs.en
  }
}
