export function getValueById(id: string): string {
  const element = document.getElementById(id) as HTMLInputElement;
  return element.value;
}
