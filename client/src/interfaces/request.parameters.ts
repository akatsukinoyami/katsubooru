export default interface RequestParameters {
  path: string,
  body?: Record<string, any>,
  token?: string,
  callbackFn?: (data: any) => void,
}
