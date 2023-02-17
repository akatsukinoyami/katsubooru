import type { columnSizeType } from "../types";

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

export interface TagInterface{
  id: number,
  name: string,
}

export interface TagsInterface {
  artist?: TagInterface[],
  tags?: TagInterface[],
  titles?: TagInterface[],
  characters?: TagInterface[],
}
