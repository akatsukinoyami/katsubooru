export default interface EntityInterface {
  id: number,
  file: FileInterface,
  file_hash: string,
  link: string,
  media_type: string,
  rating: string,
  origin: string,
  user_id: number,
  artist_id: number,
  collection_id: number,
  titles: number[],
  characters: number[],
  tags: number[],
  created_at: string,
  updated_at: string,
}

export interface FileInterface {
  url: string,
  thumb: string,
}
