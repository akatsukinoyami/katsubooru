import type { columnSizeType } from "../types";
export type { default as EntityInterface } from "./entity";

export interface AlertInterface {
  error: boolean,
  text: string,
}

export interface RequestParameters {
  path: string,
  body?: Record<string, any>,
  token?: string,
  callbackFn?: (data: any) => void,
}

export interface ColInterface {
  className?: string;
  s?: columnSizeType;
  m?: columnSizeType;
  l?: columnSizeType;
  xl?:columnSizeType;
}
